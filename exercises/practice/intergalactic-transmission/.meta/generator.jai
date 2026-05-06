to_test_case :: (canonical_case: CanonicalCase) -> Test {
    to_array :: (value: JSON_Value) -> [..] string {
        assert(value.type == .ARRAY);
        out: [..] string;

        for value.array {
            assert(it.type == .STRING, "Only string values are supported for array conversion");
            array_add(*out, it.str);
        }
        
        return out;
    }

    _, message := get_property(canonical_case.input, "message");

    lines: [..] string;

    if canonical_case.property == "decodeMessage" {
        if canonical_case.error {
            array_add(*lines, tprint("ok, _ := decode_message(%);", to_code(to_array(message), convert_elements = false)));
            array_add(*lines, tprint("assert_equal(false, ok);"));
        } else {
            array_add(*lines, tprint("ok, decoded_message := decode_message(%);", to_code(to_array(message), convert_elements = false)));
            array_add(*lines, tprint("assert_equal(true, ok);"));
            array_add(*lines, tprint("assert_equal(%, decoded_message);", to_code(to_array(canonical_case.expected), convert_elements = false)));
        }
    } else {
        array_add(*lines, tprint("assert_equal(%, transmit_sequence(%));", to_code(to_array(canonical_case.expected), convert_elements = false), to_code(to_array(message), convert_elements = false)));
    }

    name := to_test_name(canonical_case.description);
    if begins_with(name, "0x") name = tprint("value_%", name);

    return Test.{
        name = name,
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("intergalactic-transmission", to_test_case);

#import "Basic";
#import "String";
#import,dir "../../../shared/generator";
