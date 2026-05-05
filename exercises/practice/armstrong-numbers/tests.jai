run_tests :: () {
    zero_is_an_armstrong_number();
    skip(singledigit_numbers_are_armstrong_numbers());
    skip(there_are_no_twodigit_armstrong_numbers());
    skip(threedigit_number_that_is_an_armstrong_number());
    skip(threedigit_number_that_is_not_an_armstrong_number());
    skip(fourdigit_number_that_is_an_armstrong_number());
    skip(fourdigit_number_that_is_not_an_armstrong_number());
    skip(sevendigit_number_that_is_an_armstrong_number());
    skip(sevendigit_number_that_is_not_an_armstrong_number());
}

zero_is_an_armstrong_number :: () {
    assert_equal(true, is_armstrong_number(0));
}

singledigit_numbers_are_armstrong_numbers :: () {
    assert_equal(true, is_armstrong_number(5));
}

there_are_no_twodigit_armstrong_numbers :: () {
    assert_equal(false, is_armstrong_number(10));
}

threedigit_number_that_is_an_armstrong_number :: () {
    assert_equal(true, is_armstrong_number(153));
}

threedigit_number_that_is_not_an_armstrong_number :: () {
    assert_equal(false, is_armstrong_number(100));
}

fourdigit_number_that_is_an_armstrong_number :: () {
    assert_equal(true, is_armstrong_number(9474));
}

fourdigit_number_that_is_not_an_armstrong_number :: () {
    assert_equal(false, is_armstrong_number(9475));
}

sevendigit_number_that_is_an_armstrong_number :: () {
    assert_equal(true, is_armstrong_number(9926315));
}

sevendigit_number_that_is_not_an_armstrong_number :: () {
    assert_equal(false, is_armstrong_number(9926314));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
