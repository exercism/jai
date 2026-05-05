primes_from_sieve :: (number: int) -> []int {
    if number < 2 return int.[];

    sieve := make_bit_array(number + 1);
    set_all_bits(*sieve);
    sieve[0] = false;
    sieve[1] = false;

    primes: [..]int;

    for i: 2..number {
        if !sieve[i] continue;

        array_add(*primes, i);

        j := i * 2;
        while j <= number {
            sieve[j] = false;
            j += i;
        }
    }

    return primes;
}

#import "Bit_Array";
