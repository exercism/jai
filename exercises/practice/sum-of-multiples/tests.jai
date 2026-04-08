run_tests :: () {
    no_multiples_within_limit();
    skip(one_factor_has_multiples_within_limit());
    skip(more_than_one_multiple_within_limit());
    skip(more_than_one_factor_with_multiples_within_limit());
    skip(each_multiple_is_only_counted_once());
    skip(a_much_larger_limit());
    skip(three_factors());
    skip(factors_not_relatively_prime());
    skip(some_pairs_of_factors_relatively_prime_and_some_not());
    skip(one_factor_is_a_multiple_of_another());
    skip(much_larger_factors());
    skip(all_numbers_are_multiples_of_1());
    skip(no_factors_means_an_empty_sum());
    skip(the_only_multiple_of_0_is_0());
    skip(the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors());
    skip(solutions_using_includeexclude_must_extend_to_cardinality_greater_than_3());
}

no_multiples_within_limit :: () {
    assert_equal(0, sum(.[3, 5], 1));
}

one_factor_has_multiples_within_limit :: () {
    assert_equal(3, sum(.[3, 5], 4));
}

more_than_one_multiple_within_limit :: () {
    assert_equal(9, sum(.[3], 7));
}

more_than_one_factor_with_multiples_within_limit :: () {
    assert_equal(23, sum(.[3, 5], 10));
}

each_multiple_is_only_counted_once :: () {
    assert_equal(2318, sum(.[3, 5], 100));
}

a_much_larger_limit :: () {
    assert_equal(233168, sum(.[3, 5], 1000));
}

three_factors :: () {
    assert_equal(51, sum(.[7, 13, 17], 20));
}

factors_not_relatively_prime :: () {
    assert_equal(30, sum(.[4, 6], 15));
}

some_pairs_of_factors_relatively_prime_and_some_not :: () {
    assert_equal(4419, sum(.[5, 6, 8], 150));
}

one_factor_is_a_multiple_of_another :: () {
    assert_equal(275, sum(.[5, 25], 51));
}

much_larger_factors :: () {
    assert_equal(2203160, sum(.[43, 47], 10000));
}

all_numbers_are_multiples_of_1 :: () {
    assert_equal(4950, sum(.[1], 100));
}

no_factors_means_an_empty_sum :: () {
    assert_equal(0, sum(.[], 10000));
}

the_only_multiple_of_0_is_0 :: () {
    assert_equal(0, sum(.[0], 1));
}

the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors :: () {
    assert_equal(3, sum(.[3, 0], 4));
}

solutions_using_includeexclude_must_extend_to_cardinality_greater_than_3 :: () {
    assert_equal(39614537, sum(.[2, 3, 5, 7, 11], 10000));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
