is_pangram :: (sentence: string) -> bool {
    alphabet: int;

    for sentence {
        c := to_lower(it);
        if c < #char "a" || c > #char "z"  continue;
        bit := 1 << (c - #char "a");
        alphabet |= bit;
    }

    return alphabet == 0x3FFFFFF;
}
