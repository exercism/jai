// Jai, being a very young language, doesn't have a built-in testing framework.
// This file provides basic testing functionality that can be used in exercises 
// to run the tests and print a report of which tests passed and which failed.

// This macro is used to compare the expected and actual values in a test.
// It works on Code values for the expected and actual values, which allows it to capture 
// the code of the test assertion for reporting purposes.
assert_equal :: (expected: Code, actual: Code, call := #caller_code, loc := #caller_location) #expand {
    // The test name is derived from the name of the test procedure, which is the caller of this macro.
    test_name := #procedure_name();

    // Convert the call to this macro into its original source code form for reporting purposes.
    test_code_builder: String_Builder;
    print_expression(*test_code_builder, compiler_get_nodes(call));
    test_code := builder_to_string(*test_code_builder);

    expected_value := #insert expected;
    actual_value   := #insert actual;

    if expected_value == actual_value {
        set_test_result(test_name, .PASSED, "", test_code);
    } else {
        message := sprint("Expected: %, actual: %", expected_value, actual_value);
        set_test_result(test_name, .FAILED, message, test_code);

        // Short-circuit test execution to avoid cascading failures
        `return;
    }
}

// This macro allows skipping a test.
// A skipped test's code will _not_ be executed.
skip :: (code: Code) #expand {
    // Do not skip the test if the '-run_skipped' build option was provided.
    // This is used by the test runner to forcibly run _all_ tests, including skipped tests.
    skip_test := !has_build_option("-run_skipped");

    if skip_test {
        // Get the name of the test procedure being skipped for reporting purposes
        test_procedure_call := cast (*Code_Procedure_Call)compiler_get_nodes(code); 
        test_procedure_identifier := cast (*Code_Ident)test_procedure_call.procedure_expression;
        test_name := test_procedure_identifier.name;
        set_test_result(test_name, .SKIPPED, "", "");
         
        // As we're skipping the test, we don't insert the original test procedure call, which prevents
        // the test from being executed
    } else {
        // Don't skip the test, so insert the original test procedure call to execute the test as normal.
        #insert code;
    }
}

set_test_result :: inline (test_name: string, status: TestStatus, message: string, test_code: string) {
    test: TestResult = .{test_name, status, message, test_code};

    // If there already is a test result for this test name, it means the test has multiple assertions.
    // As we short-circuit test execution on failure, the existing test result _must_ be a passing test,
    // so we can safely overwrite the existing test result
    if context.test_run.tests.count > 0 && context.test_run.tests[context.test_run.tests.count - 1].name == test_name {
        context.test_run.tests[context.test_run.tests.count - 1] = test;
    } else {
        array_add(*context.test_run.tests, test);
    }

    // If we have one failing test, the whole test run is considered failed
    if status == .FAILED  context.test_run.status = .FAILED;
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

// Print the test results in the Exercism Test Runner output format:
// https://exercism.org/docs/building/tooling/test-runners/interface#h-output-format
write_json_test_report :: () {
    // As there is no built-in JSON support in Jai, we manually build a JSON string.
    json_builder: String_Builder;
    init_string_builder(*json_builder);

    append(*json_builder, "{\n");
    append(*json_builder, "  \"version\": 2,\n");
    append(*json_builder, tprint("  \"status\": \"%\",\n", test_status_to_string(context.test_run.status)));
    append(*json_builder, "  \"tests\": [\n");

    for context.test_run.tests {
        append(*json_builder, "    {\n");
        append(*json_builder, tprint("      \"name\": \"%\",\n", json_escape_string(it.name)));
        append(*json_builder, tprint("      \"status\": \"%\",\n", test_status_to_string(it.status)));
        if it.message.count > 0 {
            append(*json_builder, tprint("      \"message\": \"%\",\n", json_escape_string(it.message)));
        }
        append(*json_builder, tprint("      \"test_code\": \"%\"\n", json_escape_string(it.test_code)));
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

json_escape_string :: (str: string) -> string {
    escaped_builder: String_Builder;
    init_string_builder(*escaped_builder);

    for str {
        if it == {
            case #char "\""; append(*escaped_builder, "\\\"");
            case #char "\\"; append(*escaped_builder, "\\\\");
            case #char "\n"; append(*escaped_builder, "\\n");
            case #char "\r"; append(*escaped_builder, "\\r");
            case #char "\t"; append(*escaped_builder, "\\t");
            case; append(*escaped_builder, it);
        }
    }
    return builder_to_string(*escaped_builder);
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
#add_context started_at: Apollo_Time;

#import "Basic";
#import "Compiler";
#import "File";
#import "Program_Print";
