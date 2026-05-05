run_tests :: () {
    root_of_1();
    skip(root_of_4());
    skip(root_of_25());
    skip(root_of_81());
    skip(root_of_196());
    skip(root_of_65025());
}

root_of_1 :: () {
    assert_equal(1, square_root(1));
}

root_of_4 :: () {
    assert_equal(2, square_root(4));
}

root_of_25 :: () {
    assert_equal(5, square_root(25));
}

root_of_81 :: () {
    assert_equal(9, square_root(81));
}

root_of_196 :: () {
    assert_equal(14, square_root(196));
}

root_of_65025 :: () {
    assert_equal(255, square_root(65025));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
