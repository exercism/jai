build :: () {
    w := compiler_create_workspace("Target Program");
    if !w {
        print("Could not run tests.\n");
        return;
    }

    // We'll run the tests _during compilation_, thus we don't need an output executable.
    target_options := get_build_options(w);
    target_options.output_type = .NO_OUTPUT;
    set_build_options(target_options, w);

    compiler_begin_intercept(w);

    add_build_file("tests.jai", w);

    message_loop(has_run_skipped_tests_argument(target_options));

    compiler_end_intercept(w);

    set_build_options_dc(.{do_output=false});
}

#run build();

message_loop :: (run_skipped_tests: bool) {
    ran_test_procedures := false;

    while true {
        message := compiler_wait_for_message();
        if message.kind == {
          case .TYPECHECKED;
            typechecked := cast(*Message_Typechecked) message;

            for typechecked.procedure_headers {
                // Prevent running tests from files outside the exercise directory
                if !begins_with(it.expression.location.enclosing_load.fully_pathed_filename, #filepath) {
                    continue;
                }

                if has_note(it.expression, "test") {
                    array_add(*test_procedures, it.expression);
                }
            }

          case .PHASE;
            phase := cast(*Message_Phase) message;
            if phase.phase == .TYPECHECKED_ALL_WE_CAN {
                // Prevent running the tests multiple times, as the compiler might emit multiple .TYPECHECKED messages for different batches of files.
                if ran_test_procedures {
                    continue;
                }

                // Generate a main procedure that runs all test procedures, and gather the results in the context.tests array.
                builder: String_Builder;
                init_string_builder(*builder);

                append(*builder, "main :: () {");
                append(*builder, "print(\"Running tests...\\n\");");

                for test_procedures {
                    // Set the context.test_name variable to the name of the currently running test, so that assert_equal 
                    // can report it in the test results.
                    append(*builder, tprint("context.test_name = \"%\";\n", it.name));

                    // Skip tests annotated with @skip _unless_ the user has passed the -run_skipped_tests argument.
                    append(*builder, tprint("context.skip_test = %;\n", !run_skipped_tests && has_note(it, "skip")));

                    // This is the actual test invocation. The test procedure will call assert_equal, which will report
                    // the test result back to the compiler via the context.tests array.
                    append(*builder, tprint("%();", it.name));
                }

                append(*builder, "print_report();");
                append(*builder, "}");

                add_build_string(builder_to_string(*builder), message.workspace);
                add_build_string("#run main();", message.workspace);

                ran_test_procedures = true;

                array_reset(*test_procedures);
            }

          case .COMPLETE;
            break;
        }
    }
}

has_note :: (header: *Code_Procedure_Header, note: string) -> bool {
    for header.notes  if it.text == note  return true;
    return false;
}

// Check if the user has passed the -run_skipped_tests argument to the compiler, 
// which forces the test runner to execute _all_ tests, including those marked with @skip.
has_run_skipped_tests_argument :: (target_options: Build_Options) -> bool {
    for target_options.compile_time_command_line  if it == "-run_skipped_tests"  return true;
    return false;
}

test_procedures: [..] *Code_Procedure_Header;

#import "Basic";
#import "Compiler";
#import "String";
