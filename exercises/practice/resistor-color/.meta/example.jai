COLORS :: string.["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];

color_code :: (color: string) -> int {
    for COLORS if it == color return it_index;
    return -1;
}
