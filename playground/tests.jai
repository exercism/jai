TestOutcome :: enum u8 {
    PASSED;
    FAILED;
}

Test :: struct {
    name: string;
    outcome: TestOutcome;
};

#add_context tests: [..] Test;

main :: () {
    print("context.tests: %\n", context.tests);
    array_add(*context.tests, Test.{name ="test 1", outcome = .PASSED});
    print("context.tests: %\n", context.tests);
}

#import "Basic";
