run_tests :: () {
    empty_strands();
    skip(single_letter_identical_strands());
    skip(single_letter_different_strands());
    skip(long_identical_strands());
    skip(long_different_strands());
    skip(disallow_first_strand_longer());
    skip(disallow_second_strand_longer());
    skip(disallow_empty_first_strand());
    skip(disallow_empty_second_strand());
}

empty_strands :: () {
    ok, distance := hamming_distance("", "");
    assert_equal(true, ok);
    assert_equal(0, distance);
}

single_letter_identical_strands :: () {
    ok, distance := hamming_distance("A", "A");
    assert_equal(true, ok);
    assert_equal(0, distance);
}

single_letter_different_strands :: () {
    ok, distance := hamming_distance("G", "T");
    assert_equal(true, ok);
    assert_equal(1, distance);
}

long_identical_strands :: () {
    ok, distance := hamming_distance("GGACTGAAATCTG", "GGACTGAAATCTG");
    assert_equal(true, ok);
    assert_equal(0, distance);
}

long_different_strands :: () {
    ok, distance := hamming_distance("GGACGGATTCTG", "AGGACGGATTCT");
    assert_equal(true, ok);
    assert_equal(9, distance);
}

disallow_first_strand_longer :: () {
    ok, _ := hamming_distance("AATG", "AAA");
    assert_equal(false, ok);
}

disallow_second_strand_longer :: () {
    ok, _ := hamming_distance("ATA", "AGTG");
    assert_equal(false, ok);
}

disallow_empty_first_strand :: () {
    ok, _ := hamming_distance("", "G");
    assert_equal(false, ok);
}

disallow_empty_second_strand :: () {
    ok, _ := hamming_distance("G", "");
    assert_equal(false, ok);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
