steps :: (number: int) -> ok: bool, number_of_steps: int {
    if number <= 0  return false, 0;

    number_of_steps := 0;

    while number != 1 {
        if number % 2 == 0 {
            number /= 2;
        } else {
            number = number * 3 + 1;
        }
        number_of_steps += 1;
    }

    return true, number_of_steps;
}
