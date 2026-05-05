to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, subject := get_string_property(canonical_case.input, "subject");
    _, candidates := get_array_property(canonical_case.input, "candidates");

    // Arrays cannot currently be compared for equality, so we generate a multiline test that checks
    // the count and each element individually
    lines: [..] string;
    array_add(*lines, tprint("anagrams := find_anagrams(%, %);", to_code(subject), to_code(candidates)),);
    array_add(*lines, tprint("assert_equal(%, anagrams.count);", to_code(canonical_case.expected.array.count)));
    for canonical_case.expected.array {
        array_add(*lines, tprint("assert_equal(%, anagrams[%]);", to_code(it), it_index));
    }

    return Test.{
        name = to_test_name(canonical_case.description_path),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("anagram", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
