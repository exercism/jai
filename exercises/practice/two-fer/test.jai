#load "two_fer.jai";

#import "Basic";

main :: () {
    no_name_given();
    test_a_name_given();
    another_name_given();
}

no_name_given :: () {
	assert(two_fer() == "One for you, one for me.");
}

test_a_name_given :: () {
	assert(two_fer("Alice") == "One for Alice, one for me.");
}

another_name_given :: () {
	assert(two_fer("Bob") == "One for Bob, one for me.");
}