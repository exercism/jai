run_tests :: () {
    an_empty_string();
    skip(a_word());
    skip(a_capitalized_word());
    skip(a_sentence_with_punctuation());
    skip(a_palindrome());
    skip(an_evensized_word());
}

an_empty_string :: () {
    assert_equal("", reverse_string(""));
}

a_word :: () {
    assert_equal("tobor", reverse_string("robot"));
}

a_capitalized_word :: () {
    assert_equal("nemaR", reverse_string("Ramen"));
}

a_sentence_with_punctuation :: () {
    assert_equal("!yrgnuh m'I", reverse_string("I'm hungry!"));
}

a_palindrome :: () {
    assert_equal("racecar", reverse_string("racecar"));
}

an_evensized_word :: () {
    assert_equal("reward", reverse_string("drawer"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
