#import "Basic";
#import "Hash_Table";
#import "String";
#import,file "../../../shared/generator/module.jai";
#import,file "../../../shared/generator/tests_file.jai";

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

    generate_test_file(test_cases);
}

#run generate_tests();
