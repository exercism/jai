to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.boolean;
    _, value := get_string_property(canonical_case.input, "value");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, is_valid(%));", to_code(expected), to_code(value)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("luhn", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
