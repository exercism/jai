to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, phrase := get_string_property(canonical_case.input, "phrase");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, abbreviate(%));", to_code(canonical_case.expected), to_code(phrase)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("acronym", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
