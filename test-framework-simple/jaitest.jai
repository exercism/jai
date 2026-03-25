assert_equal :: (expected: Code, actual: Code, call := #caller_code, loc := #caller_location) #expand {
    test_code_builder: String_Builder;
    call_nodes := compiler_get_nodes(call);
    print_expression(*test_code_builder, call_nodes);
    test_code := builder_to_string(*test_code_builder);
    
    if context.skip_test {
        array_add(*context.tests, Test.{name = context.test_name, outcome = .SKIPPED, message = "", test_code = test_code});
        return;
    }

    expected_value := #insert expected;
    actual_value := #insert actual;

    if expected_value == actual_value {
        array_add(*context.tests, Test.{name = context.test_name, outcome = .PASSED, message = "", test_code = test_code});
        return;
    }

    message := sprint("Expected: %, actual: %", expected_value, actual_value);
    array_add(*context.tests, Test.{name = context.test_name, outcome = .FAILED, message = message, test_code = test_code});
}

run_test :: (code: Code) #expand {
    root := compiler_get_nodes(code);
    call := cast(*Code_Procedure_Call)root;
    expr := cast(*Code_Ident)call.procedure_expression;
    context.test_name = expr.name;
    #insert code;
}

print_test_report :: () {
    failed_tests := 0;
    passed_tests := 0;
    skipped_tests := 0;

    for test: context.tests {
        if test.outcome == {
             case .PASSED;
                passed_tests += 1;
             case .SKIPPED;
                skipped_tests += 1;
            case .FAILED;
                failed_tests += 1;
                print("Test '%' failed.\n  %\n", test.name, test.message);
        }
    }
    print("Test summary: total: %, failed: %, succeeded: %, skipped: %\n", failed_tests + passed_tests + skipped_tests, failed_tests, passed_tests, skipped_tests);

    exit(cast(s32) (failed_tests > 0));
}

has_note :: (header: *Code_Procedure_Header, note: string) -> bool {
    for header.notes  if it.text == note  return true;
    return false;
}

has_compiler_option :: (option: string) -> bool {
    for opt: get_build_options().compile_time_command_line {
        if opt == option {
            return true;
        }
    }
    return false;
}

TestOutcome :: enum u8 {
    PASSED;
    FAILED;
    SKIPPED;
}

Test :: struct {
    name: string;
    outcome: TestOutcome;
    message: string;
    test_code: string;
};

#add_context tests: [..] Test;
#add_context test_name: string;
#add_context skip_test: bool;

#import "Basic";
#import "Compiler";
#import "Program_Print";
