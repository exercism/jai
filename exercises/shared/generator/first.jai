// TODO: make this into a module

main :: () {
    json_str := download_canonical_data("collatz-conjecture");
    // json_str := download_canonical_data("clock");

    parse_ok, result := json_parse_string(json_str);

    assert(parse_ok);

    decode_ok, canonical := decode_canonical_data(result);
    assert(decode_ok, "Failed to decode canonical-data shape");

    print("exercise: %\n", canonical.exercise);
    print("case count: %\n", canonical.cases.count);

    for canonical_case: canonical.cases {
        print("%\n", canonical_case);
    }
}

#run main();

#import "Basic";
#import "Hash_Table";
#import,file "json.jai";
#import,file "problem_specifications.jai";
