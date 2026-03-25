#run {
    one_is_i();
    skip(two_is_ii());
    skip(three_is_iii());
    skip(four_is_iv());
    skip(five_is_v());
    skip(six_is_vi());
    skip(nine_is_ix());
    skip(sixteen_is_xvi());
    skip(twenty_seven_is_xxvii());
    skip(forty_eight_is_xlviii());
    skip(forty_nine_is_xlix());
    skip(fifty_nine_is_lix());
    skip(sixty_six_is_lxvi());
    skip(ninety_three_is_xciii());
    skip(one_hundred_and_forty_one_is_cxli());
    skip(one_hundred_and_sixty_three_is_clxiii());
    skip(one_hundred_and_sixty_six_is_clxvi());
    skip(four_hundred_and_two_is_cdii());
    skip(five_hundred_and_seventy_five_is_dlxxv());
    skip(six_hundred_and_sixty_six_is_dclxvi());
    skip(nine_hundred_and_eleven_is_cmxi());
    skip(one_thousand_and_twenty_four_is_mxxiv());
    skip(one_thousand_six_hundred_and_sixty_six_is_mdclxvi());
    skip(three_thousand_is_mmm());
    skip(three_thousand_and_one_is_mmmi());
    skip(three_thousand_eight_hundred_and_eighty_eight_is_mmmdccclxxxviii());
    skip(three_thousand_nine_hundred_and_ninety_nine_is_mmmcmxcix());
}

one_is_i :: () {
    assert_equal("I", 1);
}

two_is_ii :: () {
    assert_equal("II", 2);
}

three_is_iii :: () {
    assert_equal("III", 3);
}

four_is_iv :: () {
    assert_equal("IV", 4);
}

five_is_v :: () {
    assert_equal("V", 5);
}

six_is_vi :: () {
    assert_equal("VI", 6);
}

nine_is_ix :: () {
    assert_equal("IX", 9);
}

sixteen_is_xvi :: () {
    assert_equal("XVI", 16);
}

twenty_seven_is_xxvii :: () {
    assert_equal("XXVII", 27);
}

forty_eight_is_xlviii :: () {
    assert_equal("XLVIII", 48);
}

forty_nine_is_xlix :: () {
    assert_equal("XLIX", 49);
}

fifty_nine_is_lix :: () {
    assert_equal("LIX", 59);
}

sixty_six_is_lxvi :: () {
    assert_equal("LXVI", 66);
}

ninety_three_is_xciii :: () {
    assert_equal("XCIII", 93);
}

one_hundred_and_forty_one_is_cxli :: () {
    assert_equal("CXLI", 141);
}

one_hundred_and_sixty_three_is_clxiii :: () {
    assert_equal("CLXIII", 163);
}

one_hundred_and_sixty_six_is_clxvi :: () {
    assert_equal("CLXVI", 166);
}

four_hundred_and_two_is_cdii :: () {
    assert_equal("CDII", 402);
}

five_hundred_and_seventy_five_is_dlxxv :: () {
    assert_equal("DLXXV", 575);
}

six_hundred_and_sixty_six_is_dclxvi :: () {
    assert_equal("DCLXVI", 666);
}

nine_hundred_and_eleven_is_cmxi :: () {
    assert_equal("CMXI", 911);
}

one_thousand_and_twenty_four_is_mxxiv :: () {
    assert_equal("MXXIV", 1024);
}

one_thousand_six_hundred_and_sixty_six_is_mdclxvi :: () {
    assert_equal("MDCLXVI", 1666);
}

three_thousand_is_mmm :: () {
    assert_equal("MMM", 3000);
}

three_thousand_and_one_is_mmmi :: () {
    assert_equal("MMMI", 3001);
}

three_thousand_eight_hundred_and_eighty_eight_is_mmmdccclxxxviii :: () {
    assert_equal("MMMDCCCLXXXVIII", 3888);
}

three_thousand_nine_hundred_and_ninety_nine_is_mmmcmxcix :: () {
    assert_equal("MMMCMXCIX", 3999);
}

#run {
    finished_running_tests();
}

#load "solution.jai";
#load "extest.jai";
