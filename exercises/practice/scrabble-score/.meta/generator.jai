to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.number;
    _, word := get_string_property(canonical_case.input, "word");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, score(%));", expected, escape_string(word)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("scrabble-score", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
