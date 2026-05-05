square_root :: (radicand: int) -> int {
    i, result := 1;

    while result <= radicand {
        i += 1;
        result = i * i;
    }

    return i - 1;
}
