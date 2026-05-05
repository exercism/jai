to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.str;
    _, dna := get_string_property(canonical_case.input, "dna");

    return Test.{
        name = replace(to_test_name(canonical_case.description_path), "r_n_a", "rna"),
        body = tprint("assert_equal(%, to_rna(%));", to_code(expected), to_code(dna)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("rna-transcription", to_test_case);

#import "Basic";
#import "String";
#import,dir "../../../shared/generator";
