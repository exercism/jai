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

get_boolean_property :: (value: *JSON_Value, property: string) -> bool, bool {
    ok, json_value := get_property(value, property);
    if !ok return false, false;
    assert(json_value.type == .BOOLEAN);
    return true, json_value.boolean;
}

get_number_property :: (value: *JSON_Value, property: string) -> bool, float64 {
    ok, json_value := get_property(value, property);
    if !ok return false, 0.0;
    assert(json_value.type == .NUMBER);
    return true, json_value.number;
}

get_string_property :: (value: *JSON_Value, property: string) -> bool, string {
    ok, json_value := get_property(value, property);
    if !ok return false, "";
    assert(json_value.type == .STRING);
    return true, json_value.str;
}

get_array_property :: (value: *JSON_Value, property: string) -> bool, []JSON_Value {
    ok, json_value := get_property(value, property);
    if !ok return false, .[];
    assert(json_value.type == .ARRAY);
    return true, json_value.array;
}

get_property :: (value: *JSON_Value, property: string) -> bool, JSON_Value {
    assert(value.type == .OBJECT);
    ok, property_value := table_find(value.object, property);
    return ok, property_value;
}

get_property_pointer :: (value: *JSON_Value, property: string) -> bool, *JSON_Value {
    assert(value.type == .OBJECT);
    property_value_pointer := table_find_pointer(value.object, property);
    if property_value_pointer == null return false, property_value_pointer;
    return true, property_value_pointer;
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
        value: JSON_Value;
        value, remainder = parse_value(remainder);
        array_add(*result, value);
        
        remainder = trim_left(remainder);
        if remainder[0] == {
            case #char "]";
                remainder = advance(remainder);
                break;
            case #char ",";
                remainder = advance(remainder);
        }
    }

    return result, remainder;
}

parse_object :: (str: string) -> JSON_Object, string {
    result: JSON_Object;
    init(*result);

    remainder := trim_left(advance(str));

    while remainder {
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
#import "File";
#import "Hash_Table";
#import "String";
