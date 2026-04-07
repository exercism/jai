to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.str;
    _, value := get_property(canonical_case.input, "value");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, reverse_string(%));", to_code(canonical_case.expected), to_code(value)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("reverse-string", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
