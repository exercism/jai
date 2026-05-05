to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, sides := get_property(canonical_case.input, "sides");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, is_%(%));", to_code(canonical_case.expected), canonical_case.property, to_code(sides)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("triangle", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
