to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, x := get_property(canonical_case.input, "x");
    _, y := get_property(canonical_case.input, "y");

    return Test.{
        name = to_test_name(canonical_case.description),
        body = tprint("assert_equal(%, score(%, %));", to_code(canonical_case.expected), to_code(x), to_code(y)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("darts", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
