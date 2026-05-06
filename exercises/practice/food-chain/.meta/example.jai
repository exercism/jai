ANIMALS  :: string.["", "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"];
PHRASES  :: string.["", "I don't know why she swallowed the fly. Perhaps she'll die.", "It wriggled and jiggled and tickled inside her.", "How absurd to swallow a bird!", "Imagine that, to swallow a cat!", "What a hog, to swallow a dog!", "Just opened her throat and swallowed a goat!", "I don't know how she swallowed a cow!", "She's dead, of course!"];
SUFFIXES :: string.["", "", "", " that wriggled and jiggled and tickled inside her", "", "", "", "", "", ""];

recite :: (start_verse: int, end_verse: int) -> string {
    song: String_Builder;

    for verse_number: start_verse..end_verse {
        print_to_builder(*song, "I know an old lady who swallowed a %.\n", ANIMALS[verse_number]);
        print_to_builder(*song, "%\n", PHRASES[verse_number]);

        if verse_number == 8 continue;

        for < 2..verse_number {
            print_to_builder(*song, "She swallowed the % to catch the %%.", ANIMALS[it], ANIMALS[it - 1], SUFFIXES[it]);
            if it > 1 append(*song, "\n");
        }
        
        if verse_number > 1 print_to_builder(*song, "%\n", PHRASES[1]);
        if verse_number < end_verse append(*song, "\n");
    }

    return builder_to_string(*song);
}
