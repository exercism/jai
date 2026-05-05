to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, array := get_property(canonical_case.input, "array");
    _, value := get_property(canonical_case.input, "value");

    lines: [..] string;
    if canonical_case.error {
        array_add(*lines, tprint("ok, _ := binary_search(%, %);", to_code(array), to_code(value)));
        array_add(*lines, tprint("assert_equal(false, ok);"));
    } else {
        array_add(*lines, tprint("ok, index := binary_search(%, %);", to_code(array), to_code(value)));
        array_add(*lines, tprint("assert_equal(true, ok);"));
        array_add(*lines, tprint("assert_equal(%, index);", to_code(canonical_case.expected)));
    }

    return Test.{
        name = to_test_name(canonical_case.description),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("binary-search", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
