run_tests :: () {
    runlength_encode_a_string_empty_string();
    skip(runlength_encode_a_string_single_characters_only_are_encoded_without_count());
    skip(runlength_encode_a_string_string_with_no_single_characters());
    skip(runlength_encode_a_string_single_characters_mixed_with_repeated_characters());
    skip(runlength_encode_a_string_multiple_whitespace_mixed_in_string());
    skip(runlength_encode_a_string_lowercase_characters());
    skip(runlength_decode_a_string_empty_string());
    skip(runlength_decode_a_string_single_characters_only());
    skip(runlength_decode_a_string_string_with_no_single_characters());
    skip(runlength_decode_a_string_single_characters_with_repeated_characters());
    skip(runlength_decode_a_string_multiple_whitespace_mixed_in_string());
    skip(runlength_decode_a_string_lowercase_string());
    skip(encode_and_then_decode_encode_followed_by_decode_gives_original_string());
}

runlength_encode_a_string_empty_string :: () {
    assert_equal("", encode(""));
}

runlength_encode_a_string_single_characters_only_are_encoded_without_count :: () {
    assert_equal("XYZ", encode("XYZ"));
}

runlength_encode_a_string_string_with_no_single_characters :: () {
    assert_equal("2A3B4C", encode("AABBBCCCC"));
}

runlength_encode_a_string_single_characters_mixed_with_repeated_characters :: () {
    assert_equal("12WB12W3B24WB", encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"));
}

runlength_encode_a_string_multiple_whitespace_mixed_in_string :: () {
    assert_equal("2 hs2q q2w2 ", encode("  hsqq qww  "));
}

runlength_encode_a_string_lowercase_characters :: () {
    assert_equal("2a3b4c", encode("aabbbcccc"));
}

runlength_decode_a_string_empty_string :: () {
    assert_equal("", decode(""));
}

runlength_decode_a_string_single_characters_only :: () {
    assert_equal("XYZ", decode("XYZ"));
}

runlength_decode_a_string_string_with_no_single_characters :: () {
    assert_equal("AABBBCCCC", decode("2A3B4C"));
}

runlength_decode_a_string_single_characters_with_repeated_characters :: () {
    assert_equal("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB", decode("12WB12W3B24WB"));
}

runlength_decode_a_string_multiple_whitespace_mixed_in_string :: () {
    assert_equal("  hsqq qww  ", decode("2 hs2q q2w2 "));
}

runlength_decode_a_string_lowercase_string :: () {
    assert_equal("aabbbcccc", decode("2a3b4c"));
}

encode_and_then_decode_encode_followed_by_decode_gives_original_string :: () {
    assert_equal("zzz ZZ  zZ", decode(encode("zzz ZZ  zZ")));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
