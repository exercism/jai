COUNTS             :: string.["no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];
CAPITALIZED_COUNTS :: string.["No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"];

VERSE :: #string DONE
%1 green %2 hanging on the wall,
%1 green %2 hanging on the wall,
And if one green bottle should accidentally fall,
There'll be %3 green %4 hanging on the wall.
DONE

num_bottles :: (bottles: int) -> string {
    return ifx bottles == 1 then "bottle" else "bottles";
}

recite :: (start_bottles: int, take_down: int) -> string {
    song: String_Builder;

    for 0 ..take_down-1 {
        bottles := start_bottles - it;
        next_bottles := bottles - 1;

        print_to_builder(*song, VERSE, CAPITALIZED_COUNTS[bottles], num_bottles(bottles), COUNTS[next_bottles], num_bottles(next_bottles));

        if it < take_down - 1 append(*song, "\n");
    }

    return builder_to_string(*song);
}
