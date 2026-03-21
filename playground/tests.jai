TestOutcome :: enum u8 {
    PASSED;
    FAILED;
}

Test :: struct {
    name: string;
    outcome: TestOutcome;
    message: string;
};

#add_context tests: [..] Test;
#add_context test_name: string;

assert_equal :: (expected: Code, actual: Code, call := #caller_code, loc := #caller_location) #expand {
    expected_value := #insert expected;
    actual_value := #insert actual;

    if expected_value == actual_value {
        array_add(*context.tests, Test.{name = context.test_name, outcome = .PASSED, message = ""});
        return;
    }

    message := sprint("Failure at %:% - Expected %, actual: %", loc.fully_pathed_filename, loc.line_number, expected_value, actual_value);
    array_add(*context.tests, Test.{name = context.test_name, outcome = .FAILED, message = message});
}

print_report :: () {
    for test: context.tests {
        print("Test '%': %, %\n", test.name, test.outcome, test.message);
    }   
}

#load "solution.jai";

is_leap_year_true :: () {
    assert_equal(is_leap_year(2000), true);
} @test;

is_leap_year_false :: () {
    assert_equal(is_leap_year(1900), false);
} @test;

#import "Basic";
#import "Compiler";
