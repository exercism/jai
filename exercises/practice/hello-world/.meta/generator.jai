to_test_case :: (canonical_case: CanonicalCase) -> Test {
    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = tprint("assert_equal(%, hello());", to_code(canonical_case.expected)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("hello-world", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
