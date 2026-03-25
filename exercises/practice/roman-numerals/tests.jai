main :: () {
    one_is_i();
    two_is_ii();
    three_is_iii();
    four_is_iv();
    five_is_v();
    six_is_vi();
    nine_is_ix();
    sixteen_is_xvi();
    twenty_seven_is_xxvii();
    forty_eight_is_xlviii();
    forty_nine_is_xlix();
    fifty_nine_is_lix();
    sixty_six_is_lxvi();
    ninety_three_is_xciii();
    one_hundred_and_forty_one_is_cxli();
    one_hundred_and_sixty_three_is_clxiii();
    one_hundred_and_sixty_six_is_clxvi();
    four_hundred_and_two_is_cdii();
    five_hundred_and_seventy_five_is_dlxxv();
    six_hundred_and_sixty_six_is_dclxvi();
    nine_hundred_and_eleven_is_cmxi();
    one_thousand_and_twenty_four_is_mxxiv();
    one_thousand_six_hundred_and_sixty_six_is_mdclxvi();
    three_thousand_is_mmm();
    three_thousand_and_one_is_mmmi();
    three_thousand_eight_hundred_and_eighty_eight_is_mmmdccclxxxviii();
    three_thousand_nine_hundred_and_ninety_nine_is_mmmcmxcix();
}

one_is_i :: () {
    assert(to_roman(1) == "I");
}

two_is_ii :: () {
    assert(to_roman(2) == "II");
}

three_is_iii :: () {
    assert(to_roman(3) == "III");
}

four_is_iv :: () {
    assert(to_roman(4) == "IV");
}

five_is_v :: () {
    assert(to_roman(5) == "V");
}

six_is_vi :: () {
    assert(to_roman(6) == "VI");
}

nine_is_ix :: () {
    assert(to_roman(9) == "IX");
}

sixteen_is_xvi :: () {
    assert(to_roman(16) == "XVI");
}

twenty_seven_is_xxvii :: () {
    assert(to_roman(27) == "XXVII");
}

forty_eight_is_xlviii :: () {
    assert(to_roman(48) == "XLVIII");
}

forty_nine_is_xlix :: () {
    assert(to_roman(49) == "XLIX");
}

fifty_nine_is_lix :: () {
    assert(to_roman(59) == "LIX");
}

sixty_six_is_lxvi :: () {
    assert(to_roman(66) == "LXVI");
}

ninety_three_is_xciii :: () {
    assert(to_roman(93) == "XCIII");
}

one_hundred_and_forty_one_is_cxli :: () {
    assert(to_roman(141) == "CXLI");
}

one_hundred_and_sixty_three_is_clxiii :: () {
    assert(to_roman(163) == "CLXIII");
}

one_hundred_and_sixty_six_is_clxvi :: () {
    assert(to_roman(166) == "CLXVI");
}

four_hundred_and_two_is_cdii :: () {
    assert(to_roman(402) == "CDII");
}

five_hundred_and_seventy_five_is_dlxxv :: () {
    assert(to_roman(575) == "DLXXV");
}

six_hundred_and_sixty_six_is_dclxvi :: () {
    assert(to_roman(666) == "DCLXVI");
}

nine_hundred_and_eleven_is_cmxi :: () {
    assert(to_roman(911) == "CMXI");
}

one_thousand_and_twenty_four_is_mxxiv :: () {
    assert(to_roman(1024) == "MXXIV");
}

one_thousand_six_hundred_and_sixty_six_is_mdclxvi :: () {
    assert(to_roman(1666) == "MDCLXVI");
}

three_thousand_is_mmm :: () {
    assert(to_roman(3000) == "MMM");
}

three_thousand_and_one_is_mmmi :: () {
    assert(to_roman(3001) == "MMMI");
}

three_thousand_eight_hundred_and_eighty_eight_is_mmmdccclxxxviii :: () {
    assert(to_roman(3888) == "MMMDCCCLXXXVIII");
}

three_thousand_nine_hundred_and_ninety_nine_is_mmmcmxcix :: () {
    assert(to_roman(3999) == "MMMCMXCIX");
}

#load "solution.jai";
#load "extest.jai";
