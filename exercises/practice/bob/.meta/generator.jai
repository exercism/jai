to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.str;
    _, heyBob := get_string_property(canonical_case.input, "heyBob");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, response(%));", escape_string(expected), escape_string(heyBob)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("bob", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
