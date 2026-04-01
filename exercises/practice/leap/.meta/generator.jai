to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.boolean;
    year := get_number_property(canonical_case.input, "year");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, is_leap_year(%));", expected, year),
        skip = canonical_case.index > 0
    };
}

#run write_test_file("leap", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
