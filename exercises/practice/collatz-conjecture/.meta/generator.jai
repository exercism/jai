to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, number := get_number_property(canonical_case.input, "number");

    lines: [..] string;
    if canonical_case.error {
        array_add(*lines, tprint("ok, _ := steps(%);", number));
        array_add(*lines, tprint("assert_equal(false, ok);"));
    } else {
        array_add(*lines, tprint("ok, number_of_steps := steps(%);", number));
        array_add(*lines, tprint("assert_equal(true, ok);"));
        array_add(*lines, tprint("assert_equal(%, number_of_steps);", canonical_case.expected.number));
    }

    return Test.{
        name = to_test_name(canonical_case.description),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("collatz-conjecture", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
