assert_equal :: (expected: Code, actual: Code, call := #caller_code, loc := #caller_location) #expand {
    name      := context.test_name;
    message   := "";
    outcome   := TestOutcome.PASSED;

    test_code_builder: String_Builder;
    print_expression(*test_code_builder, compiler_get_nodes(call));
    test_code := builder_to_string(*test_code_builder);

    expected_value := #insert expected;
    actual_value   := #insert actual;

    if expected_value != actual_value {
        outcome = TestOutcome.FAILED;
        message = sprint("Expected: %, actual: %", expected_value, actual_value);
    }

    array_add(*context.tests, Test.{name, outcome, message, test_code});
}

run_test :: (code: Code, skip := false) #expand {
    context.test_name = #procedure_name();
    #insert code;
}

print_test_report :: () {
    failed_tests := 0;
    passed_tests := 0;

    for test: context.tests {
        if test.outcome == {
             case .PASSED;
                passed_tests += 1;
            case .FAILED;
                failed_tests += 1;
                print("Test '%' failed.\n  %\n", test.name, test.message);
        }
    }
    print("Test summary: total: %, failed: %, succeeded: %\n", failed_tests + passed_tests, failed_tests, passed_tests);

    exit(cast(s32) (failed_tests > 0));
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

#import "Basic";
#import "Compiler";
#import "Program_Print";
