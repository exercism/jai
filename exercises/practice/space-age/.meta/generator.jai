to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.number;
    _, seconds := get_number_property(canonical_case.input, "seconds");
    _, planet := get_string_property(canonical_case.input, "planet");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, age(%, %));", to_code(expected), to_enum(planet), to_code(seconds)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("space-age", to_test_case);

#import "Basic";
#import "String";
#import,dir "../../../shared/generator";
