run_tests :: () {
    slices_of_one_from_one();
    skip(slices_of_one_from_two());
    skip(slices_of_two());
    skip(slices_of_two_overlap());
    skip(slices_can_include_duplicates());
    skip(slices_of_a_long_series());
    skip(slice_length_is_too_large());
    skip(slice_length_is_way_too_large());
    skip(slice_length_cannot_be_zero());
    skip(slice_length_cannot_be_negative());
    skip(empty_series_is_invalid());
}

slices_of_one_from_one :: () {
    ok, slices := to_slices("1", 1);
    assert_equal(true, ok);
    assert_equal(1, slices.count);
    assert_equal("1", slices[0]);
}

slices_of_one_from_two :: () {
    ok, slices := to_slices("12", 1);
    assert_equal(true, ok);
    assert_equal(2, slices.count);
    assert_equal("1", slices[0]);
    assert_equal("2", slices[1]);
}

slices_of_two :: () {
    ok, slices := to_slices("35", 2);
    assert_equal(true, ok);
    assert_equal(1, slices.count);
    assert_equal("35", slices[0]);
}

slices_of_two_overlap :: () {
    ok, slices := to_slices("9142", 2);
    assert_equal(true, ok);
    assert_equal(3, slices.count);
    assert_equal("91", slices[0]);
    assert_equal("14", slices[1]);
    assert_equal("42", slices[2]);
}

slices_can_include_duplicates :: () {
    ok, slices := to_slices("777777", 3);
    assert_equal(true, ok);
    assert_equal(4, slices.count);
    assert_equal("777", slices[0]);
    assert_equal("777", slices[1]);
    assert_equal("777", slices[2]);
    assert_equal("777", slices[3]);
}

slices_of_a_long_series :: () {
    ok, slices := to_slices("918493904243", 5);
    assert_equal(true, ok);
    assert_equal(8, slices.count);
    assert_equal("91849", slices[0]);
    assert_equal("18493", slices[1]);
    assert_equal("84939", slices[2]);
    assert_equal("49390", slices[3]);
    assert_equal("93904", slices[4]);
    assert_equal("39042", slices[5]);
    assert_equal("90424", slices[6]);
    assert_equal("04243", slices[7]);
}

slice_length_is_too_large :: () {
    ok, _ := to_slices("12345", 6);
    assert_equal(false, ok);
}

slice_length_is_way_too_large :: () {
    ok, _ := to_slices("12345", 42);
    assert_equal(false, ok);
}

slice_length_cannot_be_zero :: () {
    ok, _ := to_slices("12345", 0);
    assert_equal(false, ok);
}

slice_length_cannot_be_negative :: () {
    ok, _ := to_slices("123", -1);
    assert_equal(false, ok);
}

empty_series_is_invalid :: () {
    ok, _ := to_slices("", 1);
    assert_equal(false, ok);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
