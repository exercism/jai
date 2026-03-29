TestCase :: struct {
    name: string;
    body: string;
}

test_file_contents :: (test_cases: [] TestCase) -> string {
    builder: String_Builder;

    append(*builder, "#run {\n");
    for test_case: test_cases {
        if it_index == 0 {
            append(*builder, tprint("    %();\n", test_case.name));
        } else {
            append(*builder, tprint("    skip(%());\n", test_case.name));
        }
    }
    append(*builder, "}\n");

    for test_case: test_cases {
        append(*builder, tprint("\n% :: () {\n    %\n}\n", test_case.name, test_case.body));
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

generate_tests :: () {
    canonical := download_canonical_data("leap");

    test_cases: [..] TestCase;
    for canonical_case: canonical.cases {
        expected := canonical_case.expected.boolean;
        year_ptr := table_find_pointer(canonical_case.input.object, "year");
        assert(year_ptr != null);
        year := ((.*)year_ptr).number;

        test_case := TestCase.{
            name = replace(replace(replace(replace(replace(canonical_case.full_description, " ", "_"), "-", "_"), ".", "_"), ",", "_"), "__", "_"),
            body = tprint("assert_equal(%, is_leap_year(%));", expected, year)
        };
        array_add(*test_cases, test_case);
    }

    write_entire_file("../tests.jai", test_file_contents(test_cases));

    set_build_options_dc(.{do_output=false});
}

#run generate_tests();

#import "Basic";
#import "Compiler";
#import "File";
#import "Hash_Table";
#import "String";
#import,file "../../../shared/generator/module.jai";
