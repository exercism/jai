to_test_case :: (canonical_case: CanonicalCase) -> Test {
    if canonical_case.property == "colors" {
        lines: [..] string;
        array_add(*lines, tprint("assert_equal(%, COLORS.count);", to_code(canonical_case.expected.array.count)));
        for canonical_case.expected.array {
            array_add(*lines, tprint("assert_equal(%, COLORS[%]);", to_code(it), it_index));
        }

        return Test.{
            name = to_test_name(canonical_case.description_path),
            multiline_body = lines,
            skip = canonical_case.index > 0
        };
    }

    _, color := get_string_property(canonical_case.input, "color");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, color_code(%));", to_code(canonical_case.expected), to_code(color)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("resistor-color", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
