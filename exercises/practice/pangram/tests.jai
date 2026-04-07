run_tests :: () {
    empty_sentence();
    skip(perfect_lower_case());
    skip(only_lower_case());
    skip(missing_the_letter_x());
    skip(missing_the_letter_h());
    skip(with_underscores());
    skip(with_numbers());
    skip(missing_letters_replaced_by_numbers());
    skip(mixed_case_and_punctuation());
    skip(am_and_a_m_are_26_different_characters_but_not_a_pangram());
}

empty_sentence :: () {
    assert_equal(false, is_pangram(""));
}

perfect_lower_case :: () {
    assert_equal(true, is_pangram("abcdefghijklmnopqrstuvwxyz"));
}

only_lower_case :: () {
    assert_equal(true, is_pangram("the quick brown fox jumps over the lazy dog"));
}

missing_the_letter_x :: () {
    assert_equal(false, is_pangram("a quick movement of the enemy will jeopardize five gunboats"));
}

missing_the_letter_h :: () {
    assert_equal(false, is_pangram("five boxing wizards jump quickly at it"));
}

with_underscores :: () {
    assert_equal(true, is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog"));
}

with_numbers :: () {
    assert_equal(true, is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs"));
}

missing_letters_replaced_by_numbers :: () {
    assert_equal(false, is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));
}

mixed_case_and_punctuation :: () {
    assert_equal(true, is_pangram("\"Five quacking Zephyrs jolt my wax bed.\""));
}

am_and_a_m_are_26_different_characters_but_not_a_pangram :: () {
    assert_equal(false, is_pangram("abcdefghijklm ABCDEFGHIJKLM"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
