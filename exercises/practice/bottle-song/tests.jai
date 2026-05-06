run_tests :: () {
    verse_single_verse_first_generic_verse();
    skip(verse_single_verse_last_generic_verse());
    skip(verse_single_verse_verse_with_2_bottles());
    skip(verse_single_verse_verse_with_1_bottle());
    skip(lyrics_multiple_verses_first_two_verses());
    skip(lyrics_multiple_verses_last_three_verses());
    skip(lyrics_multiple_verses_all_verses());
}

verse_single_verse_first_generic_verse :: () {
    EXPECTED :: #string DONE
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.
DONE
    assert_equal(EXPECTED, recite(10, 1));
}

verse_single_verse_last_generic_verse :: () {
    EXPECTED :: #string DONE
Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.
DONE
    assert_equal(EXPECTED, recite(3, 1));
}

verse_single_verse_verse_with_2_bottles :: () {
    EXPECTED :: #string DONE
Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.
DONE
    assert_equal(EXPECTED, recite(2, 1));
}

verse_single_verse_verse_with_1_bottle :: () {
    EXPECTED :: #string DONE
One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall.
DONE
    assert_equal(EXPECTED, recite(1, 1));
}

lyrics_multiple_verses_first_two_verses :: () {
    EXPECTED :: #string DONE
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.

Nine green bottles hanging on the wall,
Nine green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be eight green bottles hanging on the wall.
DONE
    assert_equal(EXPECTED, recite(10, 2));
}

lyrics_multiple_verses_last_three_verses :: () {
    EXPECTED :: #string DONE
Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.

Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.

One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall.
DONE
    assert_equal(EXPECTED, recite(3, 3));
}

lyrics_multiple_verses_all_verses :: () {
    EXPECTED :: #string DONE
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.

Nine green bottles hanging on the wall,
Nine green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be eight green bottles hanging on the wall.

Eight green bottles hanging on the wall,
Eight green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be seven green bottles hanging on the wall.

Seven green bottles hanging on the wall,
Seven green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be six green bottles hanging on the wall.

Six green bottles hanging on the wall,
Six green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be five green bottles hanging on the wall.

Five green bottles hanging on the wall,
Five green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be four green bottles hanging on the wall.

Four green bottles hanging on the wall,
Four green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be three green bottles hanging on the wall.

Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.

Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.

One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall.
DONE
    assert_equal(EXPECTED, recite(10, 10));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
