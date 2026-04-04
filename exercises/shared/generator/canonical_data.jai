// This module can fetch and parse canonical data for exercises. 
// The problem-specifications repo is cloned (and updated) in a local directory.

CanonicalCase :: struct {
    index: int;
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

PROBLEM_SPECIFICATIONS_REPO_DIRECTORY :: #run () -> string {
    repo_directory := get_absolute_path(path_join(#filepath, "..", "..", ".."));
    return path_join(repo_directory, ".problem-specifications");
}();

fetch_problem_specifications_repo :: () {
    if file_exists(PROBLEM_SPECIFICATIONS_REPO_DIRECTORY) {
        run_command("git", "pull", "--quiet", working_directory = PROBLEM_SPECIFICATIONS_REPO_DIRECTORY);
    } else {
        run_command("git", "clone", "--quiet", "https://github.com/exercism/problem-specifications.git", PROBLEM_SPECIFICATIONS_REPO_DIRECTORY);
    }
}

// We only need to fetch the problem specifications once, so we can run this at compile-time
#run fetch_problem_specifications_repo();

download_canonical_data :: (exercise: string) -> CanonicalData {
    canonical_data_path := path_join(PROBLEM_SPECIFICATIONS_REPO_DIRECTORY, "exercises", exercise, "canonical-data.json");
    canonical_data_json := read_entire_file(canonical_data_path);
    canonical_data := parse_canonical_data(canonical_data_json);

    reimplemented_cases: [..]string;
    for canonical_data.cases {
        if it.reimplements.count > 0 {
            array_add(*reimplemented_cases, it.reimplements);
        }
    }

    excluded_cases := parse_excluded_test_cases();

    filtered_canonical_cases: [..] CanonicalCase;
    for canonical_data.cases {
        has_been_reimplemented, _ := array_find(reimplemented_cases, it.uuid);
        if has_been_reimplemented  continue;

        has_been_excluded, _ := array_find(excluded_cases, it.uuid);
        if has_been_excluded  continue;

        array_add(*filtered_canonical_cases, it);
    }

    canonical_data.cases = filtered_canonical_cases;
    return canonical_data;
}

parse_canonical_data :: (json: string) -> CanonicalData {
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
    if has_cases {
        for cases {
            add_test_cases(it, current_path, out_cases);
        }
    } else {
        canonical_case := parse_test_case(value, current_path);
        canonical_case.index = out_cases.count;
        array_add(out_cases, canonical_case);
    }
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

parse_excluded_test_cases :: () -> []string {
    tests_toml := read_entire_file("tests.toml");
    lines := split(tests_toml, "\n");

    current_case: string;
    excluded_cases: [..] string;

    for lines {
        line := trim(it);

        if begins_with(line, "[") && ends_with(line, "]") {
            current_case = slice(line, 1, line.count - 2);
        } else if begins_with(line, "include") && ends_with(line, "false") {
            array_add(*excluded_cases, current_case);
        } else if line.count == 0 {
            current_case = "";
        } 
    }

    return excluded_cases;
}

#import "File_utilities";
#import "Process";
