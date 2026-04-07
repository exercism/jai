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

to_enum :: (str: string) -> string {
    to_upper_in_place(str);
    return tprint(".%", str);
}

to_enum :: (str: JSON_Value) -> string {
    return to_enum(str.str);
}

to_code :: (value: string) -> string {
    return escape_string(value);
}

to_code :: (value: int) -> string {
    return tprint("%", value);
}

to_code :: (value: float64) -> string {
    return tprint("%", value);
}

to_code :: (value: bool) -> string {
    return ifx value then "true" else "false";
}

to_code :: (values: []$T, convert_elements := true) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    append(*builder, ".[");
    for values {
        if it_index > 0  append(*builder, ", ");
        if convert_elements {
            append(*builder, to_code(it));
        } else {
            print_to_builder(*builder, "%", it);
        }
    }
    append(*builder, "]");
    return builder_to_string(*builder);
}

to_code :: (value: JSON_Value) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    if value.type  == {
        case .NULL;
            append(*builder, "null");
        case .BOOLEAN;
            append(*builder, to_code(value.boolean));
        case .NUMBER;
            append(*builder, to_code(value.number));
        case .STRING;
            append(*builder, to_code(value.str));
        case .ARRAY;
            append(*builder, ".[");
            for value.array {
                if it_index > 0  append(*builder, ", ");
                append(*builder, to_code(it));
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
                append(*builder, to_code(val));
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
