to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.str;
    _, number := get_number_property(canonical_case.input, "number");

    name := to_test_name(canonical_case.description_path);
    if !begins_with(name, "the") {
        name = tprint("number_%", name);
    }

    return Test.{
        name = name,
        body = tprint("assert_equal(%, convert(%));", to_code(expected), to_code(number)),
        skip = canonical_case.index > 0
    };
}

#run run_generator("raindrops", to_test_case);

#import "Basic";
#import "String";
#import,dir "../../../shared/generator";
