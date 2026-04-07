to_test_case :: (canonical_case: CanonicalCase) -> Test {
    if canonical_case.property == "list" {
        _, score := get_property(canonical_case.input, "score");

        // Arrays cannot currently be compared for equality, so we generate a multiline test that checks
        // the count and each element individually
        lines: [..] string;
        array_add(*lines, tprint("allergens := list(%);", to_code(score)));
        array_add(*lines, tprint("assert_equal(%, allergens.count);", canonical_case.expected.array.count));
        for canonical_case.expected.array {
            array_add(*lines, tprint("assert_equal(ALLERGEN%, allergens[%]);", to_enum(it), it_index));
        }

        return Test.{
            name = to_test_name(canonical_case.description_path),
            multiline_body = lines,
            skip = canonical_case.index > 0
        };
    }

    _, item := get_string_property(canonical_case.input, "item");
    _, score := get_property(canonical_case.input, "score");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, is_allergic_to(%, %));", to_code(canonical_case.expected), to_enum(item), to_code(score)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("allergies", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
