build :: () {
    w := compiler_create_workspace("Target Program");
    if !w {
        print("Workspace creation failed.\n");
        return;
    }

    target_options := get_build_options(w);
    target_options.output_type = .NO_OUTPUT;
    set_build_options(target_options, w);

    compiler_begin_intercept(w);

    add_build_file(tprint("%tests.jai", #filepath), w);

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
                  array_add(*test_procedures_to_run, header);
              }
            }

          case .PHASE;
            phase := cast(*Message_Phase) message;
            if phase.phase == .TYPECHECKED_ALL_WE_CAN {
                if ran_test_procedures {
                    continue;
                }

                builder: String_Builder;
                init_string_builder(*builder);

                append(*builder, "main :: () {");
                append(*builder, "print(\"Running tests...\\n\");");
                // For each test procedure, generate a #run directive and
                                // add that string to the target program.
                                for test_procedures_to_run {
                                    s1: = tprint("context.test_name = \"%\";\n", it.name); 
                                    append(*builder, s1);
                                    s := tprint("%();", it.name);
                                    append(*builder, s);
                                }                
                    ;

                    append(*builder, "print_report();");
                    append(*builder, "}");

                add_build_string(builder_to_string(*builder), message.workspace);

                add_build_string("#run main();", message.workspace);

                array_reset(*test_procedures_to_run);

                ran_test_procedures = true;
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

test_procedures_to_run: [..] *Code_Procedure_Header;

#import "Basic";
#import "Compiler";
#import "String";
