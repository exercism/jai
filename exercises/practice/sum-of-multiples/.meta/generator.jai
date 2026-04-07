to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, factors := get_property(canonical_case.input, "factors");
    _, limit := get_number_property(canonical_case.input, "limit");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, sum(%, %));", output(canonical_case.expected), output(factors), limit),
        skip = canonical_case.index > 0
    };
}

#run run_generator("sum-of-multiples", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
