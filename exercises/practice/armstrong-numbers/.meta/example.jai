is_armstrong_number :: (number: int) -> bool {
    armstrong_sum := 0;
    digits := to_digits(number);

    for digits armstrong_sum += pow(it, digits.count);

    return armstrong_sum == number;
}

to_digits :: (number: int) -> []int {
    digits: [..]int;
    remainder := number;

    while remainder > 0 {
        array_add(*digits, remainder % 10);
        remainder /= 10;
    }

    return digits;
}

pow :: (base: int, exponent: int) -> int {
    result := 1;
    for 0..exponent-1 result *= base;
    return result;
}
