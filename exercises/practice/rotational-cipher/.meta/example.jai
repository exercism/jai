rotate :: (text: string, shift_key: int) -> string {
    builder: String_Builder;
    init_string_builder(*builder, buffer_size = text.count);

    for text {
        if it >= #char "a" && it <= #char "z" {
            append(*builder, cast(u8)((it - #char "a" + shift_key) % 26 + #char "a"));
        } else if it >= #char "A" && it <= #char "Z" {
            append(*builder, cast(u8)((it - #char "A" + shift_key) % 26 + #char "A"));
        } else {
            append(*builder, it);
        }
    }

    return builder_to_string(*builder);
}

#import "Basic";
