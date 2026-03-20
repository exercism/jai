build :: () {
    w := compiler_create_workspace("Target Program");
    if !w {
        print("Workspace creation failed.\n");
        return;
    }

    test_filepath := tprint("%test.jai", #filepath);

    target_options := get_build_options(w);
    target_options.output_type = .NO_OUTPUT;
    set_build_options(target_options, w);

    compiler_begin_intercept(w);

    add_build_file(test_filepath, w);

    message_loop(test_filepath, w);

    compiler_end_intercept(w);

    set_build_options_dc(.{do_output=false});
}

#run build();

message_loop :: (test_filepath: string, w: Workspace) {

    while true {

        // We ask the compiler for the next message. If one is not available,
        // we will wait until it becomes available.
        message := compiler_wait_for_message();
        
        // The result is a struct Message, defined in modules/Compiler.
        // We can switch on message.kind to decide what to do.
        if message.kind == {
          case .FILE;
            // We get this message once for each source code file that is
            // loaded for compilation.
            message_file := cast(*Message_File) message;

            if message_file.fully_pathed_filename == test_filepath {
              add_build_string("main :: () {\nprinter(5);\n}\n#run main();", w);

              print("  Loading file '%'.\n", message_file.fully_pathed_filename);
            }

          case .TYPECHECKED;
            typechecked := cast(*Message_Typechecked) message;

            // for typechecked.structs  note_struct(it.expression);
            for typechecked.procedure_headers {
              if it.expression.location.enclosing_load.fully_pathed_filename == test_filepath {
                if has_note(it.expression, "test") {
                    print("  Test method '%'.\n", it.expression.name);
                }
              }
            }

            
          // case .IMPORT;
          //   // We get this message once for each module that is imported.
          //   // Modules are deduplicated, so if "Basic" is imported 9 times,
          //   // you'll only see this once, because the compiler only imports it once
          //   // (unless it's intentionally instantiated multiple times by the program).

          //   // A single import will generally be followed by one or more FILE messages,
          //   // representing the files loaded by that module.
          //   import := cast(*Message_Import) message;
          //   print("  Importing module '%'.\n", import.module_name);
            
          // case .PHASE;
          //   // The compiler sends us this message each time it advances through
          //   // the various phases of compilation, which are defined in the
          //   // Compilation_Phase enum.
            
          //   // Here we just print out each phase as we get the message.
            
          //   // Each time we get new source code, we reset to the beginning,
          //   // so we may get ALL_SOURCE_CODE_PARSED or TYPECHECKED messages multiple times.
          //   // #run directives can do this, as well as code that we might add to the target
          //   // program. It's normal.
            
          //   phase := cast(*Message_Phase) message;
          //   print("--- Entering phase %. ---\n", phase.phase);

          //   if phase.phase == .POST_WRITE_EXECUTABLE {
          //       print("\n");
          //       if phase.executable_write_failed {
          //           print("FAILED writing '%'! Linker exit code was %.\n", phase.executable_name, phase.linker_exit_code);
          //       } else {
          //           print("Success writing '%'! Linker exit code was %.\n", phase.executable_name, phase.linker_exit_code);
          //       }
          //   }
            
          // case .TYPECHECKED;
          //   // We get this message every time some code has passed typechecking.
          //   // We can inspect the code, search for things, modify code, etc.
          //   // For now we'll just report how much code has been typechecked.
            
          //   typechecked := cast(*Message_Typechecked) message;
          //   n := typechecked.all.count;
          //   if n == 1 {
          //       print("  1 thing has been typechecked.\n");
          //   } else {
          //       print("  % things have been typechecked.\n", n);
          //   }

          case .COMPLETE;
            // The compiler sends us this message when compilation is finished.
            break;
            
          // case;
          //   compiler_report(tprint("Unhandled message type %!\n", message.kind));
        }
    }
}

has_note :: (header: *Code_Procedure_Header, note: string) -> bool {
    for header.notes  if it.text == note  return true;
    return false;
}

#import "Basic";
#import "Compiler";
#import "String";
