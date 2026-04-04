run_tests :: () {
    number_1_is_i();
    skip(number_2_is_ii());
    skip(number_3_is_iii());
    skip(number_4_is_iv());
    skip(number_5_is_v());
    skip(number_6_is_vi());
    skip(number_9_is_ix());
    skip(number_16_is_xvi());
    skip(number_27_is_xxvii());
    skip(number_48_is_xlviii());
    skip(number_49_is_xlix());
    skip(number_59_is_lix());
    skip(number_66_is_lxvi());
    skip(number_93_is_xciii());
    skip(number_141_is_cxli());
    skip(number_163_is_clxiii());
    skip(number_166_is_clxvi());
    skip(number_402_is_cdii());
    skip(number_575_is_dlxxv());
    skip(number_666_is_dclxvi());
    skip(number_911_is_cmxi());
    skip(number_1024_is_mxxiv());
    skip(number_1666_is_mdclxvi());
    skip(number_3000_is_mmm());
    skip(number_3001_is_mmmi());
    skip(number_3888_is_mmmdccclxxxviii());
    skip(number_3999_is_mmmcmxcix());
}

number_1_is_i :: () {
    assert_equal("I", to_roman(1));
}

number_2_is_ii :: () {
    assert_equal("II", to_roman(2));
}

number_3_is_iii :: () {
    assert_equal("III", to_roman(3));
}

number_4_is_iv :: () {
    assert_equal("IV", to_roman(4));
}

number_5_is_v :: () {
    assert_equal("V", to_roman(5));
}

number_6_is_vi :: () {
    assert_equal("VI", to_roman(6));
}

number_9_is_ix :: () {
    assert_equal("IX", to_roman(9));
}

number_16_is_xvi :: () {
    assert_equal("XVI", to_roman(16));
}

number_27_is_xxvii :: () {
    assert_equal("XXVII", to_roman(27));
}

number_48_is_xlviii :: () {
    assert_equal("XLVIII", to_roman(48));
}

number_49_is_xlix :: () {
    assert_equal("XLIX", to_roman(49));
}

number_59_is_lix :: () {
    assert_equal("LIX", to_roman(59));
}

number_66_is_lxvi :: () {
    assert_equal("LXVI", to_roman(66));
}

number_93_is_xciii :: () {
    assert_equal("XCIII", to_roman(93));
}

number_141_is_cxli :: () {
    assert_equal("CXLI", to_roman(141));
}

number_163_is_clxiii :: () {
    assert_equal("CLXIII", to_roman(163));
}

number_166_is_clxvi :: () {
    assert_equal("CLXVI", to_roman(166));
}

number_402_is_cdii :: () {
    assert_equal("CDII", to_roman(402));
}

number_575_is_dlxxv :: () {
    assert_equal("DLXXV", to_roman(575));
}

number_666_is_dclxvi :: () {
    assert_equal("DCLXVI", to_roman(666));
}

number_911_is_cmxi :: () {
    assert_equal("CMXI", to_roman(911));
}

number_1024_is_mxxiv :: () {
    assert_equal("MXXIV", to_roman(1024));
}

number_1666_is_mdclxvi :: () {
    assert_equal("MDCLXVI", to_roman(1666));
}

number_3000_is_mmm :: () {
    assert_equal("MMM", to_roman(3000));
}

number_3001_is_mmmi :: () {
    assert_equal("MMMI", to_roman(3001));
}

number_3888_is_mmmdccclxxxviii :: () {
    assert_equal("MMMDCCCLXXXVIII", to_roman(3888));
}

number_3999_is_mmmcmxcix :: () {
    assert_equal("MMMCMXCIX", to_roman(3999));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
