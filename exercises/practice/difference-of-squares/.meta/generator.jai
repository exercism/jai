to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.number;
    _, number := get_number_property(canonical_case.input, "number");

    return Test.{
        name = to_test_name(canonical_case.description),
        body = tprint("assert_equal(%, %(%));", expected, to_snake_case(canonical_case.property), number),
        skip = canonical_case.index > 0
    };
}

#run run_generator("difference-of-squares", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
