to_test_case :: (canonical_case: CanonicalCase) -> Test {
    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = "assert_equal(\"Hello, World!\", hello());",
        skip = canonical_case.index > 0
    };
}

#run run_generator("hello-world", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
