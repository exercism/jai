#run {
    no_name_given();
    skip(a_name_given());
    skip(another_name_given());
}

no_name_given :: () {
    assert_equal("One for you, one for me.", two_fer(""));
}

a_name_given :: () {
    assert_equal("One for Alice, one for me.", two_fer("Alice"));
}

another_name_given :: () {
    assert_equal("One for Bob, one for me.", two_fer("Bob"));
}

#run {
    finished_running_tests();
}

#load "solution.jai";
#load "extest.jai";
