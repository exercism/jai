download_canonical_data :: (exercise: string) -> CanonicalData {
    json := get_canonical_data_json(exercise);
    decode_ok, canonical := decode_canonical_data_json(json);
    if !decode_ok {
        print("Failed to parse/decode canonical data for exercise '%'\n", exercise);
        exit(1);
    }

    return canonical;
}

#import "Basic";
#import,file "canonical_data.jai";
#import,file "problem_specifications.jai";
#import,file "tests_file.jai";
