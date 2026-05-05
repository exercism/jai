run_tests :: () {
    basic();
    skip(lowercase_words());
    skip(punctuation());
    skip(all_caps_word());
    skip(punctuation_without_whitespace());
    skip(very_long_abbreviation());
    skip(consecutive_delimiters());
    skip(apostrophes());
    skip(underscore_emphasis());
}

basic :: () {
    assert_equal("PNG", abbreviate("Portable Network Graphics"));
}

lowercase_words :: () {
    assert_equal("ROR", abbreviate("Ruby on Rails"));
}

punctuation :: () {
    assert_equal("FIFO", abbreviate("First In, First Out"));
}

all_caps_word :: () {
    assert_equal("GIMP", abbreviate("GNU Image Manipulation Program"));
}

punctuation_without_whitespace :: () {
    assert_equal("CMOS", abbreviate("Complementary metal-oxide semiconductor"));
}

very_long_abbreviation :: () {
    assert_equal("ROTFLSHTMDCOALM", abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"));
}

consecutive_delimiters :: () {
    assert_equal("SIMUFTA", abbreviate("Something - I made up from thin air"));
}

apostrophes :: () {
    assert_equal("HC", abbreviate("Halley's Comet"));
}

underscore_emphasis :: () {
    assert_equal("TRNT", abbreviate("The Road _Not_ Taken"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
