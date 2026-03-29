PROBLEM_SPECIFICATIONS_REPO_DIRECTORY :: #run () -> string {
    repo_directory := get_absolute_path(path_join(#filepath, "..", "..", ".."));
    return path_join(repo_directory, ".problem-specifications");
}();

fetch_problem_specifications_repo :: () {
    if file_exists(PROBLEM_SPECIFICATIONS_REPO_DIRECTORY) {
        run_command("git", "pull", working_directory = PROBLEM_SPECIFICATIONS_REPO_DIRECTORY);
    } else {
        run_command("git", "clone", "https://github.com/exercism/problem-specifications.git", PROBLEM_SPECIFICATIONS_REPO_DIRECTORY);
    }
}

// We only need to fetch the problem specifications once, so we can run this at compile-time
#run fetch_problem_specifications_repo();

get_canonical_data_json :: (exercise: string) -> string {
    canonical_data_path := path_join(PROBLEM_SPECIFICATIONS_REPO_DIRECTORY, "exercises", exercise, "canonical-data.json");
    return read_entire_file(canonical_data_path);
}

#import "File";
#import "File_utilities";
#import "Process";
#import "String";
