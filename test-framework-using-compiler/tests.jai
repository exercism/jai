is_leap_year_true :: () {
    assert_equal(is_leap_year(2000), true);
} @test;

is_leap_year_false :: () {
    assert_equal(is_leap_year(1900), false);
} @test @skip;

is_leap_year_false2 :: () {
    assert_equal(is_leap_year(1901), true);
} @test;

#load "solution.jai";
#load "jaitest.jai";
