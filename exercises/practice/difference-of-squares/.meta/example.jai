square_of_sum :: (number: int) -> int {
    sum: int;
    for 1..number  sum += it;
    return sum * sum;
}

sum_of_squares :: (number: int) -> int {
    sum: int;
    for 1..number  sum += it * it;
    return sum;
}

difference_of_squares :: (number: int) -> int {
    return square_of_sum(number) - sum_of_squares(number);
}
