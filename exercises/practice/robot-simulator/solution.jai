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
    // TODO: implement this procedure
}

move :: (robot: *Robot, instructions: string) {
    // TODO: implement this procedure
}
