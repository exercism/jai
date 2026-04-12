run_tests :: () {
    single_digit_strings_can_not_be_valid();
    skip(a_single_zero_is_invalid());
    skip(a_simple_valid_s_i_n_that_remains_valid_if_reversed());
    skip(a_simple_valid_s_i_n_that_becomes_invalid_if_reversed());
    skip(a_valid_canadian_s_i_n());
    skip(invalid_canadian_s_i_n());
    skip(invalid_credit_card());
    skip(invalid_long_number_with_an_even_remainder());
    skip(invalid_long_number_with_a_remainder_divisible_by_5());
    skip(valid_number_with_an_even_number_of_digits());
    skip(valid_number_with_an_odd_number_of_spaces());
    skip(valid_strings_with_a_nondigit_added_at_the_end_become_invalid());
    skip(valid_strings_with_punctuation_included_become_invalid());
    skip(valid_strings_with_symbols_included_become_invalid());
    skip(single_zero_with_space_is_invalid());
    skip(more_than_a_single_zero_is_valid());
    skip(input_digit_9_is_correctly_converted_to_output_digit_9());
    skip(very_long_input_is_valid());
    skip(valid_luhn_with_an_odd_number_of_digits_and_non_zero_first_digit());
    skip(using_ascii_value_for_nondoubled_nondigit_isnt_allowed());
    skip(using_ascii_value_for_doubled_nondigit_isnt_allowed());
    skip(nonnumeric_nonspace_char_in_the_middle_with_a_sum_thats_divisible_by_10_isnt_allowed());
}

single_digit_strings_can_not_be_valid :: () {
    assert_equal(false, is_valid("1"));
}

a_single_zero_is_invalid :: () {
    assert_equal(false, is_valid("0"));
}

a_simple_valid_s_i_n_that_remains_valid_if_reversed :: () {
    assert_equal(true, is_valid("059"));
}

a_simple_valid_s_i_n_that_becomes_invalid_if_reversed :: () {
    assert_equal(true, is_valid("59"));
}

a_valid_canadian_s_i_n :: () {
    assert_equal(true, is_valid("055 444 285"));
}

invalid_canadian_s_i_n :: () {
    assert_equal(false, is_valid("055 444 286"));
}

invalid_credit_card :: () {
    assert_equal(false, is_valid("8273 1232 7352 0569"));
}

invalid_long_number_with_an_even_remainder :: () {
    assert_equal(false, is_valid("1 2345 6789 1234 5678 9012"));
}

invalid_long_number_with_a_remainder_divisible_by_5 :: () {
    assert_equal(false, is_valid("1 2345 6789 1234 5678 9013"));
}

valid_number_with_an_even_number_of_digits :: () {
    assert_equal(true, is_valid("095 245 88"));
}

valid_number_with_an_odd_number_of_spaces :: () {
    assert_equal(true, is_valid("234 567 891 234"));
}

valid_strings_with_a_nondigit_added_at_the_end_become_invalid :: () {
    assert_equal(false, is_valid("059a"));
}

valid_strings_with_punctuation_included_become_invalid :: () {
    assert_equal(false, is_valid("055-444-285"));
}

valid_strings_with_symbols_included_become_invalid :: () {
    assert_equal(false, is_valid("055# 444$ 285"));
}

single_zero_with_space_is_invalid :: () {
    assert_equal(false, is_valid(" 0"));
}

more_than_a_single_zero_is_valid :: () {
    assert_equal(true, is_valid("0000 0"));
}

input_digit_9_is_correctly_converted_to_output_digit_9 :: () {
    assert_equal(true, is_valid("091"));
}

very_long_input_is_valid :: () {
    assert_equal(true, is_valid("9999999999 9999999999 9999999999 9999999999"));
}

valid_luhn_with_an_odd_number_of_digits_and_non_zero_first_digit :: () {
    assert_equal(true, is_valid("109"));
}

using_ascii_value_for_nondoubled_nondigit_isnt_allowed :: () {
    assert_equal(false, is_valid("055b 444 285"));
}

using_ascii_value_for_doubled_nondigit_isnt_allowed :: () {
    assert_equal(false, is_valid(":9"));
}

nonnumeric_nonspace_char_in_the_middle_with_a_sum_thats_divisible_by_10_isnt_allowed :: () {
    assert_equal(false, is_valid("59%59"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
