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

    append(*builder, "#run {\n");
    for tests {
        if it.skip {
            append(*builder, tprint("    skip(%());\n", it.name));
        } else {
            append(*builder, tprint("    %();\n", it.name));
        }
    }
    append(*builder, "}\n");

    for tests {
        append(*builder, tprint("\n% :: () {\n    %\n}\n", it.name, it.body));
    }

    append(*builder, #string END

#run {
    finished_running_tests();
}

#load "solution.jai";
#load "extest.jai";
    END);

    return builder_to_string(*builder);
}

write_test_file :: (test_cases: [] Test) {
    contents := build_test_file_contents(test_cases);
    write_entire_file("../tests.jai", contents);

    // Do no create an executable for this module, since it's meant to be at compile-time
    set_build_options_dc(.{do_output=false});
}

#import "Compiler";
#import "File";
#import "String";
