to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.boolean;
    _, sentence := get_string_property(canonical_case.input, "sentence");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, is_pangram(%));", expected, escape_string(sentence)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("pangram", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
