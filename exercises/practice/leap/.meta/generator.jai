to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, year := get_property(canonical_case.input, "year");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, is_leap_year(%));", to_code(canonical_case.expected), to_code(year)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("leap", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
