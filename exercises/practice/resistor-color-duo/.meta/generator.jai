to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, colors := get_array_property(canonical_case.input, "colors");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, value(%));", to_code(canonical_case.expected), to_code(colors)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("resistor-color-duo", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
