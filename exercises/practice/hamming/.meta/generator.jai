to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, strand1 := get_property(canonical_case.input, "strand1");
    _, strand2 := get_property(canonical_case.input, "strand2");

    lines: [..] string;
    if canonical_case.error {
        array_add(*lines, tprint("ok, _ := hamming_distance(%, %);", to_code(strand1), to_code(strand2)));
        array_add(*lines, tprint("assert_equal(false, ok);"));
    } else {
        array_add(*lines, tprint("ok, distance := hamming_distance(%, %);", to_code(strand1), to_code(strand2)));
        array_add(*lines, tprint("assert_equal(true, ok);"));
        array_add(*lines, tprint("assert_equal(%, distance);", to_code(canonical_case.expected)));
    }

    return Test.{
        name = to_test_name(canonical_case.description_path),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("hamming", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
