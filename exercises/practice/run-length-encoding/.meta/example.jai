encode :: (plaintext: string) -> string {
    encoded: String_Builder;
    last_char: u8;
    count: int;

    for plaintext {
        if it == last_char {
            count += 1;
            continue;
        }

        if count > 1 append(*encoded, tprint("%", count));
        if count > 0 append(*encoded, last_char);

        last_char = it;
        count = 1;
    }

    if count > 1 append(*encoded, tprint("%", count));
    if count > 0 append(*encoded, last_char);

    return builder_to_string(*encoded);
}

decode :: (ciphertext: string) -> string {
    decoded: String_Builder;
    count: int;

    for ciphertext {
        if is_digit(it) {
            if count > 0 count *= 10;
            count += it - #char "0";
        } else {
            for i: 0..max(0, count - 1) append(*decoded, it);
            count = 0;
        }
    }

    return builder_to_string(*decoded);
}
