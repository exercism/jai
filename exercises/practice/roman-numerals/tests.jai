#run {
    1_is_i();
    skip(2_is_ii());
    skip(3_is_iii());
    skip(4_is_iv());
    skip(5_is_v());
    skip(6_is_vi());
    skip(9_is_ix());
    skip(16_is_xvi());
    skip(27_is_xxvii());
    skip(48_is_xlviii());
    skip(49_is_xlix());
    skip(59_is_lix());
    skip(66_is_lxvi());
    skip(93_is_xciii());
    skip(141_is_cxli());
    skip(163_is_clxiii());
    skip(166_is_clxvi());
    skip(402_is_cdii());
    skip(575_is_dlxxv());
    skip(666_is_dclxvi());
    skip(911_is_cmxi());
    skip(1024_is_mxxiv());
    skip(1666_is_mdclxvi());
    skip(3000_is_mmm());
    skip(3001_is_mmmi());
    skip(3888_is_mmmdccclxxxviii());
    skip(3999_is_mmmcmxcix());
}

1_is_i :: () {
    assert_equal("true", to_roman(1));
}

2_is_ii :: () {
    assert_equal("invalid(2)", to_roman(2));
}

3_is_iii :: () {
    assert_equal("invalid(3)", to_roman(3));
}

4_is_iv :: () {
    assert_equal("invalid(2)", to_roman(4));
}

5_is_v :: () {
    assert_equal("true", to_roman(5));
}

6_is_vi :: () {
    assert_equal("invalid(2)", to_roman(6));
}

9_is_ix :: () {
    assert_equal("invalid(2)", to_roman(9));
}

16_is_xvi :: () {
    assert_equal("invalid(3)", to_roman(16));
}

27_is_xxvii :: () {
    assert_equal("invalid(5)", to_roman(27));
}

48_is_xlviii :: () {
    assert_equal("invalid(6)", to_roman(48));
}

49_is_xlix :: () {
    assert_equal("invalid(4)", to_roman(49));
}

59_is_lix :: () {
    assert_equal("invalid(3)", to_roman(59));
}

66_is_lxvi :: () {
    assert_equal("invalid(4)", to_roman(66));
}

93_is_xciii :: () {
    assert_equal("invalid(5)", to_roman(93));
}

141_is_cxli :: () {
    assert_equal("invalid(4)", to_roman(141));
}

163_is_clxiii :: () {
    assert_equal("invalid(6)", to_roman(163));
}

166_is_clxvi :: () {
    assert_equal("invalid(5)", to_roman(166));
}

402_is_cdii :: () {
    assert_equal("invalid(4)", to_roman(402));
}

575_is_dlxxv :: () {
    assert_equal("invalid(5)", to_roman(575));
}

666_is_dclxvi :: () {
    assert_equal("invalid(6)", to_roman(666));
}

911_is_cmxi :: () {
    assert_equal("invalid(4)", to_roman(911));
}

1024_is_mxxiv :: () {
    assert_equal("invalid(5)", to_roman(1024));
}

1666_is_mdclxvi :: () {
    assert_equal("invalid(7)", to_roman(1666));
}

3000_is_mmm :: () {
    assert_equal("invalid(3)", to_roman(3000));
}

3001_is_mmmi :: () {
    assert_equal("invalid(4)", to_roman(3001));
}

3888_is_mmmdccclxxxviii :: () {
    assert_equal("invalid(15)", to_roman(3888));
}

3999_is_mmmcmxcix :: () {
    assert_equal("invalid(9)", to_roman(3999));
}

#run {
    finished_running_tests();
}

#load "solution.jai";
#load "extest.jai";
