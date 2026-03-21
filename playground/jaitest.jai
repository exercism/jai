TestOutcome :: enum u8 {
    PASSED;
    FAILED;
    SKIPPED;
}

Test :: struct {
    name: string;
    outcome: TestOutcome;
    message: string;
};

#add_context tests: [..] Test;
#add_context test_name: string;
#add_context skip_test: bool;

add_passed_test :: inline () {
    array_add(*context.tests, Test.{name = context.test_name, outcome = .PASSED, message = ""});
}

add_failed_test :: inline (message: string) {
    array_add(*context.tests, Test.{name = context.test_name, outcome = .FAILED, message = message});
}

add_skipped_test :: inline () {
    array_add(*context.tests, Test.{name = context.test_name, outcome = .SKIPPED, message = ""});
}

assert_equal :: (expected: Code, actual: Code, loc := #caller_location) #expand {
    if context.skip_test {
        add_skipped_test();
        return;
    }

    expected_value := #insert expected;
    actual_value := #insert actual;

    if expected_value == actual_value {
        add_passed_test();
        return;
    }

    message := sprint("Failure at %:% - Expected %, actual: %", loc.fully_pathed_filename, loc.line_number, expected_value, actual_value);
    add_failed_test(message);
}

print_report :: () {
    exit_code: s32 = 0;

    for test: context.tests {
        print("Test '%': %, %\n", test.name, test.outcome, test.message);
        
        if test.outcome == .FAILED {
            exit_code = 1;
        }
    }

    exit(exit_code);
}

#import "Basic";
