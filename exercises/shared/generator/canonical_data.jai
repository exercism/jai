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

decode_canonical_data_json :: (json: string) -> CanonicalData {
    root := parse_json(json);
    assert(root.type == .OBJECT);

    out: CanonicalData;

    _, exercise := get_string_property(*root, "exercise");
    out.exercise = exercise;

    _, cases := get_array_property(*root, "cases");
    for cases  add_test_cases(it, .[], *out.cases);

    return out;
}

add_test_cases :: (value: JSON_Value, description_path: []string, out_cases: *[..] CanonicalCase) {
    assert(value.type == .OBJECT);

    _, description := get_string_property(*value, "description");
    current_path: [..]string;
    array_copy(*current_path, description_path);
    array_add(*current_path, description);

    has_cases, cases := get_array_property(*value, "cases");
    if has_cases  for cases  add_test_cases(it, current_path, out_cases);

    canonical_case := parse_test_case(value, current_path);
    array_add(out_cases, canonical_case);
}

parse_test_case :: (value: JSON_Value, description_path: []string) -> CanonicalCase {
    assert(value.type == .OBJECT);

    out: CanonicalCase;
    out.description_path = description_path;

    _, uuid := get_string_property(*value, "uuid"); 
    out.uuid = uuid;

    _, property := get_string_property(*value, "property"); 
    out.property = property;

    _, input := get_property_pointer(*value, "input");
    out.input = input;

    _, expected := get_property_pointer(*value, "expected");
    out.expected = expected;

    has_reimplements, reimplements := get_string_property(*value, "reimplements");
    if has_reimplements  out.reimplements = reimplements;

    has_scenarios, scenario_values := get_array_property(*value, "scenarios");
    if has_scenarios {
        scenarios: [..] string;
        for scenario: scenario_values  array_add(*scenarios, scenario.str);
        out.scenarios = scenarios;
    }

    return out;
}

#import "Basic";
#import,file "json.jai";
