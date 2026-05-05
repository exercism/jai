run_tests :: () {
    orange_and_orange_and_black();
    skip(blue_and_grey_and_brown());
    skip(red_and_black_and_red());
    skip(green_and_brown_and_orange());
    skip(yellow_and_violet_and_yellow());
    skip(blue_and_violet_and_blue());
    skip(minimum_possible_value());
    skip(maximum_possible_value());
    skip(first_two_colors_make_an_invalid_octal_number());
    skip(ignore_extra_colors());
}

orange_and_orange_and_black :: () {
    assert_equal("33 ohms", label(.["orange", "orange", "black"]));
}

blue_and_grey_and_brown :: () {
    assert_equal("680 ohms", label(.["blue", "grey", "brown"]));
}

red_and_black_and_red :: () {
    assert_equal("2 kiloohms", label(.["red", "black", "red"]));
}

green_and_brown_and_orange :: () {
    assert_equal("51 kiloohms", label(.["green", "brown", "orange"]));
}

yellow_and_violet_and_yellow :: () {
    assert_equal("470 kiloohms", label(.["yellow", "violet", "yellow"]));
}

blue_and_violet_and_blue :: () {
    assert_equal("67 megaohms", label(.["blue", "violet", "blue"]));
}

minimum_possible_value :: () {
    assert_equal("0 ohms", label(.["black", "black", "black"]));
}

maximum_possible_value :: () {
    assert_equal("99 gigaohms", label(.["white", "white", "white"]));
}

first_two_colors_make_an_invalid_octal_number :: () {
    assert_equal("8 ohms", label(.["black", "grey", "black"]));
}

ignore_extra_colors :: () {
    assert_equal("650 kiloohms", label(.["blue", "green", "yellow", "orange"]));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
