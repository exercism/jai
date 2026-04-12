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
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 2000, month_starting_at_0 = 0, day_of_month_starting_at_0 = 0});
    assert_equal(false, shared_birthday(birthdates));
}

shared_birthday_two_birthdates_with_same_year_month_and_day :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 2000, month_starting_at_0 = 0, day_of_month_starting_at_0 = 0});
    array_add(*birthdates, .{year = 2000, month_starting_at_0 = 0, day_of_month_starting_at_0 = 0});
    assert_equal(true, shared_birthday(birthdates));
}

shared_birthday_two_birthdates_with_same_year_and_month_but_different_day :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 2012, month_starting_at_0 = 4, day_of_month_starting_at_0 = 8});
    array_add(*birthdates, .{year = 2012, month_starting_at_0 = 4, day_of_month_starting_at_0 = 16});
    assert_equal(false, shared_birthday(birthdates));
}

shared_birthday_two_birthdates_with_same_month_and_day_but_different_year :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 1999, month_starting_at_0 = 9, day_of_month_starting_at_0 = 22});
    array_add(*birthdates, .{year = 1988, month_starting_at_0 = 9, day_of_month_starting_at_0 = 22});
    assert_equal(true, shared_birthday(birthdates));
}

shared_birthday_two_birthdates_with_same_year_but_different_month_and_day :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 2007, month_starting_at_0 = 11, day_of_month_starting_at_0 = 18});
    array_add(*birthdates, .{year = 2007, month_starting_at_0 = 3, day_of_month_starting_at_0 = 26});
    assert_equal(false, shared_birthday(birthdates));
}

shared_birthday_two_birthdates_with_different_year_month_and_day :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 1997, month_starting_at_0 = 7, day_of_month_starting_at_0 = 3});
    array_add(*birthdates, .{year = 1963, month_starting_at_0 = 10, day_of_month_starting_at_0 = 22});
    assert_equal(false, shared_birthday(birthdates));
}

shared_birthday_multiple_birthdates_without_shared_birthday :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 1966, month_starting_at_0 = 6, day_of_month_starting_at_0 = 28});
    array_add(*birthdates, .{year = 1977, month_starting_at_0 = 1, day_of_month_starting_at_0 = 11});
    array_add(*birthdates, .{year = 2001, month_starting_at_0 = 11, day_of_month_starting_at_0 = 24});
    array_add(*birthdates, .{year = 1980, month_starting_at_0 = 10, day_of_month_starting_at_0 = 9});
    assert_equal(false, shared_birthday(birthdates));
}

shared_birthday_multiple_birthdates_with_one_shared_birthday :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 1966, month_starting_at_0 = 6, day_of_month_starting_at_0 = 28});
    array_add(*birthdates, .{year = 1977, month_starting_at_0 = 1, day_of_month_starting_at_0 = 11});
    array_add(*birthdates, .{year = 2001, month_starting_at_0 = 6, day_of_month_starting_at_0 = 28});
    array_add(*birthdates, .{year = 1980, month_starting_at_0 = 10, day_of_month_starting_at_0 = 9});
    assert_equal(true, shared_birthday(birthdates));
}

shared_birthday_multiple_birthdates_with_more_than_one_shared_birthday :: () {
    birthdates : [..] Calendar_Time;
    array_add(*birthdates, .{year = 1966, month_starting_at_0 = 6, day_of_month_starting_at_0 = 28});
    array_add(*birthdates, .{year = 1977, month_starting_at_0 = 1, day_of_month_starting_at_0 = 11});
    array_add(*birthdates, .{year = 2001, month_starting_at_0 = 11, day_of_month_starting_at_0 = 24});
    array_add(*birthdates, .{year = 1980, month_starting_at_0 = 6, day_of_month_starting_at_0 = 28});
    array_add(*birthdates, .{year = 2019, month_starting_at_0 = 1, day_of_month_starting_at_0 = 11});
    assert_equal(true, shared_birthday(birthdates));
}

random_birthdates_generate_requested_number_of_birthdates :: () {
    for 1..10 {
        assert_equal(it, random_birthdates(it).count);
    }
}

random_birthdates_years_are_not_leap_years :: () {
    is_leap_year :: (year: int) -> bool {
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
    }
    
    for birthdate: random_birthdates(50) {
        assert_equal(false, is_leap_year(birthdate.year));
    }
}

random_birthdates_months_are_random :: () {
    generated_unique_months: [..]s8;
    for birthdate: random_birthdates(100) {
        array_add_if_unique(*generated_unique_months, birthdate.month_starting_at_0);
    }
    
    assert_equal(12, generated_unique_months.count);
}

random_birthdates_days_are_random :: () {
    generated_unique_days: [..]s8;
    for birthdate: random_birthdates(300) {
        array_add_if_unique(*generated_unique_days, birthdate.day_of_month_starting_at_0);
    }
    
    assert_equal(31, generated_unique_days.count);
}

estimated_probability_of_at_least_one_shared_birthday_for_one_person :: () {
    estimated_probability := estimated_probability_of_shared_birthday(1);
    expected_probability := 0.0;
    assert_equal(true, estimated_probability > expected_probability - 1.0);
    assert_equal(true, estimated_probability < expected_probability + 1.0);
}

estimated_probability_of_at_least_one_shared_birthday_among_ten_people :: () {
    estimated_probability := estimated_probability_of_shared_birthday(10);
    expected_probability := 11.694818;
    assert_equal(true, estimated_probability > expected_probability - 1.0);
    assert_equal(true, estimated_probability < expected_probability + 1.0);
}

estimated_probability_of_at_least_one_shared_birthday_among_twentythree_people :: () {
    estimated_probability := estimated_probability_of_shared_birthday(23);
    expected_probability := 50.729723;
    assert_equal(true, estimated_probability > expected_probability - 1.0);
    assert_equal(true, estimated_probability < expected_probability + 1.0);
}

estimated_probability_of_at_least_one_shared_birthday_among_seventy_people :: () {
    estimated_probability := estimated_probability_of_shared_birthday(70);
    expected_probability := 99.915958;
    assert_equal(true, estimated_probability > expected_probability - 1.0);
    assert_equal(true, estimated_probability < expected_probability + 1.0);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
