run_tests :: () {
    verse_first_day_a_partridge_in_a_pear_tree();
    skip(verse_second_day_two_turtle_doves());
    skip(verse_third_day_three_french_hens());
    skip(verse_fourth_day_four_calling_birds());
    skip(verse_fifth_day_five_gold_rings());
    skip(verse_sixth_day_six_geesealaying());
    skip(verse_seventh_day_seven_swansaswimming());
    skip(verse_eighth_day_eight_maidsamilking());
    skip(verse_ninth_day_nine_ladies_dancing());
    skip(verse_tenth_day_ten_lordsaleaping());
    skip(verse_eleventh_day_eleven_pipers_piping());
    skip(verse_twelfth_day_twelve_drummers_drumming());
    skip(lyrics_recites_first_three_verses_of_the_song());
    skip(lyrics_recites_three_verses_from_the_middle_of_the_song());
    skip(lyrics_recites_the_whole_song());
}

verse_first_day_a_partridge_in_a_pear_tree :: () {
    EXPECTED :: #string DONE
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(1, 1));
}

verse_second_day_two_turtle_doves :: () {
    EXPECTED :: #string DONE
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(2, 2));
}

verse_third_day_three_french_hens :: () {
    EXPECTED :: #string DONE
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(3, 3));
}

verse_fourth_day_four_calling_birds :: () {
    EXPECTED :: #string DONE
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(4, 4));
}

verse_fifth_day_five_gold_rings :: () {
    EXPECTED :: #string DONE
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(5, 5));
}

verse_sixth_day_six_geesealaying :: () {
    EXPECTED :: #string DONE
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(6, 6));
}

verse_seventh_day_seven_swansaswimming :: () {
    EXPECTED :: #string DONE
On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(7, 7));
}

verse_eighth_day_eight_maidsamilking :: () {
    EXPECTED :: #string DONE
On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(8, 8));
}

verse_ninth_day_nine_ladies_dancing :: () {
    EXPECTED :: #string DONE
On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(9, 9));
}

verse_tenth_day_ten_lordsaleaping :: () {
    EXPECTED :: #string DONE
On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(10, 10));
}

verse_eleventh_day_eleven_pipers_piping :: () {
    EXPECTED :: #string DONE
On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(11, 11));
}

verse_twelfth_day_twelve_drummers_drumming :: () {
    EXPECTED :: #string DONE
On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(12, 12));
}

lyrics_recites_first_three_verses_of_the_song :: () {
    EXPECTED :: #string DONE
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(1, 3));
}

lyrics_recites_three_verses_from_the_middle_of_the_song :: () {
    EXPECTED :: #string DONE
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(4, 6));
}

lyrics_recites_the_whole_song :: () {
    EXPECTED :: #string DONE
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
DONE
    assert_equal(EXPECTED, recite(1, 12));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
