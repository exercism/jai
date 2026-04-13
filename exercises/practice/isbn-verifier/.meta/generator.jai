to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, isbn := get_property(canonical_case.input, "isbn");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, is_valid(%));", to_code(canonical_case.expected), to_code(isbn)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("isbn-verifier", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
