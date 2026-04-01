to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.boolean;
    _, number := get_number_property(canonical_case.input, "number");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(\"%\", to_roman(%));", expected, number),
        skip = canonical_case.index > 0
    };
}

#run run_generator("roman-numerals", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
