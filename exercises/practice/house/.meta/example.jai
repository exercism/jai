SUBJECTS :: string.[
    "",
    "house that Jack built.",
    "malt that lay in",
    "rat that ate",
    "cat that killed",
    "dog that worried",
    "cow with the crumpled horn that tossed",
    "maiden all forlorn that milked",
    "man all tattered and torn that kissed",
    "priest all shaven and shorn that married",
    "rooster that crowed in the morn that woke",
    "farmer sowing his corn that kept",
    "horse and the hound and the horn that belonged to"
];

recite :: (start_verse: int, end_verse: int) -> string {
    song: String_Builder;

    for verse: start_verse..end_verse {
        append(*song, "This is");
        for < 1..verse print_to_builder(*song, " the %", SUBJECTS[it]);
        append(*song, "\n");
    }
    
    return builder_to_string(*song);
}
