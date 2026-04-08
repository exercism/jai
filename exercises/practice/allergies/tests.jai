run_tests :: () {
    testing_for_eggs_allergy_not_allergic_to_anything();
    skip(testing_for_eggs_allergy_allergic_only_to_eggs());
    skip(testing_for_eggs_allergy_allergic_to_eggs_and_something_else());
    skip(testing_for_eggs_allergy_allergic_to_something_but_not_eggs());
    skip(testing_for_eggs_allergy_allergic_to_everything());
    skip(testing_for_peanuts_allergy_not_allergic_to_anything());
    skip(testing_for_peanuts_allergy_allergic_only_to_peanuts());
    skip(testing_for_peanuts_allergy_allergic_to_peanuts_and_something_else());
    skip(testing_for_peanuts_allergy_allergic_to_something_but_not_peanuts());
    skip(testing_for_peanuts_allergy_allergic_to_everything());
    skip(testing_for_shellfish_allergy_not_allergic_to_anything());
    skip(testing_for_shellfish_allergy_allergic_only_to_shellfish());
    skip(testing_for_shellfish_allergy_allergic_to_shellfish_and_something_else());
    skip(testing_for_shellfish_allergy_allergic_to_something_but_not_shellfish());
    skip(testing_for_shellfish_allergy_allergic_to_everything());
    skip(testing_for_strawberries_allergy_not_allergic_to_anything());
    skip(testing_for_strawberries_allergy_allergic_only_to_strawberries());
    skip(testing_for_strawberries_allergy_allergic_to_strawberries_and_something_else());
    skip(testing_for_strawberries_allergy_allergic_to_something_but_not_strawberries());
    skip(testing_for_strawberries_allergy_allergic_to_everything());
    skip(testing_for_tomatoes_allergy_not_allergic_to_anything());
    skip(testing_for_tomatoes_allergy_allergic_only_to_tomatoes());
    skip(testing_for_tomatoes_allergy_allergic_to_tomatoes_and_something_else());
    skip(testing_for_tomatoes_allergy_allergic_to_something_but_not_tomatoes());
    skip(testing_for_tomatoes_allergy_allergic_to_everything());
    skip(testing_for_chocolate_allergy_not_allergic_to_anything());
    skip(testing_for_chocolate_allergy_allergic_only_to_chocolate());
    skip(testing_for_chocolate_allergy_allergic_to_chocolate_and_something_else());
    skip(testing_for_chocolate_allergy_allergic_to_something_but_not_chocolate());
    skip(testing_for_chocolate_allergy_allergic_to_everything());
    skip(testing_for_pollen_allergy_not_allergic_to_anything());
    skip(testing_for_pollen_allergy_allergic_only_to_pollen());
    skip(testing_for_pollen_allergy_allergic_to_pollen_and_something_else());
    skip(testing_for_pollen_allergy_allergic_to_something_but_not_pollen());
    skip(testing_for_pollen_allergy_allergic_to_everything());
    skip(testing_for_cats_allergy_not_allergic_to_anything());
    skip(testing_for_cats_allergy_allergic_only_to_cats());
    skip(testing_for_cats_allergy_allergic_to_cats_and_something_else());
    skip(testing_for_cats_allergy_allergic_to_something_but_not_cats());
    skip(testing_for_cats_allergy_allergic_to_everything());
    skip(list_when_no_allergies());
    skip(list_when_just_eggs());
    skip(list_when_just_peanuts());
    skip(list_when_just_strawberries());
    skip(list_when_eggs_and_peanuts());
    skip(list_when_more_than_eggs_but_not_peanuts());
    skip(list_when_lots_of_stuff());
    skip(list_when_everything());
    skip(list_when_no_allergen_score_parts());
    skip(list_when_no_allergen_score_parts_without_highest_valid_score());
}

testing_for_eggs_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.EGGS, 0));
}

testing_for_eggs_allergy_allergic_only_to_eggs :: () {
    assert_equal(true, is_allergic_to(.EGGS, 1));
}

testing_for_eggs_allergy_allergic_to_eggs_and_something_else :: () {
    assert_equal(true, is_allergic_to(.EGGS, 3));
}

testing_for_eggs_allergy_allergic_to_something_but_not_eggs :: () {
    assert_equal(false, is_allergic_to(.EGGS, 2));
}

testing_for_eggs_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.EGGS, 255));
}

testing_for_peanuts_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.PEANUTS, 0));
}

testing_for_peanuts_allergy_allergic_only_to_peanuts :: () {
    assert_equal(true, is_allergic_to(.PEANUTS, 2));
}

testing_for_peanuts_allergy_allergic_to_peanuts_and_something_else :: () {
    assert_equal(true, is_allergic_to(.PEANUTS, 7));
}

testing_for_peanuts_allergy_allergic_to_something_but_not_peanuts :: () {
    assert_equal(false, is_allergic_to(.PEANUTS, 5));
}

testing_for_peanuts_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.PEANUTS, 255));
}

testing_for_shellfish_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.SHELLFISH, 0));
}

testing_for_shellfish_allergy_allergic_only_to_shellfish :: () {
    assert_equal(true, is_allergic_to(.SHELLFISH, 4));
}

testing_for_shellfish_allergy_allergic_to_shellfish_and_something_else :: () {
    assert_equal(true, is_allergic_to(.SHELLFISH, 14));
}

testing_for_shellfish_allergy_allergic_to_something_but_not_shellfish :: () {
    assert_equal(false, is_allergic_to(.SHELLFISH, 10));
}

testing_for_shellfish_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.SHELLFISH, 255));
}

testing_for_strawberries_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.STRAWBERRIES, 0));
}

testing_for_strawberries_allergy_allergic_only_to_strawberries :: () {
    assert_equal(true, is_allergic_to(.STRAWBERRIES, 8));
}

testing_for_strawberries_allergy_allergic_to_strawberries_and_something_else :: () {
    assert_equal(true, is_allergic_to(.STRAWBERRIES, 28));
}

testing_for_strawberries_allergy_allergic_to_something_but_not_strawberries :: () {
    assert_equal(false, is_allergic_to(.STRAWBERRIES, 20));
}

testing_for_strawberries_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.STRAWBERRIES, 255));
}

testing_for_tomatoes_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.TOMATOES, 0));
}

testing_for_tomatoes_allergy_allergic_only_to_tomatoes :: () {
    assert_equal(true, is_allergic_to(.TOMATOES, 16));
}

testing_for_tomatoes_allergy_allergic_to_tomatoes_and_something_else :: () {
    assert_equal(true, is_allergic_to(.TOMATOES, 56));
}

testing_for_tomatoes_allergy_allergic_to_something_but_not_tomatoes :: () {
    assert_equal(false, is_allergic_to(.TOMATOES, 40));
}

testing_for_tomatoes_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.TOMATOES, 255));
}

testing_for_chocolate_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.CHOCOLATE, 0));
}

testing_for_chocolate_allergy_allergic_only_to_chocolate :: () {
    assert_equal(true, is_allergic_to(.CHOCOLATE, 32));
}

testing_for_chocolate_allergy_allergic_to_chocolate_and_something_else :: () {
    assert_equal(true, is_allergic_to(.CHOCOLATE, 112));
}

testing_for_chocolate_allergy_allergic_to_something_but_not_chocolate :: () {
    assert_equal(false, is_allergic_to(.CHOCOLATE, 80));
}

testing_for_chocolate_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.CHOCOLATE, 255));
}

testing_for_pollen_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.POLLEN, 0));
}

testing_for_pollen_allergy_allergic_only_to_pollen :: () {
    assert_equal(true, is_allergic_to(.POLLEN, 64));
}

testing_for_pollen_allergy_allergic_to_pollen_and_something_else :: () {
    assert_equal(true, is_allergic_to(.POLLEN, 224));
}

testing_for_pollen_allergy_allergic_to_something_but_not_pollen :: () {
    assert_equal(false, is_allergic_to(.POLLEN, 160));
}

testing_for_pollen_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.POLLEN, 255));
}

testing_for_cats_allergy_not_allergic_to_anything :: () {
    assert_equal(false, is_allergic_to(.CATS, 0));
}

testing_for_cats_allergy_allergic_only_to_cats :: () {
    assert_equal(true, is_allergic_to(.CATS, 128));
}

testing_for_cats_allergy_allergic_to_cats_and_something_else :: () {
    assert_equal(true, is_allergic_to(.CATS, 192));
}

testing_for_cats_allergy_allergic_to_something_but_not_cats :: () {
    assert_equal(false, is_allergic_to(.CATS, 64));
}

testing_for_cats_allergy_allergic_to_everything :: () {
    assert_equal(true, is_allergic_to(.CATS, 255));
}

list_when_no_allergies :: () {
    allergens := list(0);
    assert_equal(0, allergens.count);
}

list_when_just_eggs :: () {
    allergens := list(1);
    assert_equal(1, allergens.count);
    assert_equal(Allergen.EGGS, allergens[0]);
}

list_when_just_peanuts :: () {
    allergens := list(2);
    assert_equal(1, allergens.count);
    assert_equal(Allergen.PEANUTS, allergens[0]);
}

list_when_just_strawberries :: () {
    allergens := list(8);
    assert_equal(1, allergens.count);
    assert_equal(Allergen.STRAWBERRIES, allergens[0]);
}

list_when_eggs_and_peanuts :: () {
    allergens := list(3);
    assert_equal(2, allergens.count);
    assert_equal(Allergen.EGGS, allergens[0]);
    assert_equal(Allergen.PEANUTS, allergens[1]);
}

list_when_more_than_eggs_but_not_peanuts :: () {
    allergens := list(5);
    assert_equal(2, allergens.count);
    assert_equal(Allergen.EGGS, allergens[0]);
    assert_equal(Allergen.SHELLFISH, allergens[1]);
}

list_when_lots_of_stuff :: () {
    allergens := list(248);
    assert_equal(5, allergens.count);
    assert_equal(Allergen.STRAWBERRIES, allergens[0]);
    assert_equal(Allergen.TOMATOES, allergens[1]);
    assert_equal(Allergen.CHOCOLATE, allergens[2]);
    assert_equal(Allergen.POLLEN, allergens[3]);
    assert_equal(Allergen.CATS, allergens[4]);
}

list_when_everything :: () {
    allergens := list(255);
    assert_equal(8, allergens.count);
    assert_equal(Allergen.EGGS, allergens[0]);
    assert_equal(Allergen.PEANUTS, allergens[1]);
    assert_equal(Allergen.SHELLFISH, allergens[2]);
    assert_equal(Allergen.STRAWBERRIES, allergens[3]);
    assert_equal(Allergen.TOMATOES, allergens[4]);
    assert_equal(Allergen.CHOCOLATE, allergens[5]);
    assert_equal(Allergen.POLLEN, allergens[6]);
    assert_equal(Allergen.CATS, allergens[7]);
}

list_when_no_allergen_score_parts :: () {
    allergens := list(509);
    assert_equal(7, allergens.count);
    assert_equal(Allergen.EGGS, allergens[0]);
    assert_equal(Allergen.SHELLFISH, allergens[1]);
    assert_equal(Allergen.STRAWBERRIES, allergens[2]);
    assert_equal(Allergen.TOMATOES, allergens[3]);
    assert_equal(Allergen.CHOCOLATE, allergens[4]);
    assert_equal(Allergen.POLLEN, allergens[5]);
    assert_equal(Allergen.CATS, allergens[6]);
}

list_when_no_allergen_score_parts_without_highest_valid_score :: () {
    allergens := list(257);
    assert_equal(1, allergens.count);
    assert_equal(Allergen.EGGS, allergens[0]);
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
