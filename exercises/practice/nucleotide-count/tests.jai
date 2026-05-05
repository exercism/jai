run_tests :: () {
    empty_strand();
    skip(can_count_one_nucleotide_in_singlecharacter_input());
    skip(strand_with_repeated_nucleotide());
    skip(strand_with_multiple_nucleotides());
    skip(strand_with_invalid_nucleotides());
}

empty_strand :: () {
    ok, counts := nucleotide_counts("");
    assert_equal(true, ok);
    assert_equal(0, counts.A);
    assert_equal(0, counts.C);
    assert_equal(0, counts.G);
    assert_equal(0, counts.T);
}

can_count_one_nucleotide_in_singlecharacter_input :: () {
    ok, counts := nucleotide_counts("G");
    assert_equal(true, ok);
    assert_equal(0, counts.A);
    assert_equal(0, counts.C);
    assert_equal(1, counts.G);
    assert_equal(0, counts.T);
}

strand_with_repeated_nucleotide :: () {
    ok, counts := nucleotide_counts("GGGGGGG");
    assert_equal(true, ok);
    assert_equal(0, counts.A);
    assert_equal(0, counts.C);
    assert_equal(7, counts.G);
    assert_equal(0, counts.T);
}

strand_with_multiple_nucleotides :: () {
    ok, counts := nucleotide_counts("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC");
    assert_equal(true, ok);
    assert_equal(20, counts.A);
    assert_equal(12, counts.C);
    assert_equal(17, counts.G);
    assert_equal(21, counts.T);
}

strand_with_invalid_nucleotides :: () {
    ok, _ := nucleotide_counts("AGXXACT");
    assert_equal(false, ok);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
