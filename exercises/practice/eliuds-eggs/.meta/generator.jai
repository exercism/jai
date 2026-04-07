to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, number := get_property(canonical_case.input, "number");

    return Test.{
        name = tprint("count_%", to_test_name(canonical_case.description_path)),
        body = tprint("assert_equal(%, egg_count(%));", to_code(canonical_case.expected), to_code(number)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("eliuds-eggs", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
