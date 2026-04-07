is_isogram :: (phrase: string) -> bool {
    seen_letters: int;

    for phrase {
        c := to_lower(it);
        if c < #char "a" || c > #char "z"  continue;
        bit := 1 << (c - #char "a");
        if seen_letters & bit != 0  return false;
        seen_letters |= bit;
    }

    return true;
}
