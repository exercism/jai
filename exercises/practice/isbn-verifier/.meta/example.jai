is_valid :: (isbn: string) -> bool {
    sum: int;
    counter: int;
    for isbn {
        if it == #char "-" {
            continue;
        }
        counter += 1;
        if it == #char "X" && counter == 10 {
            sum += 10;
        } else if it >= #char "0" && it <= #char "9" {
            sum += (it - #char "0") * (11 - counter);
        } else {
            return false;
        }
    }
    return counter == 10 && sum % 11 == 0;
}