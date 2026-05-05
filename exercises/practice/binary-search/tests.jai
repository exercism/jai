run_tests :: () {
    finds_a_value_in_an_array_with_one_element();
    skip(finds_a_value_in_the_middle_of_an_array());
    skip(finds_a_value_at_the_beginning_of_an_array());
    skip(finds_a_value_at_the_end_of_an_array());
    skip(finds_a_value_in_an_array_of_odd_length());
    skip(finds_a_value_in_an_array_of_even_length());
    skip(identifies_that_a_value_is_not_included_in_the_array());
    skip(a_value_smaller_than_the_arrays_smallest_value_is_not_found());
    skip(a_value_larger_than_the_arrays_largest_value_is_not_found());
    skip(nothing_is_found_in_an_empty_array());
    skip(nothing_is_found_when_the_left_and_right_bounds_cross());
}

finds_a_value_in_an_array_with_one_element :: () {
    ok, index := binary_search(.[6], 6);
    assert_equal(true, ok);
    assert_equal(0, index);
}

finds_a_value_in_the_middle_of_an_array :: () {
    ok, index := binary_search(.[1, 3, 4, 6, 8, 9, 11], 6);
    assert_equal(true, ok);
    assert_equal(3, index);
}

finds_a_value_at_the_beginning_of_an_array :: () {
    ok, index := binary_search(.[1, 3, 4, 6, 8, 9, 11], 1);
    assert_equal(true, ok);
    assert_equal(0, index);
}

finds_a_value_at_the_end_of_an_array :: () {
    ok, index := binary_search(.[1, 3, 4, 6, 8, 9, 11], 11);
    assert_equal(true, ok);
    assert_equal(6, index);
}

finds_a_value_in_an_array_of_odd_length :: () {
    ok, index := binary_search(.[1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], 144);
    assert_equal(true, ok);
    assert_equal(9, index);
}

finds_a_value_in_an_array_of_even_length :: () {
    ok, index := binary_search(.[1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], 21);
    assert_equal(true, ok);
    assert_equal(5, index);
}

identifies_that_a_value_is_not_included_in_the_array :: () {
    ok, _ := binary_search(.[1, 3, 4, 6, 8, 9, 11], 7);
    assert_equal(false, ok);
}

a_value_smaller_than_the_arrays_smallest_value_is_not_found :: () {
    ok, _ := binary_search(.[1, 3, 4, 6, 8, 9, 11], 0);
    assert_equal(false, ok);
}

a_value_larger_than_the_arrays_largest_value_is_not_found :: () {
    ok, _ := binary_search(.[1, 3, 4, 6, 8, 9, 11], 13);
    assert_equal(false, ok);
}

nothing_is_found_in_an_empty_array :: () {
    ok, _ := binary_search(.[], 1);
    assert_equal(false, ok);
}

nothing_is_found_when_the_left_and_right_bounds_cross :: () {
    ok, _ := binary_search(.[1, 2], 0);
    assert_equal(false, ok);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
