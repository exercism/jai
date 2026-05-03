to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, number := get_number_property(canonical_case.input, "number");

    lines: [..] string;
    array_add(*lines, tprint("commands := decode_commands(%);", to_code(number)));
    array_add(*lines, tprint("assert_equal(%, commands.count);", to_code(canonical_case.expected.array.count)));
    for canonical_case.expected.array {
        array_add(*lines, tprint("assert_equal(%, commands[%]);", to_code(it), it_index));
    }

    return Test.{
        name = to_test_name(canonical_case.description_path),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("secret-handshake", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
