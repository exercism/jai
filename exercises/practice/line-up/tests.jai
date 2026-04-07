run_tests :: () {
    format_smallest_nonexceptional_ordinal_numeral_4();
    skip(format_greatest_single_digit_nonexceptional_ordinal_numeral_9());
    skip(format_nonexceptional_ordinal_numeral_5());
    skip(format_nonexceptional_ordinal_numeral_6());
    skip(format_nonexceptional_ordinal_numeral_7());
    skip(format_nonexceptional_ordinal_numeral_8());
    skip(format_exceptional_ordinal_numeral_1());
    skip(format_exceptional_ordinal_numeral_2());
    skip(format_exceptional_ordinal_numeral_3());
    skip(format_smallest_two_digit_nonexceptional_ordinal_numeral_10());
    skip(format_nonexceptional_ordinal_numeral_11());
    skip(format_nonexceptional_ordinal_numeral_12());
    skip(format_nonexceptional_ordinal_numeral_13());
    skip(format_exceptional_ordinal_numeral_21());
    skip(format_exceptional_ordinal_numeral_62());
    skip(format_exceptional_ordinal_numeral_100());
    skip(format_exceptional_ordinal_numeral_101());
    skip(format_nonexceptional_ordinal_numeral_112());
    skip(format_exceptional_ordinal_numeral_123());
}

format_smallest_nonexceptional_ordinal_numeral_4 :: () {
    assert_equal("Gianna, you are the 4th customer we serve today. Thank you!", format("Gianna", 4));
}

format_greatest_single_digit_nonexceptional_ordinal_numeral_9 :: () {
    assert_equal("Maarten, you are the 9th customer we serve today. Thank you!", format("Maarten", 9));
}

format_nonexceptional_ordinal_numeral_5 :: () {
    assert_equal("Petronila, you are the 5th customer we serve today. Thank you!", format("Petronila", 5));
}

format_nonexceptional_ordinal_numeral_6 :: () {
    assert_equal("Attakullakulla, you are the 6th customer we serve today. Thank you!", format("Attakullakulla", 6));
}

format_nonexceptional_ordinal_numeral_7 :: () {
    assert_equal("Kate, you are the 7th customer we serve today. Thank you!", format("Kate", 7));
}

format_nonexceptional_ordinal_numeral_8 :: () {
    assert_equal("Maximiliano, you are the 8th customer we serve today. Thank you!", format("Maximiliano", 8));
}

format_exceptional_ordinal_numeral_1 :: () {
    assert_equal("Mary, you are the 1st customer we serve today. Thank you!", format("Mary", 1));
}

format_exceptional_ordinal_numeral_2 :: () {
    assert_equal("Haruto, you are the 2nd customer we serve today. Thank you!", format("Haruto", 2));
}

format_exceptional_ordinal_numeral_3 :: () {
    assert_equal("Henriette, you are the 3rd customer we serve today. Thank you!", format("Henriette", 3));
}

format_smallest_two_digit_nonexceptional_ordinal_numeral_10 :: () {
    assert_equal("Alvarez, you are the 10th customer we serve today. Thank you!", format("Alvarez", 10));
}

format_nonexceptional_ordinal_numeral_11 :: () {
    assert_equal("Jacqueline, you are the 11th customer we serve today. Thank you!", format("Jacqueline", 11));
}

format_nonexceptional_ordinal_numeral_12 :: () {
    assert_equal("Juan, you are the 12th customer we serve today. Thank you!", format("Juan", 12));
}

format_nonexceptional_ordinal_numeral_13 :: () {
    assert_equal("Patricia, you are the 13th customer we serve today. Thank you!", format("Patricia", 13));
}

format_exceptional_ordinal_numeral_21 :: () {
    assert_equal("Washi, you are the 21st customer we serve today. Thank you!", format("Washi", 21));
}

format_exceptional_ordinal_numeral_62 :: () {
    assert_equal("Nayra, you are the 62nd customer we serve today. Thank you!", format("Nayra", 62));
}

format_exceptional_ordinal_numeral_100 :: () {
    assert_equal("John, you are the 100th customer we serve today. Thank you!", format("John", 100));
}

format_exceptional_ordinal_numeral_101 :: () {
    assert_equal("Zeinab, you are the 101st customer we serve today. Thank you!", format("Zeinab", 101));
}

format_nonexceptional_ordinal_numeral_112 :: () {
    assert_equal("Knud, you are the 112th customer we serve today. Thank you!", format("Knud", 112));
}

format_exceptional_ordinal_numeral_123 :: () {
    assert_equal("Yma, you are the 123rd customer we serve today. Thank you!", format("Yma", 123));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
