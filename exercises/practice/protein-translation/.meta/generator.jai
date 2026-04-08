to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, strand := get_property(canonical_case.input, "strand");

    lines: [..] string;
    if canonical_case.error {
        array_add(*lines, tprint("ok, _ := to_proteins(%);", to_code(strand)));
        array_add(*lines, tprint("assert_equal(false, ok);"));
    } else {
        array_add(*lines, tprint("ok, proteins := to_proteins(%);", to_code(strand)));
        array_add(*lines, tprint("assert_equal(true, ok);"));
        array_add(*lines, tprint("assert_equal(%, proteins.count);", canonical_case.expected.array.count));
        for canonical_case.expected.array {
            array_add(*lines, tprint("assert_equal(%, proteins[%]);", to_code(it), it_index));
        }
    }

    return Test.{
        name = to_test_name(canonical_case.description),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("protein-translation", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
