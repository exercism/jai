COLORS :: string.["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];

label :: (colors: []string) -> string {
    value := color_code(colors[0]) * 10 + color_code(colors[1]);
    zeros := cast(int) pow(10.0, cast(float) color_code(colors[2]));
    full_value := value * zeros;

    if full_value >= 1_000_000_000 return tprint("% gigaohms", full_value / 1_000_000_000);
    if full_value >= 1_000_000     return tprint("% megaohms", full_value / 1_000_000);
    if full_value >= 1_000         return tprint("% kiloohms", full_value / 1_000);    
    return tprint("% ohms", full_value);
}

color_code :: (color: string) -> int {
    for COLORS if it == color return it_index;
    return -1;
}

#import "Math";
