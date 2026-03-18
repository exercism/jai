NumeralThreshold :: struct {
    value:   int;
    numeral: string;
}

NUMERAL_THRESHOLDS :: NumeralThreshold.[
    {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"},
    {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"},
    {5, "V"}, {4, "IV"}, {1, "I"}
];

roman_numerals :: () -> [4000] string {
    numerals : [4000] string;

    roman_builder: String_Builder;
    init_string_builder(*roman_builder);

    for number: 1..3999 {
        remainder := number;

        for threshold: NUMERAL_THRESHOLDS {
            while remainder / threshold.value > 0 {
                remainder -= threshold.value;
                append(*roman_builder, threshold.numeral);
            }
        }

        numerals[number] = builder_to_string(*roman_builder, do_reset = true);
    }

    return numerals;
}

to_roman :: (number: int) -> string {
    // Precompute the Roman numeral representations for all numbers from 1 to 3999.
    ROMAN_NUMERALS :: #run roman_numerals();

    return ROMAN_NUMERALS[number];
}
