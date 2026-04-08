to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.str;
    _, name := get_string_property(canonical_case.input, "name");
    _, number := get_number_property(canonical_case.input, "number");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, format(%, %));", to_code(expected), to_code(name), to_code(number)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("line-up", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
