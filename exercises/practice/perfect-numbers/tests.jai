run_tests :: () {
    smallest_perfect_number_is_classified_correctly();
    skip(medium_perfect_number_is_classified_correctly());
    skip(large_perfect_number_is_classified_correctly());
    skip(smallest_abundant_number_is_classified_correctly());
    skip(medium_abundant_number_is_classified_correctly());
    skip(large_abundant_number_is_classified_correctly());
    skip(perfect_square_abundant_number_is_classified_correctly());
    skip(smallest_prime_deficient_number_is_classified_correctly());
    skip(smallest_nonprime_deficient_number_is_classified_correctly());
    skip(medium_deficient_number_is_classified_correctly());
    skip(large_deficient_number_is_classified_correctly());
    skip(edge_case_no_factors_other_than_itself_is_classified_correctly());
}

smallest_perfect_number_is_classified_correctly :: () {
    assert_equal(Classification.PERFECT, classify(6));
}

medium_perfect_number_is_classified_correctly :: () {
    assert_equal(Classification.PERFECT, classify(28));
}

large_perfect_number_is_classified_correctly :: () {
    assert_equal(Classification.PERFECT, classify(33550336));
}

smallest_abundant_number_is_classified_correctly :: () {
    assert_equal(Classification.ABUNDANT, classify(12));
}

medium_abundant_number_is_classified_correctly :: () {
    assert_equal(Classification.ABUNDANT, classify(30));
}

large_abundant_number_is_classified_correctly :: () {
    assert_equal(Classification.ABUNDANT, classify(33550335));
}

perfect_square_abundant_number_is_classified_correctly :: () {
    assert_equal(Classification.ABUNDANT, classify(196));
}

smallest_prime_deficient_number_is_classified_correctly :: () {
    assert_equal(Classification.DEFICIENT, classify(2));
}

smallest_nonprime_deficient_number_is_classified_correctly :: () {
    assert_equal(Classification.DEFICIENT, classify(4));
}

medium_deficient_number_is_classified_correctly :: () {
    assert_equal(Classification.DEFICIENT, classify(32));
}

large_deficient_number_is_classified_correctly :: () {
    assert_equal(Classification.DEFICIENT, classify(33550337));
}

edge_case_no_factors_other_than_itself_is_classified_correctly :: () {
    assert_equal(Classification.DEFICIENT, classify(1));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
