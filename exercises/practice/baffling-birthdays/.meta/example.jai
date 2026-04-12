shared_birthday :: (birthdates: [] Calendar_Time) -> bool {
    unique_birthdays: [..] int;

    for birthdate: birthdates {
        birthday_key := cast(s16)birthdate.month_starting_at_0 * 31 + birthdate.day_of_month_starting_at_0;
        is_unique, _ := array_add_if_unique(*unique_birthdays, birthday_key);
        if !is_unique return true;
    }

    return false;
}

random_birthdates :: (count: int) -> [] Calendar_Time {
     birthdates : [..] Calendar_Time;
     array_reserve(*birthdates, count);
     for 1..count array_add(*birthdates, random_birthdate());
     return birthdates;
}

random_birthdate :: () -> Calendar_Time {
    is_leap_year :: (year: int) -> bool {
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
    }

    DAYS_IN_MONTH := u64.[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    year  := cast(s32) (random_get() % 100 + 1920);
    month := cast(s8)  (random_get() % 12);
    day   := cast(s8)  (random_get() % DAYS_IN_MONTH[month]);

    if is_leap_year(year) year -= 1;

    return .{year = year, month_starting_at_0 = month, day_of_month_starting_at_0 = day};
}

estimated_probability_of_shared_birthday :: (group_size: int) -> float {
    ITERATION_COUNT :: 1000;
    
    matching_birthday_iterations := 0.0;

    for 1..ITERATION_COUNT {
        birthdates := random_birthdates(group_size);
        if shared_birthday(birthdates) matching_birthday_iterations += 1;
    }
    
    return (matching_birthday_iterations / ITERATION_COUNT) * 100;
}

#import "Basic";
#import "Random";
