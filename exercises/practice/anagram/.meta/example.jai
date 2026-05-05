find_anagrams :: (subject: string, candidates: []string) -> []string {
    anagrams: [..]string;

    for candidates {
        if is_anagram(subject, it) array_add(*anagrams, it);
    }

    return anagrams;
}

is_anagram :: (subject: string, target: string) -> bool {
    lower_subject := to_lower_copy(subject);
    lower_target  := to_lower_copy(target);

    if lower_subject == lower_target return false;

    sorted_subject := quick_sort(cast([]u8)lower_subject, c => c);
    sorted_target  := quick_sort(cast([]u8)lower_target,  c => c);

    if sorted_subject.count != sorted_target.count return false;

    for 0..sorted_subject.count - 1 {
        if sorted_subject[it] != sorted_target[it] return false;
    }

    return true;
}

#import "Sort";
#import "String";
