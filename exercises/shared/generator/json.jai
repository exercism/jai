// This file contains a basic JSON parser and data structure for representing JSON values. 
// It is used by the canonical data generator to parse the JSON files containing the test cases.
// As canonical data JSON files are guaranteed to be well-formed, the parser is not a fully compliant
// JSON parser and therefore does not handle all edge cases or provide detailed error messages.

JSON_Type :: enum u8 {
    NULL    :: 0;
    BOOLEAN :: 1;
    NUMBER  :: 2;
    STRING  :: 3;
    ARRAY   :: 4;
    OBJECT  :: 5;
}

JSON_Value :: struct {
    type: JSON_Type;
    union {
        boolean: bool;
        number:  float64;
        str:     string;
        array:   []JSON_Value;
        object:  *JSON_Object;
    };
}

JSON_Object :: Table(string, JSON_Value);

get_boolean_property :: (value: *JSON_Value, property_path: ..string) -> bool, bool {
    ok, json_value := get_property(value, ..property_path);
    if !ok return false, false;
    return true, json_value.boolean;
}

get_number_property :: (value: *JSON_Value, property_path: ..string) -> bool, float64 {
    ok, json_value := get_property(value, ..property_path);
    if !ok return false, 0.0;
    return true, json_value.number;
}

get_string_property :: (value: *JSON_Value, property_path: ..string) -> bool, string {
    ok, json_value := get_property(value, ..property_path);
    if !ok return false, "";
    return true, json_value.str;
}

get_array_property :: (value: *JSON_Value, property_path: ..string) -> bool, []JSON_Value {
    ok, json_value := get_property(value, ..property_path);
    if !ok return false, .[];
    return true, json_value.array;
}

get_property :: (value: *JSON_Value, property_path: ..string) -> bool, JSON_Value {
    ok, pointer := get_property_pointer(value, ..property_path);
    if !ok return false, JSON_Value.{};
    return true, pointer.*;
}

get_property_pointer :: (value: *JSON_Value, property_path: ..string) -> bool, *JSON_Value {
    current := value;

    for property: property_path {
        assert(current.type == .OBJECT);
        current = table_find_pointer(current.object, property);
        if current == null return false, null;
    }

    if current == null return false, null;
    return true, current;
}

parse_json :: (content: string) -> JSON_Value {
    value, _ := parse_value(content);
    return value;
}

parse_value :: (content: string) -> JSON_Value, string {
    result: JSON_Value;
    remainder := trim_left(content);
    assert(remainder.count > 0);

    if remainder[0] == {
        case #char "n"; // null
            rest := advance(remainder, 4);
            result.type = .NULL;
            return result, rest;

        case #char "t"; // true
            rest := advance(remainder, 4);
            result.type = .BOOLEAN;
            result.boolean = true;
            return result, rest;

        case #char "f"; // false
            rest := advance(remainder, 5);
            result.type = .BOOLEAN;
            result.boolean = false;
            return result, rest;

        case #char "\"";
            str, rest := parse_string(remainder);
            result.type = .STRING;
            result.str = str;
            return result, rest;

        case #char "[";
            array, rest := parse_array(remainder);
            result.type = .ARRAY;
            result.array = array;
            return result, rest;

        case #char "{";
            object, rest := parse_object(remainder);
            result.type = .OBJECT;
            result.object = cast(*JSON_Object) alloc(size_of(JSON_Object));
            (.*)result.object = object;
            return result, rest;

        case;
            number, _, rest := string_to_float64(remainder);
            result.type = .NUMBER;
            result.number = number;
            return result, rest;
    }
}

parse_array :: (str: string) -> [] JSON_Value, string {
    result: [..] JSON_Value;
    remainder := trim_left(advance(str));

    while remainder {
        if remainder[0] == #char "]" {
            remainder = advance(remainder);
            break;
        }

        value: JSON_Value;
        value, remainder = parse_value(remainder);
        array_add(*result, value);
        
        remainder = trim_left(remainder);
        if remainder[0] == #char "," {
            remainder = advance(remainder);
        }
    }

    return result, remainder;
}

parse_object :: (str: string) -> JSON_Object, string {
    result: JSON_Object;
    remainder := trim_left(advance(str));

    while remainder {
        remainder = trim_left(remainder);
        if remainder[0] == #char "}" {
            remainder = advance(remainder);
            break;
        }

        key: string;
        key, remainder = parse_string(remainder);

        remainder = trim_left(remainder);
        remainder = advance(remainder); // :
        remainder = trim_left(remainder);

        value: JSON_Value;
        value, remainder = parse_value(remainder);

        table_add(*result, key, value);

        remainder = trim_left(remainder);
        if remainder[0] == {
            case #char "}";
                remainder = trim_left(advance(remainder));
                break;
            case #char ",";
                remainder = trim_left(advance(remainder));
        }
    }

    return result, remainder;
}

parse_string :: (str: string) -> string, string {
    result: String_Builder;
    init_string_builder(*result);

    remainder := advance(str);

    while remainder {
        if remainder[0] == {
            case #char "\"";
                remainder = advance(remainder);
                break;
            case #char "\\";
                remainder = advance(remainder);
                if remainder[0] == {
                    case #char "r";  append(*result, #char "\r");
                    case #char "n";  append(*result, #char "\n");
                    case #char "t";  append(*result, #char "\t");
                    case #char "\\"; append(*result, #char "\\");
                    case #char "\""; append(*result, #char "\"");
                    case; assert(false, "Unsupported escape sequence: \\%", remainder[0]);
                }
                remainder = advance(remainder);
            case;
                append(*result, remainder[0]);
                remainder = advance(remainder);
        }
    }

    return builder_to_string(*result), remainder;
}

#import "Basic";
#import "Hash_Table";
