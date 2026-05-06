run_tests :: () {
    zero_pieces();
    skip(one_piece());
    skip(two_pieces());
    skip(three_pieces());
    skip(full_proverb());
    skip(four_pieces_modernized());
}

zero_pieces :: () {
    EXPECTED :: #string DONE
DONE
    assert_equal(EXPECTED, recite(.[]));
}

one_piece :: () {
    EXPECTED :: #string DONE
And all for the want of a nail.
DONE
    assert_equal(EXPECTED, recite(.["nail"]));
}

two_pieces :: () {
    EXPECTED :: #string DONE
For want of a nail the shoe was lost.
And all for the want of a nail.
DONE
    assert_equal(EXPECTED, recite(.["nail", "shoe"]));
}

three_pieces :: () {
    EXPECTED :: #string DONE
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
DONE
    assert_equal(EXPECTED, recite(.["nail", "shoe", "horse"]));
}

full_proverb :: () {
    EXPECTED :: #string DONE
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
DONE
    assert_equal(EXPECTED, recite(.["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]));
}

four_pieces_modernized :: () {
    EXPECTED :: #string DONE
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
DONE
    assert_equal(EXPECTED, recite(.["pin", "gun", "soldier", "battle"]));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
