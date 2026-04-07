to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, name := get_property(canonical_case.input, "name");

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = ifx name.str.count 
               then tprint("assert_equal(%, two_fer(%));", to_code(canonical_case.expected), to_code(name)) 
               else tprint("assert_equal(%, two_fer());", to_code(canonical_case.expected)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("two-fer", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
