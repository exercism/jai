#import "Basic";
#import "Hash_Table";
#import "String";
#import,file "../../../shared/generator/module.jai";
#import,file "../../../shared/generator/tests_file.jai";

generate_test_files :: () {
    canonical := download_canonical_data("leap");

    test_cases: [..] TestCase;
    for canonical_case: canonical.cases {
        expected := canonical_case.expected.boolean;
        year := json_get_number_property(canonical_case.input.object, "year");

        test_case := TestCase.{
            name = replace(replace(replace(replace(replace(canonical_case.full_description, " ", "_"), "-", "_"), ".", "_"), ",", "_"), "__", "_"),
            body = tprint("assert_equal(%, is_leap_year(%));", expected, year)
        };
        array_add(*test_cases, test_case);
    }

    generate_test_file_from_test_cases(test_cases);
}

#run generate_test_files();
