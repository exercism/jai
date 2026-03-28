CanonicalCase :: struct {
    uuid: string;
    reimplements: string;
    full_description: string;
    property: string;
    input: *JSON_Value;
    expected: *JSON_Value;
}

CanonicalData :: struct {
    exercise: string;
    cases: [..] CanonicalCase;
}

// TODO: remove the error handling
decode_canonical_data :: (root: JSON_Value) -> bool, CanonicalData {
    if root.type != .OBJECT return false, .{};

    out: CanonicalData;

    exercise, ok := object_get_string(root.object, "exercise");
    if !ok return false, out;
    out.exercise = exercise;

    cases_ptr := object_get_pointer(root.object, "cases");
    if cases_ptr == null || ((.*)cases_ptr).type != .ARRAY return false, out;

    for *case_val: ((.*)cases_ptr).array {
        case_ok := decode_case_tree(case_val, "", *out.cases);
        if !case_ok return false, .{};
    }

    return true, out;
}

decode_case_tree :: (value: JSON_Value, parent_path: string, out_cases: *[..] CanonicalCase) -> bool {
    if value.type != .OBJECT return false;

    description, has_description := object_get_string(value.object, "description");
    if !has_description return false;

    current_path := path_join(parent_path, description);

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

decode_leaf_case :: (value: JSON_Value, full_description: string) -> CanonicalCase, bool {
    out: CanonicalCase;
    ok: bool;
    if value.type != .OBJECT return out, false;

    uuid: string;
    uuid, ok = object_get_string(value.object, "uuid");
    if !ok return out, false;
    out.uuid = uuid;

    out.full_description = full_description;

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

    return out, true;
}

path_join :: (parent: string, child: string) -> string {
    if !parent.count return child;
    return tprint("% > %", parent, child);
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

download_canonical_data :: (exercise: string) -> string {
    url := tprint("https://raw.githubusercontent.com/exercism/problem-specifications/refs/heads/main/exercises/%/canonical-data.json", exercise); 
    print("Downloading canonical data for exercise '%' via URL: %\n", exercise, url);
    body, code := request(url);

    if code != 200 {
        print("Downloading canonical data for exercise '%' failed with code %\n", exercise, code);
        exit(1);
    }

    return body;
}

request :: (url: string, data: string = "", method: string = "", headers: [] string = .[], include_headers: bool = false) -> response_body: string, response_code: int, curl_code: CURLcode {
    curl := curl_easy_init();
    assert(curl != null);
    defer curl_easy_cleanup(curl);

    curl_easy_setopt(curl, .URL, temp_c_string(url));

    if method                              curl_easy_setopt(curl, .CUSTOMREQUEST, temp_c_string(method));
    if data || (method && method != "GET") curl_easy_setopt(curl, .POSTFIELDS, temp_c_string(data));
    if include_headers                     curl_easy_setopt(curl, .HEADER, 1); // simply prepends headers to body
    if method == "HEAD"                    curl_easy_setopt(curl, .NOBODY, 1);

    if headers.count {
        slist: *curl_slist;
        for headers  slist = curl_slist_append(slist, temp_c_string(it));
        curl_easy_setopt(curl, .HTTPHEADER, slist);
    }

    builder: String_Builder;
    defer free_buffers(*builder);
    curl_easy_setopt(curl, .WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, .WRITEDATA,     *builder);

    // actually execute the request. this is blocking
    curl_code: CURLcode = curl_easy_perform(curl);

    response_code: int;
    if curl_code == .OK  curl_easy_getinfo(curl, .RESPONSE_CODE, *response_code);

    response_body: string = builder_to_string(*builder);

    return response_body, response_code, curl_code;
}

size_t :: u64;
write_callback :: (ptr: *u8, size: size_t, nmemb: size_t, userdata: *void) -> size_t #c_call {
    builder := cast(*String_Builder)userdata;

    push_context {
        append(builder, ptr, xx nmemb);
    }
    
    return nmemb;
}

#import "Basic";
#import "Curl";
#import "Hash_Table";
#import,file "json.jai";
