download_canonical_data :: (exercise: string) -> CanonicalData {
    json := get_canonical_data_json(exercise);
    return decode_canonical_data_json(json);
}

#import "Basic";
#import,file "canonical_data.jai";
#import,file "problem_specifications.jai";
#import,file "tests_file.jai";
