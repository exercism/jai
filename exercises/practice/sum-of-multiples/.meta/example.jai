sum :: (factors: []int, limit: int) -> int {
    sum: int;

    for i: 1..limit-1 {
        for factor: factors {
            if factor == 0  continue;

            if i % factor == 0 {
                sum += i;
                break;
            }
        }
    }

    return sum;
}
