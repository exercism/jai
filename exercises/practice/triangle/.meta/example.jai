is_equilateral :: (sides: [3]int) -> bool {
    if !is_valid(sides) return false;
    return sides[0] == sides[1] && sides[1] == sides[2];
}

is_isosceles :: (sides: [3]int) -> bool {
    if !is_valid(sides) return false;
    return sides[0] == sides[1] || sides[1] == sides[2] || sides[0] == sides[2];
}

is_scalene :: (sides: [3]int) -> bool {
    if !is_valid(sides) return false;
    return sides[0] != sides[1] && sides[1] != sides[2] && sides[0] != sides[2];
}

is_valid :: (sides: [3]int) -> bool {
    return sides[0] > 0 && sides[1] > 0 && sides[2] > 0 && 
           sides[0] + sides[1] > sides[2] && 
           sides[1] + sides[2] > sides[0] && 
           sides[0] + sides[2] > sides[1];
}
