build :: () {
    w := compiler_create_workspace("Target Program");
    if !w {
        print("Could not run tests.\n");
        return;
    }

    target_options := get_build_options(w);
    target_options.output_type = .NO_OUTPUT;
    set_build_options(target_options, w);

    compiler_begin_intercept(w);

    add_build_file("tests.jai", w);

    message_loop();

    compiler_end_intercept(w);

    set_build_options_dc(.{do_output=false});
}

#run build();

message_loop :: () {
    ran_test_procedures := false;

    while true {
        message := compiler_wait_for_message();
        if message.kind == {
          case .TYPECHECKED;
            typechecked := cast(*Message_Typechecked) message;

            for typechecked.procedure_headers {
              header := it.expression;
              if has_note(header, "test") {
                  array_add(*test_procedures, header);
              }
            }

          case .PHASE;
            phase := cast(*Message_Phase) message;
            if phase.phase == .TYPECHECKED_ALL_WE_CAN {
                // Prevent running the tests multiple times
                if ran_test_procedures {
                    continue;
                }

                builder: String_Builder;
                init_string_builder(*builder);

                append(*builder, "main :: () {");
                append(*builder, "print(\"Running tests...\\n\");");

                for test_procedures {
                    append(*builder, tprint("context.test_name = \"%\";\n", it.name));
                    append(*builder, tprint("context.skip_test = %;\n", skip_test(it)));
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

skip_test :: (header: *Code_Procedure_Header) -> bool {
    return !getenv("RUN_SKIPPED_TESTS") && has_note(header, "skip");
}

has_note :: (header: *Code_Procedure_Header, note: string) -> bool {
    for header.notes  if it.text == note  return true;
    return false;
}

test_procedures: [..] *Code_Procedure_Header;

#import "Basic";
#import "Compiler";
#import "String";

#if OS == .WINDOWS {
    #import "Windows";
} else #if OS_IS_UNIX {
    #import "POSIX";
}
