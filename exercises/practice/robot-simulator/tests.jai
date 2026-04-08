run_tests :: () {
    create_robot_at_origin_facing_north();
    skip(create_robot_at_negative_position_facing_south());
    skip(rotating_clockwise_changes_north_to_east());
    skip(rotating_clockwise_changes_east_to_south());
    skip(rotating_clockwise_changes_south_to_west());
    skip(rotating_clockwise_changes_west_to_north());
    skip(rotating_counterclockwise_changes_north_to_west());
    skip(rotating_counterclockwise_changes_west_to_south());
    skip(rotating_counterclockwise_changes_south_to_east());
    skip(rotating_counterclockwise_changes_east_to_north());
    skip(moving_forward_one_facing_north_increments_y());
    skip(moving_forward_one_facing_south_decrements_y());
    skip(moving_forward_one_facing_east_increments_x());
    skip(moving_forward_one_facing_west_decrements_x());
    skip(follow_series_of_instructions_moving_east_and_north_from_r_e_a_d_m_e());
    skip(follow_series_of_instructions_moving_west_and_north());
    skip(follow_series_of_instructions_moving_west_and_south());
    skip(follow_series_of_instructions_moving_east_and_north());
}

create_robot_at_origin_facing_north :: () {
    robot := create(0, 0, .NORTH);
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.NORTH, robot.direction);
}

create_robot_at_negative_position_facing_south :: () {
    robot := create(-1, -1, .SOUTH);
    assert_equal(-1, robot.x);
    assert_equal(-1, robot.y);
    assert_equal(Direction.SOUTH, robot.direction);
}

rotating_clockwise_changes_north_to_east :: () {
    robot := create(0, 0, .NORTH);
    move(*robot, "R");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.EAST, robot.direction);
}

rotating_clockwise_changes_east_to_south :: () {
    robot := create(0, 0, .EAST);
    move(*robot, "R");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.SOUTH, robot.direction);
}

rotating_clockwise_changes_south_to_west :: () {
    robot := create(0, 0, .SOUTH);
    move(*robot, "R");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.WEST, robot.direction);
}

rotating_clockwise_changes_west_to_north :: () {
    robot := create(0, 0, .WEST);
    move(*robot, "R");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.NORTH, robot.direction);
}

rotating_counterclockwise_changes_north_to_west :: () {
    robot := create(0, 0, .NORTH);
    move(*robot, "L");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.WEST, robot.direction);
}

rotating_counterclockwise_changes_west_to_south :: () {
    robot := create(0, 0, .WEST);
    move(*robot, "L");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.SOUTH, robot.direction);
}

rotating_counterclockwise_changes_south_to_east :: () {
    robot := create(0, 0, .SOUTH);
    move(*robot, "L");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.EAST, robot.direction);
}

rotating_counterclockwise_changes_east_to_north :: () {
    robot := create(0, 0, .EAST);
    move(*robot, "L");
    assert_equal(0, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.NORTH, robot.direction);
}

moving_forward_one_facing_north_increments_y :: () {
    robot := create(0, 0, .NORTH);
    move(*robot, "A");
    assert_equal(0, robot.x);
    assert_equal(1, robot.y);
    assert_equal(Direction.NORTH, robot.direction);
}

moving_forward_one_facing_south_decrements_y :: () {
    robot := create(0, 0, .SOUTH);
    move(*robot, "A");
    assert_equal(0, robot.x);
    assert_equal(-1, robot.y);
    assert_equal(Direction.SOUTH, robot.direction);
}

moving_forward_one_facing_east_increments_x :: () {
    robot := create(0, 0, .EAST);
    move(*robot, "A");
    assert_equal(1, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.EAST, robot.direction);
}

moving_forward_one_facing_west_decrements_x :: () {
    robot := create(0, 0, .WEST);
    move(*robot, "A");
    assert_equal(-1, robot.x);
    assert_equal(0, robot.y);
    assert_equal(Direction.WEST, robot.direction);
}

follow_series_of_instructions_moving_east_and_north_from_r_e_a_d_m_e :: () {
    robot := create(7, 3, .NORTH);
    move(*robot, "RAALAL");
    assert_equal(9, robot.x);
    assert_equal(4, robot.y);
    assert_equal(Direction.WEST, robot.direction);
}

follow_series_of_instructions_moving_west_and_north :: () {
    robot := create(0, 0, .NORTH);
    move(*robot, "LAAARALA");
    assert_equal(-4, robot.x);
    assert_equal(1, robot.y);
    assert_equal(Direction.WEST, robot.direction);
}

follow_series_of_instructions_moving_west_and_south :: () {
    robot := create(2, -7, .EAST);
    move(*robot, "RRAAAAALA");
    assert_equal(-3, robot.x);
    assert_equal(-8, robot.y);
    assert_equal(Direction.SOUTH, robot.direction);
}

follow_series_of_instructions_moving_east_and_north :: () {
    robot := create(8, 4, .SOUTH);
    move(*robot, "LAAARRRALLLL");
    assert_equal(11, robot.x);
    assert_equal(5, robot.y);
    assert_equal(Direction.NORTH, robot.direction);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
