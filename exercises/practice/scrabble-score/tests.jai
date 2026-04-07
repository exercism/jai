run_tests :: () {
    lowercase_letter();
    skip(uppercase_letter());
    skip(valuable_letter());
    skip(short_word());
    skip(short_valuable_word());
    skip(medium_word());
    skip(medium_valuable_word());
    skip(long_mixedcase_word());
    skip(englishlike_word());
    skip(empty_input());
    skip(entire_alphabet_available());
}

lowercase_letter :: () {
    assert_equal(1, score("a"));
}

uppercase_letter :: () {
    assert_equal(1, score("A"));
}

valuable_letter :: () {
    assert_equal(4, score("f"));
}

short_word :: () {
    assert_equal(2, score("at"));
}

short_valuable_word :: () {
    assert_equal(12, score("zoo"));
}

medium_word :: () {
    assert_equal(6, score("street"));
}

medium_valuable_word :: () {
    assert_equal(22, score("quirky"));
}

long_mixedcase_word :: () {
    assert_equal(41, score("OxyphenButazone"));
}

englishlike_word :: () {
    assert_equal(8, score("pinata"));
}

empty_input :: () {
    assert_equal(0, score(""));
}

entire_alphabet_available :: () {
    assert_equal(87, score("abcdefghijklmnopqrstuvwxyz"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
