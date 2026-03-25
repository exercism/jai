main :: () {
    run_test(true_test());
    run_test(false_test(), skip = true);
    run_test(skipped_test(), skip = true);
    finished_running_tests();
}

#run main();

true_test :: () {
    assert_equal(3, add(1, 2));
}

false_test :: () {
    assert_equal(2, add(3, 4));
}

skipped_test :: () {
    assert_equal(1, add(1, 1));
}

#load "solution.jai";
#load "extest.jai";
