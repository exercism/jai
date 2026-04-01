CanonicalCase :: struct {
    uuid: string;
    reimplements: string;
    description_path: []string;
    property: string;
    scenarios: []string;
    input: *JSON_Value;
    expected: *JSON_Value;
}

CanonicalData :: struct {
    exercise: string;
    cases: [..] CanonicalCase;
}

decode_canonical_data_json :: (json: string) -> bool, CanonicalData {
    parse_ok, result := json_parse_string(json);
    if !parse_ok return false, .{};

    decode_ok, canonical := decode_canonical_data(result);
    return decode_ok, canonical;
}

// TODO: remove the error handling
decode_canonical_data :: (root: JSON_Value) -> bool, CanonicalData {
    if root.type != .OBJECT return false, .{};

    out: CanonicalData;

    exercise, ok := object_get_string(root.object, "exercise");
    if !ok return false, out;
    out.exercise = exercise;

    cases_ptr, _ := object_get_array(root.object, "cases");
    // if !ok return false, out;

    for *case_val: cases_ptr {
        case_ok := decode_case_tree(case_val, .[], *out.cases);
        if !case_ok return false, .{};
    }

    return true, out;
}

decode_case_tree :: (value: JSON_Value, description_path: []string, out_cases: *[..] CanonicalCase) -> bool {
    if value.type != .OBJECT return false;

    description, has_description := object_get_string(value.object, "description");
    if !has_description return false;

    current_path: [..]string;
    array_copy(*current_path, description_path);
    array_add(*current_path, description);

    child_cases, has_child_cases := object_get(value.object, "cases");
    if has_child_cases {
        if child_cases.type != .ARRAY return false;

        for *child: child_cases.array {
            ok := decode_case_tree(child, current_path, out_cases);
            if !ok return false;
        }
        return true;
    }

    parsed_case, ok := decode_leaf_case(value, current_path);
    if !ok return false;
    array_add(out_cases, parsed_case);
    return true;
}

decode_leaf_case :: (value: JSON_Value, description_path: []string) -> CanonicalCase, bool {
    out: CanonicalCase;
    ok: bool;
    if value.type != .OBJECT return out, false;

    uuid: string;
    uuid, ok = object_get_string(value.object, "uuid");
    if !ok return out, false;
    out.uuid = uuid;

    out.description_path = description_path;

    property: string;
    property, ok = object_get_string(value.object, "property");
    if !ok return out, false;
    out.property = property;

    out.input = object_get_pointer(value.object, "input");
    if out.input == null return out, false;

    out.expected = object_get_pointer(value.object, "expected");
    if out.expected == null return out, false;

    reimplements: string;
    reimplements, ok = object_get_string(value.object, "reimplements");
    if ok out.reimplements = reimplements;

    scenario_values, has_scenarios := object_get_array(value.object, "scenarios");
    if has_scenarios {
        scenarios: [..] string;
        for scenario: scenario_values  array_add(*scenarios, scenario.str);
        out.scenarios = scenarios;
    }

    return out, true;
}

object_get :: (obj: *JSON_Object, key: string) -> JSON_Value, bool {
    ptr := table_find_pointer(obj, key);
    if ptr == null return .{}, false;
    return (.*)ptr, true;
}

object_get_pointer :: (obj: *JSON_Object, key: string) -> *JSON_Value {
    return table_find_pointer(obj, key);
}

object_get_string :: (obj: *JSON_Object, key: string) -> string, bool {
    value, ok := object_get(obj, key);
    if !ok || value.type != .STRING return "", false;
    return value.str, true;
}

object_get_array :: (obj: *JSON_Object, key: string) -> []JSON_Value, bool {
    value, ok := object_get(obj, key);
    if !ok || value.type != .ARRAY return .[], false;
    return value.array, true;
}

#import "Basic";
#import "Curl";
#import "Hash_Table";
#import,file "json.jai";
