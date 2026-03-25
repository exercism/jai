is_leap_year_true :: () {
    assert_equal(is_leap_year(2000), true);
}

is_leap_year_false :: () {
    assert_equal(is_leap_year(1900), false);
} @skip

is_leap_year_false2 :: () {
    assert_equal(is_leap_year(1901), true);
} @skip

main :: () {
    #insert #run run_tests(.[
        is_leap_year_true(), 
        is_leap_year_false(), 
        is_leap_year_false2()
    ]);
}

#run main();

#load "solution.jai";
#load "jaitest.jai";
