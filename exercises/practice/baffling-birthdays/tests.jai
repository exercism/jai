run_tests :: () {
    shared_birthday_one_birthdate();
    skip(shared_birthday_two_birthdates_with_same_year_month_and_day());
    skip(shared_birthday_two_birthdates_with_same_year_and_month_but_different_day());
    skip(shared_birthday_two_birthdates_with_same_month_and_day_but_different_year());
    skip(shared_birthday_two_birthdates_with_same_year_but_different_month_and_day());
    skip(shared_birthday_two_birthdates_with_different_year_month_and_day());
    skip(shared_birthday_multiple_birthdates_without_shared_birthday());
    skip(shared_birthday_multiple_birthdates_with_one_shared_birthday());
    skip(shared_birthday_multiple_birthdates_with_more_than_one_shared_birthday());
    skip(random_birthdates_generate_requested_number_of_birthdates());
    skip(random_birthdates_years_are_not_leap_years());
    skip(random_birthdates_months_are_random());
    skip(random_birthdates_days_are_random());
    skip(estimated_probability_of_at_least_one_shared_birthday_for_one_person());
    skip(estimated_probability_of_at_least_one_shared_birthday_among_ten_people());
    skip(estimated_probability_of_at_least_one_shared_birthday_among_twentythree_people());
    skip(estimated_probability_of_at_least_one_shared_birthday_among_seventy_people());
}

shared_birthday_one_birthdate :: () {
    assert_equal(false, shared_birthday(.["2000-01-01"]));
}

shared_birthday_two_birthdates_with_same_year_month_and_day :: () {
    assert_equal(true, shared_birthday(.["2000-01-01", "2000-01-01"]));
}

shared_birthday_two_birthdates_with_same_year_and_month_but_different_day :: () {
    assert_equal(false, shared_birthday(.["2012-05-09", "2012-05-17"]));
}

shared_birthday_two_birthdates_with_same_month_and_day_but_different_year :: () {
    assert_equal(true, shared_birthday(.["1999-10-23", "1988-10-23"]));
}

shared_birthday_two_birthdates_with_same_year_but_different_month_and_day :: () {
    assert_equal(false, shared_birthday(.["2007-12-19", "2007-04-27"]));
}

shared_birthday_two_birthdates_with_different_year_month_and_day :: () {
    assert_equal(false, shared_birthday(.["1997-08-04", "1963-11-23"]));
}

shared_birthday_multiple_birthdates_without_shared_birthday :: () {
    assert_equal(false, shared_birthday(.["1966-07-29", "1977-02-12", "2001-12-25", "1980-11-10"]));
}

shared_birthday_multiple_birthdates_with_one_shared_birthday :: () {
    assert_equal(true, shared_birthday(.["1966-07-29", "1977-02-12", "2001-07-29", "1980-11-10"]));
}

shared_birthday_multiple_birthdates_with_more_than_one_shared_birthday :: () {
    assert_equal(true, shared_birthday(.["1966-07-29", "1977-02-12", "2001-12-25", "1980-07-29", "2019-02-12"]));
}

random_birthdates_generate_requested_number_of_birthdates :: () {
    for 1..10 {
        assert_equal(it, random_birthdates(it).count);
    }
}

random_birthdates_years_are_not_leap_years :: () {
    for 1..10 {
        assert_equal(it, random_birthdates(it).count);
    }
}

random_birthdates_months_are_random :: () {
    for 1..10 {
        assert_equal(it, random_birthdates(it).count);
    }
}

random_birthdates_days_are_random :: () {
    for 1..10 {
        assert_equal(it, random_birthdates(it).count);
    }
}

estimated_probability_of_at_least_one_shared_birthday_for_one_person :: () {
    assert_equal(0.0, estimated_probability_of_shared_birthday(1));
}

estimated_probability_of_at_least_one_shared_birthday_among_ten_people :: () {
    assert_equal(11.694818, estimated_probability_of_shared_birthday(10));
}

estimated_probability_of_at_least_one_shared_birthday_among_twentythree_people :: () {
    assert_equal(50.729723, estimated_probability_of_shared_birthday(23));
}

estimated_probability_of_at_least_one_shared_birthday_among_seventy_people :: () {
    assert_equal(99.915958, estimated_probability_of_shared_birthday(70));
}

to_date :: (str: string) -> Calendar_Time {
    using ct: Calendar_Time;
    parts = split(str, "-");
    year = to_integer(parts[0]);
    month_starting_at_0 = to_integer(parts[1]) - 1;
    day_of_month_starting_at_0 = to_integer(parts[2]) - 1;
    return ct;
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
