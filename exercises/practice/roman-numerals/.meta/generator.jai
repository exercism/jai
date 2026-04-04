to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.str;
    _, number := get_number_property(canonical_case.input, "number");

    return Test.{
        name = tprint("number_%", to_test_name(to_lower_copy(canonical_case.description))),
        body = tprint("assert_equal(%, to_roman(%));", escape_string(expected), number),
        skip = canonical_case.index > 0
    };
}

#run run_generator("roman-numerals", to_test_case);

#import "Basic";
#import "String";
#import,dir "../../../shared/generator";
