to_test_case :: (canonical_case: CanonicalCase) -> Test {
    expected := canonical_case.expected.str;
    _, str := get_string_property(canonical_case.input, "string");
    body := ifx canonical_case.property == "consistency" then
                tprint("assert_equal(%, decode(encode(%)));", to_code(expected), to_code(str))
            else
                tprint("assert_equal(%, %(%));", to_code(expected), canonical_case.property, to_code(str));

    return Test.{
        name = to_test_name(canonical_case.description_path),
        body = body,
        skip = canonical_case.index > 0
    };
}

#run run_generator("run-length-encoding", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
