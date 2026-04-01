to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := tprint("\"%\"", canonical_case.expected.str);
    has_name, name := get_string_property(canonical_case.input, "name");
    name = ifx has_name tprint("\"%\"", name) else "";

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = ifx has_name tprint("assert_equal(%, two_fer(%));", expected, name),
        skip = canonical_case.index > 0
    };
}

#run run_generator("two-fer", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
