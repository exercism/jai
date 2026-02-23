is_leap_year :: (year: int) -> bool {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
}
