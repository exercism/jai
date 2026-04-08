// This module can generate test files. It does that by:
// 1. Downloading the canonical data for an exercise from the problem-specifications repo.
// 2. Calling a provided function to convert canonical cases into Jai test cases.
// 3. Building the test file contents
// 4. Writing the test file contents to the test file.

Test :: struct {
    name: string;
    body: string;
    multiline_body: []string;
    skip: bool;
}

to_test_name :: (description_path: []string) -> string {
    combined_description := join(..description_path, " ");
    return to_snake_case(combined_description);
}

to_test_name :: (description: string) -> string {
    return to_snake_case(description);
}

build_test_file_contents :: (tests: [] Test, after_tests: string) -> string {
    builder: String_Builder;

    print_to_builder(*builder, "run_tests :: () {\n");
    for test: tests {
        if test.skip {
            print_to_builder(*builder, "    skip(%());\n", test.name);
        } else {
            print_to_builder(*builder, "    %();\n", test.name);
        }
    }
    print_to_builder(*builder, "}\n");

    for test: tests {
        print_to_builder(*builder, "\n% :: () {\n", test.name);

        if test.multiline_body.count > 0 {
            for line: test.multiline_body {
                print_to_builder(*builder, "    %\n", line);
            }
        } else {
            print_to_builder(*builder, "    %\n", test.body);
        }

        print_to_builder(*builder, "}\n");
    }

    if after_tests {
        print_to_builder(*builder, "\n%", after_tests);
    }

    print_to_builder(*builder, "\n");
    print_to_builder(*builder, "#run {\n");
    print_to_builder(*builder, "    before_running_tests();\n");
    print_to_builder(*builder, "    run_tests();\n");
    print_to_builder(*builder, "    after_running_tests();\n");
    print_to_builder(*builder, "}\n");
    print_to_builder(*builder, "\n");
    print_to_builder(*builder, "#load \"solution.jai\";\n");
    print_to_builder(*builder, "#load \"extest.jai\";\n");

    return builder_to_string(*builder);
}

run_generator :: (exercise: string, to_test_case: (canonical_case: CanonicalCase) -> Test, after_tests := "") {
    canonical := download_canonical_data(exercise);

    test_cases: [..] Test;
    for canonical_case: canonical.cases {
        test_case := to_test_case(canonical_case);
        array_add(*test_cases, test_case);
    }

    contents := build_test_file_contents(test_cases, after_tests);
    write_entire_file("../tests.jai", contents);

    // Don't create an executable as the generator can run at compile-time
    set_build_options_dc(.{do_output=false});
}

#import "Compiler";
#import "File";
#import "String";
