encode :: (phrase: string) -> string {
    encoded: String_Builder;
    length := 0;

    for phrase {
        if is_alpha(it) {
            if length > 0 && length % 5 == 0 append(*encoded, #char " ");
            append(*encoded, #char "a" + (#char "z" - to_lower(it)));
            length += 1;
        } else if is_digit(it) {
            if length > 0 && length % 5 == 0 append(*encoded, #char " ");
            append(*encoded, it);
            length += 1;
        }
    }

    return builder_to_string(*encoded);
}

decode :: (phrase: string) -> string {
    decoded: String_Builder;
    
    for phrase {
        if is_alpha(it) {
            append(*decoded, #char "a" + (#char "z" - to_lower(it)));
        } else if is_digit(it) {
            append(*decoded, it);
        }
    }

    return builder_to_string(*decoded);
}
