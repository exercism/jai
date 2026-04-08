Classification :: enum {
    PERFECT;
    ABUNDANT;
    DEFICIENT;
};

classify :: (number: int) -> Classification {
    if number == 1 return Classification.DEFICIENT;

    aliquot_sum := 1;

    for divisor: 2..cast(int) sqrt(cast(float)number) {
        if number % divisor != 0 continue;

        aliquot_sum += divisor;

        // We've found a divisor, which means there must also be a paired divisor.
        // If the paired divisor is different from the divisor, add it to the sum as well.
        paired_divisor := number / divisor;
        if paired_divisor != divisor aliquot_sum += paired_divisor;

        if aliquot_sum > number return Classification.ABUNDANT;
    }

    return ifx number == aliquot_sum then Classification.PERFECT else Classification.DEFICIENT;
}

#import "Math";
