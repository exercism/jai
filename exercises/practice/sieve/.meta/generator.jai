to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, limit := get_property(canonical_case.input, "limit");

    // Arrays cannot currently be compared for equality, so we generate a multiline test that checks
    // the count and each element individually
    lines: [..] string;
    array_add(*lines, tprint("primes := primes_from_sieve(%);", to_code(limit)));
    array_add(*lines, tprint("assert_equal(%, primes.count);", to_code(canonical_case.expected.array.count)));
    for canonical_case.expected.array {
        array_add(*lines, tprint("assert_equal(%, primes[%]);", to_code(it), it_index));
    }

    return Test.{
        name = to_test_name(canonical_case.description_path),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("sieve", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
