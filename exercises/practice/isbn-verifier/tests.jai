run_tests :: () {
    valid_isbn();
    skip(invalid_isbn_check_digit());
    skip(valid_isbn_with_a_check_digit_of_10());
    skip(check_digit_is_a_character_other_than_x());
    skip(invalid_check_digit_in_isbn_is_not_treated_as_zero());
    skip(invalid_character_in_isbn_is_not_treated_as_zero());
    skip(x_is_only_valid_as_a_check_digit());
    skip(only_one_check_digit_is_allowed());
    skip(x_is_not_substituted_by_the_value_10());
    skip(valid_isbn_without_separating_dashes());
    skip(isbn_without_separating_dashes_and_x_as_check_digit());
    skip(isbn_without_check_digit_and_dashes());
    skip(too_long_isbn_and_no_dashes());
    skip(too_short_isbn());
    skip(isbn_without_check_digit());
    skip(check_digit_of_x_should_not_be_used_for_0());
    skip(empty_isbn());
    skip(input_is_9_characters());
    skip(invalid_characters_are_not_ignored_after_checking_length());
    skip(invalid_characters_are_not_ignored_before_checking_length());
    skip(input_is_too_long_but_contains_a_valid_isbn());
}

valid_isbn :: () {
    assert_equal(true, is_valid("3-598-21508-8"));
}

invalid_isbn_check_digit :: () {
    assert_equal(false, is_valid("3-598-21508-9"));
}

valid_isbn_with_a_check_digit_of_10 :: () {
    assert_equal(true, is_valid("3-598-21507-X"));
}

check_digit_is_a_character_other_than_x :: () {
    assert_equal(false, is_valid("3-598-21507-A"));
}

invalid_check_digit_in_isbn_is_not_treated_as_zero :: () {
    assert_equal(false, is_valid("4-598-21507-B"));
}

invalid_character_in_isbn_is_not_treated_as_zero :: () {
    assert_equal(false, is_valid("3-598-P1581-X"));
}

x_is_only_valid_as_a_check_digit :: () {
    assert_equal(false, is_valid("3-598-2X507-9"));
}

only_one_check_digit_is_allowed :: () {
    assert_equal(false, is_valid("3-598-21508-96"));
}

x_is_not_substituted_by_the_value_10 :: () {
    assert_equal(false, is_valid("3-598-2X507-5"));
}

valid_isbn_without_separating_dashes :: () {
    assert_equal(true, is_valid("3598215088"));
}

isbn_without_separating_dashes_and_x_as_check_digit :: () {
    assert_equal(true, is_valid("359821507X"));
}

isbn_without_check_digit_and_dashes :: () {
    assert_equal(false, is_valid("359821507"));
}

too_long_isbn_and_no_dashes :: () {
    assert_equal(false, is_valid("3598215078X"));
}

too_short_isbn :: () {
    assert_equal(false, is_valid("00"));
}

isbn_without_check_digit :: () {
    assert_equal(false, is_valid("3-598-21507"));
}

check_digit_of_x_should_not_be_used_for_0 :: () {
    assert_equal(false, is_valid("3-598-21515-X"));
}

empty_isbn :: () {
    assert_equal(false, is_valid(""));
}

input_is_9_characters :: () {
    assert_equal(false, is_valid("134456729"));
}

invalid_characters_are_not_ignored_after_checking_length :: () {
    assert_equal(false, is_valid("3132P34035"));
}

invalid_characters_are_not_ignored_before_checking_length :: () {
    assert_equal(false, is_valid("3598P215088"));
}

input_is_too_long_but_contains_a_valid_isbn :: () {
    assert_equal(false, is_valid("98245726788"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
