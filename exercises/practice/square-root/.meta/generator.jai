to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, radicand := get_property(canonical_case.input, "radicand");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, square_root(%));", to_code(canonical_case.expected), to_code(radicand)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("square-root", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
