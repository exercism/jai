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

to_test_name :: (description_path: []string) -> string {
    test_name := join(.. description_path, separator = " > ");
    test_name = replace(test_name, " ", "_");
    test_name = replace(test_name, "-", "_");
    test_name = replace(test_name, ".", "_");
    test_name = replace(test_name, ",", "_");
    test_name = replace(test_name, "__", "_");
    return test_name;
}

build_test_file_contents :: (tests: [] Test) -> string {
    builder: String_Builder;

    print_to_builder(*builder, "#run {\n");
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
    print_to_builder(*builder, "    finished_running_tests();\n");
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
