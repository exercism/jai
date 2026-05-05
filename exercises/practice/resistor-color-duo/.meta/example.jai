COLORS :: string.["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];

value :: (colors: []string) -> int {
    return color_code(colors[0]) * 10 + color_code(colors[1]);
}

color_code :: (color: string) -> int {
    for COLORS if it == color return it_index;
    return -1;
}
