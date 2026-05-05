to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, strand := get_property(canonical_case.input, "strand");

    lines: [..] string;
    if canonical_case.error {
        array_add(*lines, tprint("ok, _ := nucleotide_counts(%);", to_code(strand)));
        array_add(*lines, tprint("assert_equal(false, ok);"));
    } else {
        array_add(*lines, tprint("ok, counts := nucleotide_counts(%);", to_code(strand)));
        array_add(*lines, tprint("assert_equal(true, ok);"));
        _, a := get_property(canonical_case.expected, "A");
        array_add(*lines, tprint("assert_equal(%, counts.A);", to_code(a)));
        _, c := get_property(canonical_case.expected, "C");
        array_add(*lines, tprint("assert_equal(%, counts.C);", to_code(c)));
        _, g := get_property(canonical_case.expected, "G");
        array_add(*lines, tprint("assert_equal(%, counts.G);", to_code(g)));
        _, t := get_property(canonical_case.expected, "T");
        array_add(*lines, tprint("assert_equal(%, counts.T);", to_code(t)));
    }

    return Test.{
        name = to_test_name(canonical_case.description),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("nucleotide-count", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
