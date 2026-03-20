is_leap_year :: (i: int) -> bool {
    return (i % 4 == 0) && (i % 100 != 0 || i % 400 == 0);
}
