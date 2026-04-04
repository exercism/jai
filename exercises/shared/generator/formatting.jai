to_snake_case :: (str: string) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    last_char := #char "_";

    for str {
        if it >= #char "a" && it <= #char "z" || it >= #char "0" && it <= #char "9" {
            append(*builder, it);
            last_char = it;
        } else if it >= #char "A" && it <= #char "Z" {
            if last_char != #char "_"  append(*builder, "_");
            append(*builder, to_lower(it));
            last_char = to_lower(it);
        } else if it == #char " " {
            if last_char != #char "_"  append(*builder, "_");
            last_char = #char "_";
        } else {
            continue;
        }
    }

   return builder_to_string(*builder);
}

escape_string :: (str: string) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    append(*builder, "\"");

    for char: str {
        if char == {
            case #char "\\"; append(*builder, "\\\\");
            case #char "\""; append(*builder, "\\\"");
            case #char "\n"; append(*builder, "\\n");
            case #char "\r"; append(*builder, "\\r");
            case #char "\t"; append(*builder, "\\t");
            case; append(*builder, char);
        }
    }

    append(*builder, "\"");
    return builder_to_string(*builder);
}

#import "String";
