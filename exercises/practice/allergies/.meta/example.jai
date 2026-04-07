ALLERGEN :: enum u8 #specified {
    EGGS         :: 0b00000001;
    PEANUTS      :: 0b00000010;
    SHELLFISH    :: 0b00000100;
    STRAWBERRIES :: 0b00001000;
    TOMATOES     :: 0b00010000;
    CHOCOLATE    :: 0b00100000;
    POLLEN       :: 0b01000000;
    CATS         :: 0b10000000;
};

is_allergic_to :: (allergen: ALLERGEN, score: int) -> bool {
    return score & cast(u8)allergen != 0;
}

list :: (score: int) -> []ALLERGEN {
    allergies: [..]ALLERGEN;

    for enum_values_as_enum(ALLERGEN) {
        if is_allergic_to(it, score) array_add(*allergies, it);
    }

    return allergies;
}
