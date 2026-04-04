to_snake_case :: (str: string) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    last_char := #char "_";

    for str {
        c := to_lower(it);

        if c >= #char "a" && c <= #char "z" || c >= #char "0" && c <= #char "9" {
            append(*builder, c);
            last_char = c;
        } else if c == #char " " {
            if last_char != #char "_"  append(*builder, "_");
            last_char = #char "_";
        } else {
            continue;
        }
    }

   return builder_to_string(*builder);
}

#import "String";
