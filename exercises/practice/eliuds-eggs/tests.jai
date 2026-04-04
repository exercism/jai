#run {
    count_0_eggs();
    skip(count_1_egg());
    skip(count_4_eggs());
    skip(count_13_eggs());
}

count_0_eggs :: () {
    assert_equal(0, egg_count(0));
}

count_1_egg :: () {
    assert_equal(1, egg_count(16));
}

count_4_eggs :: () {
    assert_equal(4, egg_count(89));
}

count_13_eggs :: () {
    assert_equal(13, egg_count(2000000000));
}

#run {
    finished_running_tests();
}

#load "solution.jai";
#load "extest.jai";
