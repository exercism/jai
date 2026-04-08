to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, number := get_property(canonical_case.input, "number");

    return Test.{
        name = to_test_name(canonical_case.description),
        body = tprint("assert_equal(%, classify(%));", to_enum(canonical_case.expected, "Classification"), to_code(number)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("perfect-numbers", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
