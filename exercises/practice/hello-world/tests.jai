run_tests :: () {
    say_hi();
}

say_hi :: () {
    assert_equal("Hello, World!", hello());
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
