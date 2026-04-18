run_tests :: () {
    reading_empty_buffer_should_fail();
    skip(can_read_an_item_just_written());
    skip(each_item_may_only_be_read_once());
    skip(items_are_read_in_the_order_they_are_written());
    skip(full_buffer_cant_be_written_to());
    skip(a_read_frees_up_capacity_for_another_write());
    skip(read_position_is_maintained_even_across_multiple_writes());
    skip(items_cleared_out_of_buffer_cant_be_read());
    skip(clear_frees_up_capacity_for_another_write());
    skip(clear_does_nothing_on_empty_buffer());
    skip(overwrite_acts_like_write_on_nonfull_buffer());
    skip(overwrite_replaces_the_oldest_item_on_full_buffer());
    skip(overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read());
    skip(initial_clear_does_not_affect_wrapping_around());
}

reading_empty_buffer_should_fail :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(false, read_successful_1);
}

can_read_an_item_just_written :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
}

each_item_may_only_be_read_once :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(false, read_successful_2);
}

items_are_read_in_the_order_they_are_written :: () {
    CAPACITY :: 2;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(true, write_successful_2);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(true, read_successful_2);
    assert_equal(2, read_value_2);
}

full_buffer_cant_be_written_to :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(false, write_successful_2);
}

a_read_frees_up_capacity_for_another_write :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(true, write_successful_2);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(true, read_successful_2);
    assert_equal(2, read_value_2);
}

read_position_is_maintained_even_across_multiple_writes :: () {
    CAPACITY :: 3;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(true, write_successful_2);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
    write_successful_3 := write(*circular_buffer, 3);
    assert_equal(true, write_successful_3);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(true, read_successful_2);
    assert_equal(2, read_value_2);
    read_successful_3, read_value_3 := read(*circular_buffer);
    assert_equal(true, read_successful_3);
    assert_equal(3, read_value_3);
}

items_cleared_out_of_buffer_cant_be_read :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    clear(*circular_buffer);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(false, read_successful_1);
}

clear_frees_up_capacity_for_another_write :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    clear(*circular_buffer);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(true, write_successful_2);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(2, read_value_1);
}

clear_does_nothing_on_empty_buffer :: () {
    CAPACITY :: 1;
    circular_buffer := new_circular_buffer(CAPACITY);
    clear(*circular_buffer);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
}

overwrite_acts_like_write_on_nonfull_buffer :: () {
    CAPACITY :: 2;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    overwrite(*circular_buffer, 2);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(true, read_successful_2);
    assert_equal(2, read_value_2);
}

overwrite_replaces_the_oldest_item_on_full_buffer :: () {
    CAPACITY :: 2;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(true, write_successful_2);
    overwrite(*circular_buffer, 3);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(2, read_value_1);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(true, read_successful_2);
    assert_equal(3, read_value_2);
}

overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read :: () {
    CAPACITY :: 3;
    circular_buffer := new_circular_buffer(CAPACITY);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(true, write_successful_2);
    write_successful_3 := write(*circular_buffer, 3);
    assert_equal(true, write_successful_3);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(1, read_value_1);
    write_successful_4 := write(*circular_buffer, 4);
    assert_equal(true, write_successful_4);
    overwrite(*circular_buffer, 5);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(true, read_successful_2);
    assert_equal(3, read_value_2);
    read_successful_3, read_value_3 := read(*circular_buffer);
    assert_equal(true, read_successful_3);
    assert_equal(4, read_value_3);
    read_successful_4, read_value_4 := read(*circular_buffer);
    assert_equal(true, read_successful_4);
    assert_equal(5, read_value_4);
}

initial_clear_does_not_affect_wrapping_around :: () {
    CAPACITY :: 2;
    circular_buffer := new_circular_buffer(CAPACITY);
    clear(*circular_buffer);
    write_successful_1 := write(*circular_buffer, 1);
    assert_equal(true, write_successful_1);
    write_successful_2 := write(*circular_buffer, 2);
    assert_equal(true, write_successful_2);
    overwrite(*circular_buffer, 3);
    overwrite(*circular_buffer, 4);
    read_successful_1, read_value_1 := read(*circular_buffer);
    assert_equal(true, read_successful_1);
    assert_equal(3, read_value_1);
    read_successful_2, read_value_2 := read(*circular_buffer);
    assert_equal(true, read_successful_2);
    assert_equal(4, read_value_2);
    read_successful_3, read_value_3 := read(*circular_buffer);
    assert_equal(false, read_successful_3);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
