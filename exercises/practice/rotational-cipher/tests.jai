run_tests :: () {
    rotate_a_by_0_same_output_as_input();
    skip(rotate_a_by_1());
    skip(rotate_a_by_26_same_output_as_input());
    skip(rotate_m_by_13());
    skip(rotate_n_by_13_with_wrap_around_alphabet());
    skip(rotate_capital_letters());
    skip(rotate_spaces());
    skip(rotate_numbers());
    skip(rotate_punctuation());
    skip(rotate_all_letters());
}

rotate_a_by_0_same_output_as_input :: () {
    assert_equal("a", rotate("a", 0));
}

rotate_a_by_1 :: () {
    assert_equal("b", rotate("a", 1));
}

rotate_a_by_26_same_output_as_input :: () {
    assert_equal("a", rotate("a", 26));
}

rotate_m_by_13 :: () {
    assert_equal("z", rotate("m", 13));
}

rotate_n_by_13_with_wrap_around_alphabet :: () {
    assert_equal("a", rotate("n", 13));
}

rotate_capital_letters :: () {
    assert_equal("TRL", rotate("OMG", 5));
}

rotate_spaces :: () {
    assert_equal("T R L", rotate("O M G", 5));
}

rotate_numbers :: () {
    assert_equal("Xiwxmrk 1 2 3 xiwxmrk", rotate("Testing 1 2 3 testing", 4));
}

rotate_punctuation :: () {
    assert_equal("Gzo'n zvo, Bmviyhv!", rotate("Let's eat, Grandma!", 21));
}

rotate_all_letters :: () {
    assert_equal("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.", rotate("The quick brown fox jumps over the lazy dog.", 13));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
