to_test_case :: (canonical_case: CanonicalCase) -> Test {
    using test: Test;
    name = to_test_name(canonical_case.description);
    skip = canonical_case.index > 0;
    _, capacity := get_property(canonical_case.input, "capacity");
    _, operations := get_array_property(canonical_case.input, "operations");

    lines: [..]string;
    array_add(*lines, tprint("CAPACITY :: %;", to_code(capacity)));
    array_add(*lines, "circular_buffer := new_circular_buffer(CAPACITY);");

    write_idx, read_idx: int = 1;

    for operation: operations {
        _, operation_name := get_string_property(*operation, "operation");
        _, should_succeed := get_boolean_property(*operation, "should_succeed");

        if operation_name == {
            case "write";
                _, item := get_number_property(*operation, "item");
                array_add(*lines, tprint("write_successful_% := write(*circular_buffer, %);", write_idx, to_code(item)));
                array_add(*lines, tprint("assert_equal(%, write_successful_%);", to_code(should_succeed), write_idx));
                write_idx += 1;
            case "read";
                array_add(*lines, tprint("read_successful_%, read_value_% := read(*circular_buffer);", read_idx, read_idx));
                array_add(*lines, tprint("assert_equal(%, read_successful_%);", to_code(should_succeed), read_idx));
                if should_succeed {
                    _, expected := get_number_property(*operation, "expected");
                    array_add(*lines, tprint("assert_equal(%, read_value_%);", to_code(expected), read_idx));
                }
                read_idx += 1;
            case "clear";
                array_add(*lines, "clear(*circular_buffer);");
            case "overwrite";
                _, item := get_number_property(*operation, "item");
                array_add(*lines, tprint("overwrite(*circular_buffer, %);", to_code(item)));
            case;
                assert(false, tprint("Unexpected operation: %", operation_name));
        }
    }

    test.multiline_body = lines;

    return test;
}

#run run_generator("circular-buffer", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
