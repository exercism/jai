run_tests :: () {
    color_codes_black();
    skip(color_codes_white());
    skip(color_codes_orange());
    skip(colors());
}

color_codes_black :: () {
    assert_equal(0, color_code("black"));
}

color_codes_white :: () {
    assert_equal(9, color_code("white"));
}

color_codes_orange :: () {
    assert_equal(3, color_code("orange"));
}

colors :: () {
    assert_equal(10, COLORS.count);
    assert_equal("black", COLORS[0]);
    assert_equal("brown", COLORS[1]);
    assert_equal("red", COLORS[2]);
    assert_equal("orange", COLORS[3]);
    assert_equal("yellow", COLORS[4]);
    assert_equal("green", COLORS[5]);
    assert_equal("blue", COLORS[6]);
    assert_equal("violet", COLORS[7]);
    assert_equal("grey", COLORS[8]);
    assert_equal("white", COLORS[9]);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
