#run {
    say_hi();
}

say_hi :: () {
    assert_equal("Hello, World!", hello());
}

#run {
    finished_running_tests();
}

#load "solution.jai";
#load "extest.jai";
