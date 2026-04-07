run_tests :: () {
    the_sound_for_1_is_1();
    skip(the_sound_for_3_is_pling());
    skip(the_sound_for_5_is_plang());
    skip(the_sound_for_7_is_plong());
    skip(the_sound_for_6_is_pling_as_it_has_a_factor_3());
    skip(number_2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base());
    skip(the_sound_for_9_is_pling_as_it_has_a_factor_3());
    skip(the_sound_for_10_is_plang_as_it_has_a_factor_5());
    skip(the_sound_for_14_is_plong_as_it_has_a_factor_of_7());
    skip(the_sound_for_15_is_pling_plang_as_it_has_factors_3_and_5());
    skip(the_sound_for_21_is_pling_plong_as_it_has_factors_3_and_7());
    skip(the_sound_for_25_is_plang_as_it_has_a_factor_5());
    skip(the_sound_for_27_is_pling_as_it_has_a_factor_3());
    skip(the_sound_for_35_is_plang_plong_as_it_has_factors_5_and_7());
    skip(the_sound_for_49_is_plong_as_it_has_a_factor_7());
    skip(the_sound_for_52_is_52());
    skip(the_sound_for_105_is_pling_plang_plong_as_it_has_factors_3_5_and_7());
    skip(the_sound_for_3125_is_plang_as_it_has_a_factor_5());
}

the_sound_for_1_is_1 :: () {
    assert_equal("1", convert(1));
}

the_sound_for_3_is_pling :: () {
    assert_equal("Pling", convert(3));
}

the_sound_for_5_is_plang :: () {
    assert_equal("Plang", convert(5));
}

the_sound_for_7_is_plong :: () {
    assert_equal("Plong", convert(7));
}

the_sound_for_6_is_pling_as_it_has_a_factor_3 :: () {
    assert_equal("Pling", convert(6));
}

number_2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base :: () {
    assert_equal("8", convert(8));
}

the_sound_for_9_is_pling_as_it_has_a_factor_3 :: () {
    assert_equal("Pling", convert(9));
}

the_sound_for_10_is_plang_as_it_has_a_factor_5 :: () {
    assert_equal("Plang", convert(10));
}

the_sound_for_14_is_plong_as_it_has_a_factor_of_7 :: () {
    assert_equal("Plong", convert(14));
}

the_sound_for_15_is_pling_plang_as_it_has_factors_3_and_5 :: () {
    assert_equal("PlingPlang", convert(15));
}

the_sound_for_21_is_pling_plong_as_it_has_factors_3_and_7 :: () {
    assert_equal("PlingPlong", convert(21));
}

the_sound_for_25_is_plang_as_it_has_a_factor_5 :: () {
    assert_equal("Plang", convert(25));
}

the_sound_for_27_is_pling_as_it_has_a_factor_3 :: () {
    assert_equal("Pling", convert(27));
}

the_sound_for_35_is_plang_plong_as_it_has_factors_5_and_7 :: () {
    assert_equal("PlangPlong", convert(35));
}

the_sound_for_49_is_plong_as_it_has_a_factor_7 :: () {
    assert_equal("Plong", convert(49));
}

the_sound_for_52_is_52 :: () {
    assert_equal("52", convert(52));
}

the_sound_for_105_is_pling_plang_plong_as_it_has_factors_3_5_and_7 :: () {
    assert_equal("PlingPlangPlong", convert(105));
}

the_sound_for_3125_is_plang_as_it_has_a_factor_5 :: () {
    assert_equal("Plang", convert(3125));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
