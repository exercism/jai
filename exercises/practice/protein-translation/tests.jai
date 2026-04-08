run_tests :: () {
    empty_r_n_a_sequence_results_in_no_proteins();
    skip(methionine_r_n_a_sequence());
    skip(phenylalanine_r_n_a_sequence_1());
    skip(phenylalanine_r_n_a_sequence_2());
    skip(leucine_r_n_a_sequence_1());
    skip(leucine_r_n_a_sequence_2());
    skip(serine_r_n_a_sequence_1());
    skip(serine_r_n_a_sequence_2());
    skip(serine_r_n_a_sequence_3());
    skip(serine_r_n_a_sequence_4());
    skip(tyrosine_r_n_a_sequence_1());
    skip(tyrosine_r_n_a_sequence_2());
    skip(cysteine_r_n_a_sequence_1());
    skip(cysteine_r_n_a_sequence_2());
    skip(tryptophan_r_n_a_sequence());
    skip(s_t_o_p_codon_r_n_a_sequence_1());
    skip(s_t_o_p_codon_r_n_a_sequence_2());
    skip(s_t_o_p_codon_r_n_a_sequence_3());
    skip(sequence_of_two_protein_codons_translates_into_proteins());
    skip(sequence_of_two_different_protein_codons_translates_into_proteins());
    skip(translate_r_n_a_strand_into_correct_protein_list());
    skip(translation_stops_if_s_t_o_p_codon_at_beginning_of_sequence());
    skip(translation_stops_if_s_t_o_p_codon_at_end_of_twocodon_sequence());
    skip(translation_stops_if_s_t_o_p_codon_at_end_of_threecodon_sequence());
    skip(translation_stops_if_s_t_o_p_codon_in_middle_of_threecodon_sequence());
    skip(translation_stops_if_s_t_o_p_codon_in_middle_of_sixcodon_sequence());
    skip(sequence_of_two_non_s_t_o_p_codons_does_not_translate_to_a_s_t_o_p_codon());
    skip(unknown_amino_acids_not_part_of_a_codon_cant_translate());
    skip(incomplete_r_n_a_sequence_cant_translate());
    skip(incomplete_r_n_a_sequence_can_translate_if_valid_until_a_s_t_o_p_codon());
}

empty_r_n_a_sequence_results_in_no_proteins :: () {
    ok, proteins := to_proteins("");
    assert_equal(true, ok);
    assert_equal(0, proteins.count);
}

methionine_r_n_a_sequence :: () {
    ok, proteins := to_proteins("AUG");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Methionine", proteins[0]);
}

phenylalanine_r_n_a_sequence_1 :: () {
    ok, proteins := to_proteins("UUU");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Phenylalanine", proteins[0]);
}

phenylalanine_r_n_a_sequence_2 :: () {
    ok, proteins := to_proteins("UUC");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Phenylalanine", proteins[0]);
}

leucine_r_n_a_sequence_1 :: () {
    ok, proteins := to_proteins("UUA");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Leucine", proteins[0]);
}

leucine_r_n_a_sequence_2 :: () {
    ok, proteins := to_proteins("UUG");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Leucine", proteins[0]);
}

serine_r_n_a_sequence_1 :: () {
    ok, proteins := to_proteins("UCU");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Serine", proteins[0]);
}

serine_r_n_a_sequence_2 :: () {
    ok, proteins := to_proteins("UCC");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Serine", proteins[0]);
}

serine_r_n_a_sequence_3 :: () {
    ok, proteins := to_proteins("UCA");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Serine", proteins[0]);
}

serine_r_n_a_sequence_4 :: () {
    ok, proteins := to_proteins("UCG");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Serine", proteins[0]);
}

tyrosine_r_n_a_sequence_1 :: () {
    ok, proteins := to_proteins("UAU");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Tyrosine", proteins[0]);
}

tyrosine_r_n_a_sequence_2 :: () {
    ok, proteins := to_proteins("UAC");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Tyrosine", proteins[0]);
}

cysteine_r_n_a_sequence_1 :: () {
    ok, proteins := to_proteins("UGU");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Cysteine", proteins[0]);
}

cysteine_r_n_a_sequence_2 :: () {
    ok, proteins := to_proteins("UGC");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Cysteine", proteins[0]);
}

tryptophan_r_n_a_sequence :: () {
    ok, proteins := to_proteins("UGG");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Tryptophan", proteins[0]);
}

s_t_o_p_codon_r_n_a_sequence_1 :: () {
    ok, proteins := to_proteins("UAA");
    assert_equal(true, ok);
    assert_equal(0, proteins.count);
}

s_t_o_p_codon_r_n_a_sequence_2 :: () {
    ok, proteins := to_proteins("UAG");
    assert_equal(true, ok);
    assert_equal(0, proteins.count);
}

s_t_o_p_codon_r_n_a_sequence_3 :: () {
    ok, proteins := to_proteins("UGA");
    assert_equal(true, ok);
    assert_equal(0, proteins.count);
}

sequence_of_two_protein_codons_translates_into_proteins :: () {
    ok, proteins := to_proteins("UUUUUU");
    assert_equal(true, ok);
    assert_equal(2, proteins.count);
    assert_equal("Phenylalanine", proteins[0]);
    assert_equal("Phenylalanine", proteins[1]);
}

sequence_of_two_different_protein_codons_translates_into_proteins :: () {
    ok, proteins := to_proteins("UUAUUG");
    assert_equal(true, ok);
    assert_equal(2, proteins.count);
    assert_equal("Leucine", proteins[0]);
    assert_equal("Leucine", proteins[1]);
}

translate_r_n_a_strand_into_correct_protein_list :: () {
    ok, proteins := to_proteins("AUGUUUUGG");
    assert_equal(true, ok);
    assert_equal(3, proteins.count);
    assert_equal("Methionine", proteins[0]);
    assert_equal("Phenylalanine", proteins[1]);
    assert_equal("Tryptophan", proteins[2]);
}

translation_stops_if_s_t_o_p_codon_at_beginning_of_sequence :: () {
    ok, proteins := to_proteins("UAGUGG");
    assert_equal(true, ok);
    assert_equal(0, proteins.count);
}

translation_stops_if_s_t_o_p_codon_at_end_of_twocodon_sequence :: () {
    ok, proteins := to_proteins("UGGUAG");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Tryptophan", proteins[0]);
}

translation_stops_if_s_t_o_p_codon_at_end_of_threecodon_sequence :: () {
    ok, proteins := to_proteins("AUGUUUUAA");
    assert_equal(true, ok);
    assert_equal(2, proteins.count);
    assert_equal("Methionine", proteins[0]);
    assert_equal("Phenylalanine", proteins[1]);
}

translation_stops_if_s_t_o_p_codon_in_middle_of_threecodon_sequence :: () {
    ok, proteins := to_proteins("UGGUAGUGG");
    assert_equal(true, ok);
    assert_equal(1, proteins.count);
    assert_equal("Tryptophan", proteins[0]);
}

translation_stops_if_s_t_o_p_codon_in_middle_of_sixcodon_sequence :: () {
    ok, proteins := to_proteins("UGGUGUUAUUAAUGGUUU");
    assert_equal(true, ok);
    assert_equal(3, proteins.count);
    assert_equal("Tryptophan", proteins[0]);
    assert_equal("Cysteine", proteins[1]);
    assert_equal("Tyrosine", proteins[2]);
}

sequence_of_two_non_s_t_o_p_codons_does_not_translate_to_a_s_t_o_p_codon :: () {
    ok, proteins := to_proteins("AUGAUG");
    assert_equal(true, ok);
    assert_equal(2, proteins.count);
    assert_equal("Methionine", proteins[0]);
    assert_equal("Methionine", proteins[1]);
}

unknown_amino_acids_not_part_of_a_codon_cant_translate :: () {
    ok, _ := to_proteins("XYZ");
    assert_equal(false, ok);
}

incomplete_r_n_a_sequence_cant_translate :: () {
    ok, _ := to_proteins("AUGU");
    assert_equal(false, ok);
}

incomplete_r_n_a_sequence_can_translate_if_valid_until_a_s_t_o_p_codon :: () {
    ok, proteins := to_proteins("UUCUUCUAAUGGU");
    assert_equal(true, ok);
    assert_equal(2, proteins.count);
    assert_equal("Phenylalanine", proteins[0]);
    assert_equal("Phenylalanine", proteins[1]);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
