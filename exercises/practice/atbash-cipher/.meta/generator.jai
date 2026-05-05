to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, phrase := get_string_property(canonical_case.input, "phrase");
    
    return Test.{
        name = to_test_name(canonical_case.description),
        body = tprint("assert_equal(%, %(%));", to_code(canonical_case.expected), canonical_case.property, to_code(phrase)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("atbash-cipher", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
