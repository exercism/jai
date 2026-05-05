to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, colors := get_array_property(canonical_case.input, "colors");
    _, expected_value := get_number_property(canonical_case.expected, "value");
    _, expected_unit := get_string_property(canonical_case.expected, "unit");
    expected := tprint("% %", expected_value, expected_unit);

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, label(%));", to_code(expected), to_code(colors)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("resistor-color-trio", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
