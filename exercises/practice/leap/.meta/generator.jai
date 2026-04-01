#import "Basic";
#import "Hash_Table";
#import "String";
#import,file "../../../shared/generator/module.jai";
#import,file "../../../shared/generator/json.jai";
#import,file "../../../shared/generator/tests_file.jai";

// TODO: perhaps make this into a macro
generate_test_files :: () {
canonical_bob := download_canonical_data("matrix");
    canonical := download_canonical_data("leap");
    print("Canonical data for leap: %\n", canonical);

    test_cases: [..] TestCase;
    for canonical_case: canonical.cases {
        expected := canonical_case.expected.boolean;
        year := get_number_property(canonical_case.input, "year");

        test_case := TestCase.{
            name = to_test_name(canonical_case.description_path),
            body = tprint("assert_equal(%, is_leap_year(%));", expected, year)
        };
        array_add(*test_cases, test_case);
    }

    generate_test_file_from_test_cases(test_cases);
}

#run generate_test_files();
