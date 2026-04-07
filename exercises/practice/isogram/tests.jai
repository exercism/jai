run_tests :: () {
    empty_string();
    skip(isogram_with_only_lower_case_characters());
    skip(word_with_one_duplicated_character());
    skip(word_with_one_duplicated_character_from_the_end_of_the_alphabet());
    skip(longest_reported_english_isogram());
    skip(word_with_duplicated_character_in_mixed_case());
    skip(word_with_duplicated_character_in_mixed_case_lowercase_first());
    skip(hypothetical_isogrammic_word_with_hyphen());
    skip(hypothetical_word_with_duplicated_character_following_hyphen());
    skip(isogram_with_duplicated_hyphen());
    skip(madeup_name_that_is_an_isogram());
    skip(duplicated_character_in_the_middle());
    skip(same_first_and_last_characters());
    skip(word_with_duplicated_character_and_with_two_hyphens());
}

empty_string :: () {
    assert_equal(true, is_isogram(""));
}

isogram_with_only_lower_case_characters :: () {
    assert_equal(true, is_isogram("isogram"));
}

word_with_one_duplicated_character :: () {
    assert_equal(false, is_isogram("eleven"));
}

word_with_one_duplicated_character_from_the_end_of_the_alphabet :: () {
    assert_equal(false, is_isogram("zzyzx"));
}

longest_reported_english_isogram :: () {
    assert_equal(true, is_isogram("subdermatoglyphic"));
}

word_with_duplicated_character_in_mixed_case :: () {
    assert_equal(false, is_isogram("Alphabet"));
}

word_with_duplicated_character_in_mixed_case_lowercase_first :: () {
    assert_equal(false, is_isogram("alphAbet"));
}

hypothetical_isogrammic_word_with_hyphen :: () {
    assert_equal(true, is_isogram("thumbscrew-japingly"));
}

hypothetical_word_with_duplicated_character_following_hyphen :: () {
    assert_equal(false, is_isogram("thumbscrew-jappingly"));
}

isogram_with_duplicated_hyphen :: () {
    assert_equal(true, is_isogram("six-year-old"));
}

madeup_name_that_is_an_isogram :: () {
    assert_equal(true, is_isogram("Emily Jung Schwartzkopf"));
}

duplicated_character_in_the_middle :: () {
    assert_equal(false, is_isogram("accentor"));
}

same_first_and_last_characters :: () {
    assert_equal(false, is_isogram("angola"));
}

word_with_duplicated_character_and_with_two_hyphens :: () {
    assert_equal(false, is_isogram("up-to-date"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
