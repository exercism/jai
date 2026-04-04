run_tests :: () {
    square_of_sum_1();
    skip(square_of_sum_5());
    skip(square_of_sum_100());
    skip(sum_of_squares_1());
    skip(sum_of_squares_5());
    skip(sum_of_squares_100());
    skip(difference_of_squares_1());
    skip(difference_of_squares_5());
    skip(difference_of_squares_100());
}

square_of_sum_1 :: () {
    assert_equal(1, square_of_sum(1));
}

square_of_sum_5 :: () {
    assert_equal(225, square_of_sum(5));
}

square_of_sum_100 :: () {
    assert_equal(25502500, square_of_sum(100));
}

sum_of_squares_1 :: () {
    assert_equal(1, sum_of_squares(1));
}

sum_of_squares_5 :: () {
    assert_equal(55, sum_of_squares(5));
}

sum_of_squares_100 :: () {
    assert_equal(338350, sum_of_squares(100));
}

difference_of_squares_1 :: () {
    assert_equal(0, difference_of_squares(1));
}

difference_of_squares_5 :: () {
    assert_equal(170, difference_of_squares(5));
}

difference_of_squares_100 :: () {
    assert_equal(25164150, difference_of_squares(100));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
