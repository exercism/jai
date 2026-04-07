run_tests :: () {
    stating_something();
    skip(shouting());
    skip(shouting_gibberish());
    skip(asking_a_question());
    skip(asking_a_numeric_question());
    skip(asking_gibberish());
    skip(talking_forcefully());
    skip(using_acronyms_in_regular_speech());
    skip(forceful_question());
    skip(shouting_numbers());
    skip(no_letters());
    skip(question_with_no_letters());
    skip(shouting_with_special_characters());
    skip(shouting_with_no_exclamation_mark());
    skip(statement_containing_question_mark());
    skip(nonletters_with_question());
    skip(prattling_on());
    skip(silence());
    skip(prolonged_silence());
    skip(alternate_silence());
    skip(starting_with_whitespace());
    skip(ending_with_whitespace());
    skip(other_whitespace());
    skip(nonquestion_ending_with_whitespace());
    skip(multiple_line_question());
}

stating_something :: () {
    assert_equal("Whatever.", response("Tom-ay-to, tom-aaaah-to."));
}

shouting :: () {
    assert_equal("Whoa, chill out!", response("WATCH OUT!"));
}

shouting_gibberish :: () {
    assert_equal("Whoa, chill out!", response("FCECDFCAAB"));
}

asking_a_question :: () {
    assert_equal("Sure.", response("Does this cryogenic chamber make me look fat?"));
}

asking_a_numeric_question :: () {
    assert_equal("Sure.", response("You are, what, like 15?"));
}

asking_gibberish :: () {
    assert_equal("Sure.", response("fffbbcbeab?"));
}

talking_forcefully :: () {
    assert_equal("Whatever.", response("Hi there!"));
}

using_acronyms_in_regular_speech :: () {
    assert_equal("Whatever.", response("It's OK if you don't want to go work for NASA."));
}

forceful_question :: () {
    assert_equal("Calm down, I know what I'm doing!", response("WHAT'S GOING ON?"));
}

shouting_numbers :: () {
    assert_equal("Whoa, chill out!", response("1, 2, 3 GO!"));
}

no_letters :: () {
    assert_equal("Whatever.", response("1, 2, 3"));
}

question_with_no_letters :: () {
    assert_equal("Sure.", response("4?"));
}

shouting_with_special_characters :: () {
    assert_equal("Whoa, chill out!", response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"));
}

shouting_with_no_exclamation_mark :: () {
    assert_equal("Whoa, chill out!", response("I HATE THE DENTIST"));
}

statement_containing_question_mark :: () {
    assert_equal("Whatever.", response("Ending with ? means a question."));
}

nonletters_with_question :: () {
    assert_equal("Sure.", response(":) ?"));
}

prattling_on :: () {
    assert_equal("Sure.", response("Wait! Hang on. Are you going to be OK?"));
}

silence :: () {
    assert_equal("Fine. Be that way!", response(""));
}

prolonged_silence :: () {
    assert_equal("Fine. Be that way!", response("          "));
}

alternate_silence :: () {
    assert_equal("Fine. Be that way!", response("\t\t\t\t\t\t\t\t\t\t"));
}

starting_with_whitespace :: () {
    assert_equal("Whatever.", response("         hmmmmmmm..."));
}

ending_with_whitespace :: () {
    assert_equal("Sure.", response("Okay if like my  spacebar  quite a bit?   "));
}

other_whitespace :: () {
    assert_equal("Fine. Be that way!", response("\n\r \t"));
}

nonquestion_ending_with_whitespace :: () {
    assert_equal("Whatever.", response("This is a statement ending with whitespace      "));
}

multiple_line_question :: () {
    assert_equal("Sure.", response("\nDoes this cryogenic chamber make\n me look fat?"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
