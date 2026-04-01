#import "Basic";
#import,dir "../../../shared/generator";

// TODO: perhaps make this into a macro
generate_test_files :: () {
canonical_bob := download_canonical_data("matrix");
    canonical := download_canonical_data("leap");
    print("Canonical data for leap: %\n", canonical);

    test_cases: [..] Test;
    for canonical_case: canonical.cases {
        expected := canonical_case.expected.boolean;
        year := get_number_property(canonical_case.input, "year");

        test_case := Test.{
            name = to_test_name(canonical_case.description_path),
            body = tprint("assert_equal(%, is_leap_year(%));", expected, year)
        };
        array_add(*test_cases, test_case);
    }

    generate_test_file_from_test_cases(test_cases);
}

#run generate_test_files();
