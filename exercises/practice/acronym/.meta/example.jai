abbreviate :: (phrase: string) -> string {
    abbreviation: String_Builder;

    for phrase {
        if !is_alpha(it) continue;

        if it_index == 0 || !is_alpha(phrase[it_index - 1]) && phrase[it_index - 1] != #char "'" {
            append(*abbreviation, to_upper(it));
        }
    }

    return builder_to_string(*abbreviation);
}

#import "String";
