// This file contains a basic JSON parser and data structure for representing JSON values. 
// It is used by the canonical data generator to parse the JSON files containing the test cases.
// As canonical data JSON files are guaranteed to be well-formed, the parser is not a fully compliant
// JSON parser and therefore does not handle all edge cases or provide detailed error messages.

WHITESPACE_CHARS :: " \t\n\r";

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

get_boolean_property :: (value: *JSON_Value, property: string) -> bool {
    json_value := get_property(value, property);
    assert(json_value.type == .BOOLEAN);
    return json_value.boolean;
}

get_number_property :: (value: *JSON_Value, property: string) -> float64 {
    json_value := get_property(value, property);
    assert(json_value.type == .NUMBER);
    return json_value.number;
}

get_string_property :: (value: *JSON_Value, property: string) -> string {
    json_value := get_property(value, property);
    assert(json_value.type == .STRING);
    return json_value.str;
}

get_array_property :: (value: *JSON_Value, property: string) -> []JSON_Value {
    json_value := get_property(value, property);
    assert(json_value.type == .ARRAY);
    return json_value.array;
}

get_property :: (value: *JSON_Value, property: string) -> JSON_Value {
    assert(value != null && value.type == .OBJECT);
    result, property := table_find(value.object, property);
    assert(result);
    return property;
}

parse_json :: (content: string) -> JSON_Value {
    value, _ := parse_value(content);
    return value;
}

parse_value :: (content: string) -> JSON_Value, string {
    result: JSON_Value;
    remainder := trim_left(content, WHITESPACE_CHARS);
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
            obj := cast(*JSON_Object) alloc(size_of(JSON_Object));
            memset(obj, 0, size_of(JSON_Object));
            value_obj, rest := parse_object(remainder);
            (.*)obj = value_obj;
            result.type = .OBJECT;
            result.object = obj;
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

    remainder := advance(str);
    remainder = trim_left(remainder, WHITESPACE_CHARS);

    if remainder.count && remainder[0] == #char "]" {
        remainder = advance(remainder);
        return result, remainder;
    }

    while true {
        value: JSON_Value;
        value, remainder = parse_value(remainder);

        array_add(*result, value);

        remainder = trim_left(remainder, WHITESPACE_CHARS);
        if !remainder.count return result, remainder;

        if remainder[0] == #char "," {
            remainder = advance(remainder);
            remainder = trim_left(remainder, WHITESPACE_CHARS);
            if !remainder.count return result, remainder;
            continue;
        }

        if remainder[0] == #char "]" {
            remainder = advance(remainder);
            return result, remainder;
        }

        return result, remainder;
    }
}

parse_object :: (str: string) -> JSON_Object, string {
    result: JSON_Object;
    remainder := advance(str);
    remainder = trim_left(remainder, WHITESPACE_CHARS);

    if remainder.count && remainder[0] == #char "}" {
        remainder = advance(remainder);
        return result, remainder;
    }

    init(*result, 32);

    while true {
        if !remainder.count || remainder[0] != #char "\"" return result, remainder;

        key: string;
        key, remainder = parse_string(remainder);

        existing := table_find_pointer(*result, key);
        if existing {
            free(key);
            return result, remainder;
        }

        remainder = trim_left(remainder, WHITESPACE_CHARS);
        if !remainder.count || remainder[0] != #char ":" {
            free(key);
            return result, remainder;
        }

        remainder = advance(remainder);
        remainder = trim_left(remainder, WHITESPACE_CHARS);

        value: JSON_Value;
        value, remainder = parse_value(remainder);

        table_add(*result, key, value);

        remainder = trim_left(remainder, WHITESPACE_CHARS);
        if !remainder.count return result, remainder;

        if remainder[0] == #char "," {
            remainder = advance(remainder);
            remainder = trim_left(remainder, WHITESPACE_CHARS);
            if !remainder.count return result, remainder;
            continue;
        }

        if remainder[0] == #char "}" {
            remainder = advance(remainder);
            return result, remainder;
        }

        return result, remainder;
    }
}

parse_string :: (str: string) -> string, string {
    result: string;
    remainder: string;

    inside := advance(str);
    needs_unescape := false;

    while true {
        if !inside.count return "", str;

        if inside[0] == #char "\"" break;

        if inside[0] == #char "\\" {
            needs_unescape = true;
            if inside.count < 2 return "", str;
            advance(*inside);
        }

        if inside[0] < 0x20 return "", str;
        advance(*inside);
    }

    length := inside.data - str.data - 1;
    result = slice(str, 1, length);

    if needs_unescape {
        out: string;
        ok: bool;
        out, ok = unescape(result);
        if !ok return "", str;
        result = out;
    } else {
        result = copy_string(result);
    }

    remainder = slice(str, length + 2, str.count - length - 2);
    return result, remainder;
}

unescape :: (str: string) -> string, bool {
    result: string;
    result = alloc_string(str.count);
    rc := 0;

    for i: 0..str.count - 1 {
        if str[i] != #char "\\" {
            if str[i] < 0x20 return "", false;

            result[rc] = str[i];
            rc += 1;
            continue;
        }

        if i == str.count - 1 return "", false;
        i += 1;

        if str[i] == {
            case #char "\""; #through;
            case #char "/"; #through;
            case #char "\\";
                result[rc] = str[i];
                rc += 1;

            case #char "b";
                result[rc] = 0x08;
                rc += 1;

            case #char "f";
                result[rc] = 0x0c;
                rc += 1;

            case #char "n";
                result[rc] = #char "\n";
                rc += 1;

            case #char "r";
                result[rc] = #char "\r";
                rc += 1;

            case #char "t";
                result[rc] = #char "\t";
                rc += 1;

            case #char "u";
                if i + 4 >= str.count return "", false;

                codepoint, ok := parse_unicode(slice(str, i + 1, 4));
                if !ok return "", false;

                utf8_len := encode_utf8(codepoint, *(result.data[rc]));
                rc += utf8_len;
                i += 4;

            case;
                return "", false;
        }
    }

    result.count = rc;
    return result, true;
}

parse_unicode :: (str: string) -> u16, bool {
    val, ok, remainder := string_to_int(str, base = 16);
    if !ok || val > 0xFFFF || remainder.count return 0, false;
    return xx val, true;
}

encode_utf8 :: (val: u16, result: *u8) -> len: u8 {
    if val & 0xF800 {
        result[0] = xx (0xE0 | ((val & 0xF000) >> 12));
        result[1] = xx (0x80 | ((val & 0x0FC0) >> 6));
        result[2] = xx (0x80 | (val & 0x003F));
        return 3;
    } else if val & 0x0F80 {
        result[0] = xx (0xC0 | ((val & 0x0FC0) >> 6));
        result[1] = xx (0x80 | (val & 0x003F));
        return 2;
    } else {
        result[0] = xx (val & 0x7F);
        return 1;
    }
}

#import "Basic";
#import "File";
#import "Hash_Table";
#import "String";
