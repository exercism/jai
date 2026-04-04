// This module can generate test files. It does that by:
// 1. Downloading the canonical data for an exercise from the problem-specifications repo.
// 2. Calling a provided function to convert canonical cases into Jai test cases.
// 3. Building the test file contents
// 4. Writing the test file contents to the test file.

Test :: struct {
    name: string;
    body: string;
    skip: bool;
}

render_string :: (str: string) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    append(*builder, "\"");

    for char: str {
        if char == {
            case #char "\\"; append(*builder, "\\\\");
            case #char "\""; append(*builder, "\\\"");
            case #char "\n"; append(*builder, "\\n");
            case #char "\r"; append(*builder, "\\r");
            case #char "\t"; append(*builder, "\\t");
            case; append(*builder, char);
        }
    }

    append(*builder, "\"");
    return builder_to_string(*builder);
}

to_test_name :: (description_path: []string) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    for description: description_path {
        to_lower_in_place(description);

        for description {
            if it >= #char "a" && it <= #char "z" || it >= #char "0" && it <= #char "9" {
                append(*builder, it);
            } else if it == #char " " {
                append(*builder, "_");
            }
        }

        if it_index > 0  append(*builder, "_");
    }

   return builder_to_string(*builder);
}

build_test_file_contents :: (tests: [] Test) -> string {
    builder: String_Builder;

    print_to_builder(*builder, "run_tests :: () {\n");
    for tests {
        if it.skip {
            print_to_builder(*builder, "    skip(%());\n", it.name);
        } else {
            print_to_builder(*builder, "    %();\n", it.name);
        }
    }
    print_to_builder(*builder, "}\n");

    for tests {
        print_to_builder(*builder, "\n% :: () {\n    %\n}\n", it.name, it.body);
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

run_generator :: (exercise: string, to_test_case: (canonical_case: CanonicalCase) -> Test) {
    canonical := download_canonical_data(exercise);

    test_cases: [..] Test;
    for canonical_case: canonical.cases {
        test_case := to_test_case(canonical_case);
        array_add(*test_cases, test_case);
    }

    contents := build_test_file_contents(test_cases);
    write_entire_file("../tests.jai", contents);

    // Don't create an executable as the generator can run at compile-time
    set_build_options_dc(.{do_output=false});
}

#import "Compiler";
#import "File";
#import "String";
