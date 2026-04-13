is_valid :: (value_str: string) -> bool {
    result: int;
    counter: int;

    for < value_str {
        c := to_lower(it);
        if c == #char " " then continue;
        if c < #char "0" || c > #char "9"  then return false;
        digit := c - #char "0";

        if counter % 2 == 1 
            then if digit * 2 > 9 then result += digit * 2 - 9; else result += digit * 2;
        else
            result += digit;
        
        counter += 1;
    }
    if counter <= 1 return false;

    return result % 10 == 0;
}
