DAYS  :: string.["", "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"];
GIFTS :: string.["", "a Partridge in a Pear Tree.", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"];

recite :: (start_verse: int, end_verse: int) -> string {
    song: String_Builder;

    for verse_number: start_verse..end_verse {
        print_to_builder(*song, "On the % day of Christmas my true love gave to me: ", DAYS[verse_number]);

        for < 1..verse_number {
            if it == 1 && verse_number > 1 append(*song, "and ");
            print_to_builder(*song, "%", GIFTS[it]);
            if it != 1 append(*song, ", ");
        }

        append(*song, "\n");
    }

    return builder_to_string(*song);
}
