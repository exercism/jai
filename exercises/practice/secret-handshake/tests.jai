run_tests :: () {
    wink_for_1();
    skip(double_blink_for_10());
    skip(close_your_eyes_for_100());
    skip(jump_for_1000());
    skip(combine_two_actions());
    skip(reverse_two_actions());
    skip(reversing_one_action_gives_the_same_action());
    skip(reversing_no_actions_still_gives_no_actions());
    skip(all_possible_actions());
    skip(reverse_all_possible_actions());
    skip(do_nothing_for_zero());
}

wink_for_1 :: () {
    commands := decode_commands(1);
    assert_equal(1, commands.count);
    assert_equal("wink", commands[0]);
}

double_blink_for_10 :: () {
    commands := decode_commands(2);
    assert_equal(1, commands.count);
    assert_equal("double blink", commands[0]);
}

close_your_eyes_for_100 :: () {
    commands := decode_commands(4);
    assert_equal(1, commands.count);
    assert_equal("close your eyes", commands[0]);
}

jump_for_1000 :: () {
    commands := decode_commands(8);
    assert_equal(1, commands.count);
    assert_equal("jump", commands[0]);
}

combine_two_actions :: () {
    commands := decode_commands(3);
    assert_equal(2, commands.count);
    assert_equal("wink", commands[0]);
    assert_equal("double blink", commands[1]);
}

reverse_two_actions :: () {
    commands := decode_commands(19);
    assert_equal(2, commands.count);
    assert_equal("double blink", commands[0]);
    assert_equal("wink", commands[1]);
}

reversing_one_action_gives_the_same_action :: () {
    commands := decode_commands(24);
    assert_equal(1, commands.count);
    assert_equal("jump", commands[0]);
}

reversing_no_actions_still_gives_no_actions :: () {
    commands := decode_commands(16);
    assert_equal(0, commands.count);
}

all_possible_actions :: () {
    commands := decode_commands(15);
    assert_equal(4, commands.count);
    assert_equal("wink", commands[0]);
    assert_equal("double blink", commands[1]);
    assert_equal("close your eyes", commands[2]);
    assert_equal("jump", commands[3]);
}

reverse_all_possible_actions :: () {
    commands := decode_commands(31);
    assert_equal(4, commands.count);
    assert_equal("jump", commands[0]);
    assert_equal("close your eyes", commands[1]);
    assert_equal("double blink", commands[2]);
    assert_equal("wink", commands[3]);
}

do_nothing_for_zero :: () {
    commands := decode_commands(0);
    assert_equal(0, commands.count);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
