to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, text := get_property(canonical_case.input, "text");
    _, shift_key := get_property(canonical_case.input, "shiftKey");

    return Test.{
        name = to_test_name(canonical_case.description),
        body = tprint("assert_equal(%, rotate(%, %));", to_code(canonical_case.expected), to_code(text), to_code(shift_key)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("rotational-cipher", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
