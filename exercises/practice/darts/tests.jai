run_tests :: () {
    missed_target();
    skip(on_the_outer_circle());
    skip(on_the_middle_circle());
    skip(on_the_inner_circle());
    skip(exactly_on_center());
    skip(near_the_center());
    skip(just_within_the_inner_circle());
    skip(just_outside_the_inner_circle());
    skip(just_within_the_middle_circle());
    skip(just_outside_the_middle_circle());
    skip(just_within_the_outer_circle());
    skip(just_outside_the_outer_circle());
    skip(asymmetric_position_between_the_inner_and_middle_circles());
}

missed_target :: () {
    assert_equal(0, score(-9, 9));
}

on_the_outer_circle :: () {
    assert_equal(1, score(0, 10));
}

on_the_middle_circle :: () {
    assert_equal(5, score(-5, 0));
}

on_the_inner_circle :: () {
    assert_equal(10, score(0, -1));
}

exactly_on_center :: () {
    assert_equal(10, score(0, 0));
}

near_the_center :: () {
    assert_equal(10, score(-0.1, -0.1));
}

just_within_the_inner_circle :: () {
    assert_equal(10, score(0.7, 0.7));
}

just_outside_the_inner_circle :: () {
    assert_equal(5, score(0.8, -0.8));
}

just_within_the_middle_circle :: () {
    assert_equal(5, score(-3.5, 3.5));
}

just_outside_the_middle_circle :: () {
    assert_equal(1, score(-3.6, -3.6));
}

just_within_the_outer_circle :: () {
    assert_equal(1, score(-7, 7));
}

just_outside_the_outer_circle :: () {
    assert_equal(0, score(7.1, -7.1));
}

asymmetric_position_between_the_inner_and_middle_circles :: () {
    assert_equal(5, score(0.5, -4));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
