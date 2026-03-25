    main :: () {
        true_test();
        false_test(skip = true);
        skipped_test(skip = true);
        finished_running_tests();
    }

    #run main();

    true_test :: (skip := false) {
        assert_equal(3, add(1, 2), skip);
    }

    false_test :: (skip := false) {
        assert_equal(2, add(3, 4), skip);
    }

    skipped_test :: (skip := false) {
        assert_equal(1, add(1, 1), skip);
    }

    #load "solution.jai";
    #load "extest.jai";
