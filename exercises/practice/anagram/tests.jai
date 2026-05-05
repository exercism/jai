run_tests :: () {
    no_matches();
    skip(detects_two_anagrams());
    skip(does_not_detect_anagram_subsets());
    skip(detects_anagram());
    skip(detects_three_anagrams());
    skip(detects_multiple_anagrams_with_different_case());
    skip(does_not_detect_nonanagrams_with_identical_checksum());
    skip(detects_anagrams_caseinsensitively());
    skip(detects_anagrams_using_caseinsensitive_subject());
    skip(detects_anagrams_using_caseinsensitive_possible_matches());
    skip(does_not_detect_an_anagram_if_the_original_word_is_repeated());
    skip(anagrams_must_use_all_letters_exactly_once());
    skip(words_are_not_anagrams_of_themselves());
    skip(words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different());
    skip(words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different());
    skip(words_other_than_themselves_can_be_anagrams());
}

no_matches :: () {
    anagrams := find_anagrams("diaper", .["hello", "world", "zombies", "pants"]);
    assert_equal(0, anagrams.count);
}

detects_two_anagrams :: () {
    anagrams := find_anagrams("solemn", .["lemons", "cherry", "melons"]);
    assert_equal(2, anagrams.count);
    assert_equal("lemons", anagrams[0]);
    assert_equal("melons", anagrams[1]);
}

does_not_detect_anagram_subsets :: () {
    anagrams := find_anagrams("good", .["dog", "goody"]);
    assert_equal(0, anagrams.count);
}

detects_anagram :: () {
    anagrams := find_anagrams("listen", .["enlists", "google", "inlets", "banana"]);
    assert_equal(1, anagrams.count);
    assert_equal("inlets", anagrams[0]);
}

detects_three_anagrams :: () {
    anagrams := find_anagrams("allergy", .["gallery", "ballerina", "regally", "clergy", "largely", "leading"]);
    assert_equal(3, anagrams.count);
    assert_equal("gallery", anagrams[0]);
    assert_equal("regally", anagrams[1]);
    assert_equal("largely", anagrams[2]);
}

detects_multiple_anagrams_with_different_case :: () {
    anagrams := find_anagrams("nose", .["Eons", "ONES"]);
    assert_equal(2, anagrams.count);
    assert_equal("Eons", anagrams[0]);
    assert_equal("ONES", anagrams[1]);
}

does_not_detect_nonanagrams_with_identical_checksum :: () {
    anagrams := find_anagrams("mass", .["last"]);
    assert_equal(0, anagrams.count);
}

detects_anagrams_caseinsensitively :: () {
    anagrams := find_anagrams("Orchestra", .["cashregister", "Carthorse", "radishes"]);
    assert_equal(1, anagrams.count);
    assert_equal("Carthorse", anagrams[0]);
}

detects_anagrams_using_caseinsensitive_subject :: () {
    anagrams := find_anagrams("Orchestra", .["cashregister", "carthorse", "radishes"]);
    assert_equal(1, anagrams.count);
    assert_equal("carthorse", anagrams[0]);
}

detects_anagrams_using_caseinsensitive_possible_matches :: () {
    anagrams := find_anagrams("orchestra", .["cashregister", "Carthorse", "radishes"]);
    assert_equal(1, anagrams.count);
    assert_equal("Carthorse", anagrams[0]);
}

does_not_detect_an_anagram_if_the_original_word_is_repeated :: () {
    anagrams := find_anagrams("go", .["goGoGO"]);
    assert_equal(0, anagrams.count);
}

anagrams_must_use_all_letters_exactly_once :: () {
    anagrams := find_anagrams("tapper", .["patter"]);
    assert_equal(0, anagrams.count);
}

words_are_not_anagrams_of_themselves :: () {
    anagrams := find_anagrams("BANANA", .["BANANA"]);
    assert_equal(0, anagrams.count);
}

words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different :: () {
    anagrams := find_anagrams("BANANA", .["Banana"]);
    assert_equal(0, anagrams.count);
}

words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different :: () {
    anagrams := find_anagrams("BANANA", .["banana"]);
    assert_equal(0, anagrams.count);
}

words_other_than_themselves_can_be_anagrams :: () {
    anagrams := find_anagrams("LISTEN", .["LISTEN", "Silent"]);
    assert_equal(1, anagrams.count);
    assert_equal("Silent", anagrams[0]);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
