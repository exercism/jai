run_tests :: () {
    verse_one_the_house_that_jack_built();
    skip(verse_two_the_malt_that_lay());
    skip(verse_three_the_rat_that_ate());
    skip(verse_four_the_cat_that_killed());
    skip(verse_five_the_dog_that_worried());
    skip(verse_six_the_cow_with_the_crumpled_horn());
    skip(verse_seven_the_maiden_all_forlorn());
    skip(verse_eight_the_man_all_tattered_and_torn());
    skip(verse_nine_the_priest_all_shaven_and_shorn());
    skip(verse_10_the_rooster_that_crowed_in_the_morn());
    skip(verse_11_the_farmer_sowing_his_corn());
    skip(verse_12_the_horse_and_the_hound_and_the_horn());
    skip(multiple_verses());
    skip(full_rhyme());
}

verse_one_the_house_that_jack_built :: () {
    EXPECTED :: #string DONE
This is the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(1, 1));
}

verse_two_the_malt_that_lay :: () {
    EXPECTED :: #string DONE
This is the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(2, 2));
}

verse_three_the_rat_that_ate :: () {
    EXPECTED :: #string DONE
This is the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(3, 3));
}

verse_four_the_cat_that_killed :: () {
    EXPECTED :: #string DONE
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(4, 4));
}

verse_five_the_dog_that_worried :: () {
    EXPECTED :: #string DONE
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(5, 5));
}

verse_six_the_cow_with_the_crumpled_horn :: () {
    EXPECTED :: #string DONE
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(6, 6));
}

verse_seven_the_maiden_all_forlorn :: () {
    EXPECTED :: #string DONE
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(7, 7));
}

verse_eight_the_man_all_tattered_and_torn :: () {
    EXPECTED :: #string DONE
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(8, 8));
}

verse_nine_the_priest_all_shaven_and_shorn :: () {
    EXPECTED :: #string DONE
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(9, 9));
}

verse_10_the_rooster_that_crowed_in_the_morn :: () {
    EXPECTED :: #string DONE
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(10, 10));
}

verse_11_the_farmer_sowing_his_corn :: () {
    EXPECTED :: #string DONE
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(11, 11));
}

verse_12_the_horse_and_the_hound_and_the_horn :: () {
    EXPECTED :: #string DONE
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(12, 12));
}

multiple_verses :: () {
    EXPECTED :: #string DONE
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
DONE
    assert_equal(EXPECTED, recite(4, 8));
}

full_rhyme :: () {
    EXPECTED :: #string DONE
This is the house that Jack built.
This is the malt that lay in the house that Jack built.
This is the rat that ate the malt that lay in the house that Jack built.
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
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
