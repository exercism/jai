to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, series := get_property(canonical_case.input, "series");
    _, slice_length := get_property(canonical_case.input, "sliceLength");

    lines: [..] string;

    if canonical_case.error {
        array_add(*lines, tprint("ok, _ := to_slices(%, %);", to_code(series), to_code(slice_length)));
        array_add(*lines, tprint("assert_equal(false, ok);"));
    } else {
        array_add(*lines, tprint("ok, slices := to_slices(%, %);", to_code(series), to_code(slice_length)));
        array_add(*lines, tprint("assert_equal(true, ok);"));
        array_add(*lines, tprint("assert_equal(%, slices.count);", to_code(canonical_case.expected.array.count)));
        for canonical_case.expected.array {
            array_add(*lines, tprint("assert_equal(%, slices[%]);", to_code(it), it_index));
        }
    }

    return Test.{
        name = to_test_name(canonical_case.description_path),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("series", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
