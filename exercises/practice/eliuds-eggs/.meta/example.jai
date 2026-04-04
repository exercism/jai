egg_count :: (number: int) -> int {
    count: int;

    remainder := number;

    while remainder {
        count += remainder & 1;
        remainder >>= 1;
    }

    return count;
}
