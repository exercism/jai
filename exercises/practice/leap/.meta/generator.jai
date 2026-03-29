TEMPLATE :: #string DONE
#run {
    year_not_divisible_by_4_in_common_year();
    skip(year_divisible_by_2_not_divisible_by_4_in_common_year());
    skip(year_divisible_by_4_not_divisible_by_100_in_leap_year());
    skip(year_divisible_by_4_and_5_is_still_a_leap_year());
    skip(year_divisible_by_100_not_divisible_by_400_in_common_year());
    skip(year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year());
    skip(year_divisible_by_400_is_leap_year());
    skip(year_divisible_by_400_but_not_by_125_is_still_a_leap_year());
    skip(year_divisible_by_200_not_divisible_by_400_in_common_year());
}

year_not_divisible_by_4_in_common_year :: () {
    assert_equal(false, is_leap_year(2015));
}

year_divisible_by_2_not_divisible_by_4_in_common_year :: () {
    assert_equal(false, is_leap_year(1970));
}

year_divisible_by_4_not_divisible_by_100_in_leap_year :: () {
    assert_equal(true, is_leap_year(1996));
}

year_divisible_by_4_and_5_is_still_a_leap_year :: () {
    assert_equal(true, is_leap_year(1960));
}

year_divisible_by_100_not_divisible_by_400_in_common_year :: () {
    assert_equal(false, is_leap_year(2100));
}

year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year :: () {
    assert_equal(false, is_leap_year(1900));
}

year_divisible_by_400_is_leap_year :: () {
    assert_equal(true, is_leap_year(2000));
}

year_divisible_by_400_but_not_by_125_is_still_a_leap_year :: () {
    assert_equal(true, is_leap_year(2400));
}

year_divisible_by_200_not_divisible_by_400_in_common_year :: () {
    assert_equal(false, is_leap_year(1800));
}

#run {
    finished_running_tests();
}

#load "solution.jai";
#load "extest.jai";

DONE

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

main :: () {
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

    // print("%\n", test_file_contents(test_cases));

    write_entire_file("../tests.jai", test_file_contents(test_cases));

    // #insert #run test();

    // // json_str := download_canonical_data("clock");

    // parse_ok, result := json_parse_string(json_str);

    // assert(parse_ok);

    // decode_ok, canonical := decode_canonical_data(result);
    // assert(decode_ok, "Failed to decode canonical-data shape");
}

#run main();

#import "Basic";
#import "File";
#import "Hash_Table";
#import "String";
#import,file "../../../shared/generator/module.jai";
