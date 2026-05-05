run_tests :: () {
    empty_rna_sequence();
    skip(rna_complement_of_cytosine_is_guanine());
    skip(rna_complement_of_guanine_is_cytosine());
    skip(rna_complement_of_thymine_is_adenine());
    skip(rna_complement_of_adenine_is_uracil());
    skip(rna_complement());
}

empty_rna_sequence :: () {
    assert_equal("", to_rna(""));
}

rna_complement_of_cytosine_is_guanine :: () {
    assert_equal("G", to_rna("C"));
}

rna_complement_of_guanine_is_cytosine :: () {
    assert_equal("C", to_rna("G"));
}

rna_complement_of_thymine_is_adenine :: () {
    assert_equal("A", to_rna("T"));
}

rna_complement_of_adenine_is_uracil :: () {
    assert_equal("U", to_rna("A"));
}

rna_complement :: () {
    assert_equal("UGCACCAGAAUU", to_rna("ACGTGGTCTTAA"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
