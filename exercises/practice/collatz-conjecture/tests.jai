run_tests :: () {
    zero_steps_for_one();
    skip(divide_if_even());
    skip(even_and_odd_steps());
    skip(large_number_of_even_and_odd_steps());
    skip(zero_is_an_error());
    skip(negative_value_is_an_error());
}

zero_steps_for_one :: () {
    ok, number_of_steps := steps(1);
    assert_equal(true, ok);
    assert_equal(0, number_of_steps);
}

divide_if_even :: () {
    ok, number_of_steps := steps(16);
    assert_equal(true, ok);
    assert_equal(4, number_of_steps);
}

even_and_odd_steps :: () {
    ok, number_of_steps := steps(12);
    assert_equal(true, ok);
    assert_equal(9, number_of_steps);
}

large_number_of_even_and_odd_steps :: () {
    ok, number_of_steps := steps(1000000);
    assert_equal(true, ok);
    assert_equal(152, number_of_steps);
}

zero_is_an_error :: () {
    ok, _ := steps(0);
    assert_equal(false, ok);
}

negative_value_is_an_error :: () {
    ok, _ := steps(-15);
    assert_equal(false, ok);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
