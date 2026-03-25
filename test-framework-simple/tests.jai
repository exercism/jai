is_leap_year_true :: () {
    assert_equal(true, is_leap_year(2000));
}

is_leap_year_false :: () {
    assert_equal(false, is_leap_year(1900));
}

is_leap_year_false2 :: () {
    assert_equal(false, is_leap_year(1901));
}

main :: () {
    run_test(is_leap_year_true());
    run_test(is_leap_year_false());
    run_test(is_leap_year_false2());
    print_test_report();
}

#run main();

#load "solution.jai";
#load "jaitest.jai";
