format :: (name: string, number: int) -> string {
    return tprint("%, you are the % customer we serve today. Thank you!", name, ordinal(number));
}

ordinal :: (n: int) -> string {
    if n % 10 == 1 && n % 100 != 11  return tprint("%st", n);
    if n % 10 == 2 && n % 100 != 12  return tprint("%nd", n);
    if n % 10 == 3 && n % 100 != 13  return tprint("%rd", n);

    return tprint("%th", n);
}
