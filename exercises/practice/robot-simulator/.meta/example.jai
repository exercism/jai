Direction :: enum u8 {
    NORTH;
    EAST;
    SOUTH;
    WEST;
};

Robot :: struct {
    x: int;
    y: int;
    direction: Direction;
};

create :: (x: int, y: int, direction: Direction) -> Robot {
    return .{x, y, direction};
}

x :: (using robot: Robot) -> int {
    return x;
}

y :: (using robot: Robot) -> int {
    return y;
}

direction :: (using robot: Robot) -> Direction {
    return direction;
}

move :: (using robot: *Robot, instructions: string) {
    for instructions {
        if it == {
            case #char "R"; direction = (direction + 1) % 4;
            case #char "L"; direction = (direction + 3) % 4;
            case #char "A";
                if direction == {
                    case Direction.NORTH; y += 1;
                    case Direction.EAST;  x += 1;
                    case Direction.SOUTH; y -= 1;
                    case Direction.WEST;  x -= 1;
                }
        }
    }
}
