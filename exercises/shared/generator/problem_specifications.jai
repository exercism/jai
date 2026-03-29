download_canonical_data_json :: (exercise: string) -> string {
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
