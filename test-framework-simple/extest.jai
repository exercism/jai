assert_equal :: (expected: Code, actual: Code, call := #caller_code, loc := #caller_location) #expand {
    test_code_builder: String_Builder;
    print_expression(*test_code_builder, compiler_get_nodes(call));
    test_code := builder_to_string(*test_code_builder);

    if context.skip_test {
        add_test_result(context.test_name, .SKIPPED, "", test_code);
        return;
    }

    expected_value := #insert expected;
    actual_value   := #insert actual;

    if expected_value == actual_value {
        add_test_result(context.test_name, .PASSED, "", test_code);
    } else {
        message := sprint("Expected: %, actual: %", expected_value, actual_value);
        add_test_result(context.test_name, .FAILED, message, test_code);
    }
}

run_test :: (code: Code, skip := false) #expand {
    context.test_name = #procedure_name();
    context.skip_test = skip;

    #insert code;
}

add_test_result :: (test_name: string, outcome: TestOutcome, message: string, test_code: string) {
    array_add(*context.tests, .{test_name, outcome, message, test_code});
}

print_test_report :: () {
    failed_tests, passed_tests, skipped_tests := 0;

    for test: context.tests {
        if test.outcome == {
            case .PASSED;
                passed_tests += 1;
            case .FAILED;
                failed_tests += 1;
                print("Test '%' failed.\n  %\n", test.name, test.message);
            case .SKIPPED;
                skipped_tests += 1;
        }
    }
    print("Test summary: total: %, failed: %, succeeded: %, skipped: %\n", failed_tests + passed_tests + skipped_tests, failed_tests, passed_tests, skipped_tests);

    exit(cast(s32) (failed_tests > 0));
}

TestOutcome :: enum u8 {
    PASSED;
    FAILED;
    SKIPPED;
}

TestResult :: struct {
    name: string;
    outcome: TestOutcome;
    message: string;
    test_code: string;
};

#add_context tests: [..] TestResult;
#add_context test_name: string;
#add_context skip_test: bool;

#import "Basic";
#import "Compiler";
#import "Program_Print";
