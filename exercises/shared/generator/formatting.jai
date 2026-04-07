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

output :: (value: JSON_Value) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    if value.type  == {
        case .NULL;
            append(*builder, "null");
        case .BOOLEAN;
            append(*builder, ifx value.boolean then "true" else "false");
        case .NUMBER;
            print_to_builder(*builder, "%", value.number);
        case .STRING;
            append(*builder, escape_string(value.str));
        case .ARRAY;
            append(*builder, ".[");
            for value.array {
                if it_index > 0  append(*builder, ", ");
                append(*builder, output(it));
            }
            append(*builder, "]");
        case .OBJECT;
            append(*builder, "{");
            first := true;
            for val, key: value.object {
                if !first  append(*builder, ", ");
                first = false;
                append(*builder, escape_string(key));
                append(*builder, ": ");
                append(*builder, output(val));
            }
            append(*builder, "}");
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
