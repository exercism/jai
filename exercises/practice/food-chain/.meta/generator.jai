to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, start_verse := get_property(canonical_case.input, "startVerse");
    _, end_verse := get_property(canonical_case.input, "endVerse");

    lines: [..] string;
    array_add(*lines, "    EXPECTED :: #string DONE");
    for canonical_case.expected.array {
        array_add(*lines, it.str);
    }
    array_add(*lines, "DONE");
    array_add(*lines, tprint("    assert_equal(EXPECTED, recite(%, %));", to_code(start_verse), to_code(end_verse)));

    return Test.{
        name = to_test_name(canonical_case.description_path),
        multiline_body = lines,
        indent_body = false,
        skip = canonical_case.index > 0
    };
}

#run run_generator("food-chain", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
