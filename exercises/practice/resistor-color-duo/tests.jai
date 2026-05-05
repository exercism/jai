run_tests :: () {
    brown_and_black();
    skip(blue_and_grey());
    skip(yellow_and_violet());
    skip(white_and_red());
    skip(orange_and_orange());
    skip(ignore_additional_colors());
    skip(black_and_brown_onedigit());
}

brown_and_black :: () {
    assert_equal(10, value(.["brown", "black"]));
}

blue_and_grey :: () {
    assert_equal(68, value(.["blue", "grey"]));
}

yellow_and_violet :: () {
    assert_equal(47, value(.["yellow", "violet"]));
}

white_and_red :: () {
    assert_equal(92, value(.["white", "red"]));
}

orange_and_orange :: () {
    assert_equal(33, value(.["orange", "orange"]));
}

ignore_additional_colors :: () {
    assert_equal(51, value(.["green", "brown", "orange"]));
}

black_and_brown_onedigit :: () {
    assert_equal(1, value(.["black", "brown"]));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
