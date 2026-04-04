// Jai, being a very young language, doesn't have a built-in testing framework.
// This file provides basic testing functionality that can be used in exercises 
// to run the tests and print a report of which tests passed and which failed.

assert_equal :: (expected: Code, actual: Code, call := #caller_code, loc := #caller_location) #expand {
    test_name := #procedure_name();

    test_code_builder: String_Builder;
    print_expression(*test_code_builder, compiler_get_nodes(call));
    test_code := builder_to_string(*test_code_builder);

    if context.skip_test && !has_build_option("-run_skipped") {
        // We do not `#insert` the `expected` and `actual` values here, since the test is being 
        // skipped and we don't want to evaluate them at all.
        set_test_result(test_name, .SKIPPED, "", test_code);
        return;
    }

    expected_value := #insert expected;
    actual_value   := #insert actual;

    if expected_value == actual_value {
        set_test_result(test_name, .PASSED, "", test_code);
    } else {
        message := sprint("Expected: %, actual: %", expected_value, actual_value);
        set_test_result(test_name, .FAILED, message, test_code);
    }
}

skip :: (code: Code) #expand {
    context.skip_test = true;
    defer context.skip_test = false;

    #insert code;
}

set_test_result :: inline (test_name: string, status: TestStatus, message: string, test_code: string) {
    array_add(*context.test_run.tests, .{test_name, status, message, test_code});

    if status == .FAILED {
        context.test_run.status = .FAILED;
    }
}

before_running_tests :: () {
    set_build_options_dc(.{do_output=false});
    context.started_at = current_time_monotonic();
}

after_running_tests :: () {
    if has_build_option("-json") {
        write_json_test_report();
    } else {
        print_test_report();
    }

    if context.test_run.status == .FAILED {
        exit(1);
    } else {
        exit(0);
    }
}

write_json_test_report :: () {
    // As there is no built-in JSON support in Jai, we manually build a JSON string.
    json_builder: String_Builder;
    append(*json_builder, "{\n");
    append(*json_builder, "  \"version\": 2,\n");
    append(*json_builder, tprint("  \"status\": \"%\",\n", test_status_to_string(context.test_run.status)));
    append(*json_builder, "  \"tests\": [\n");

    for context.test_run.tests {
        append(*json_builder, "    {\n");
        append(*json_builder, tprint("      \"name\": \"%\",\n", it.name));
        append(*json_builder, tprint("      \"status\": \"%\",\n", test_status_to_string(it.status)));
        if it.message.count > 0 {
            append(*json_builder, tprint("      \"message\": \"%\",\n", it.message));
        }
        append(*json_builder, tprint("      \"test_code\": \"%\"\n", it.test_code));
        append(*json_builder, "    }");
        if it_index < context.test_run.tests.count - 1 {
            append(*json_builder, ",");
        }
        append(*json_builder, "\n");
    }

    append(*json_builder, "  ]\n");
    append(*json_builder, "}\n");

    json := builder_to_string(*json_builder);
    write_entire_file("results.json", json);
}

test_status_to_string :: inline (status: TestStatus) -> string {
    if status == {
        case .PASSED;
            return "pass";
        case .FAILED;
            return "fail";
        case .SKIPPED;
            return "skip";
        case;
            return "error";
    };
}

print_test_report :: () {
    failed_tests, passed_tests, skipped_tests := 0;
    duration := to_float64_seconds(current_time_monotonic() - context.started_at);

    for test: context.test_run.tests {
        if test.status == {
            case .PASSED;
                passed_tests += 1;
            case .FAILED;
                failed_tests += 1;
                print("Test '%' failed.\n  %\n", test.name, test.message);
            case .SKIPPED;
                skipped_tests += 1;
        }
    }
    print("Test summary: total: %, failed: %, succeeded: %, skipped: %, duration: % seconds\n", failed_tests + passed_tests + skipped_tests, failed_tests, passed_tests, skipped_tests, duration);
}

has_build_option :: inline (arg: string) -> bool {
    for get_build_options().compile_time_command_line  if it == arg  return true;
    return false;
}

TestStatus :: enum u8 {
    PASSED;
    FAILED;
    SKIPPED;
}

TestResult :: struct {
    name: string;
    status: TestStatus;
    message: string;
    test_code: string;
};

TestRun :: struct {
    version := 2;
    status := TestStatus.PASSED;
    tests: [..] TestResult;
};

#add_context test_run: TestRun;
#add_context skip_test: bool;
#add_context started_at: Apollo_Time;

#import "Basic";
#import "Compiler";
#import "File";
#import "Program_Print";
