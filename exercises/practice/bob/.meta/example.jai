response :: (hey_bob: string) -> string {
    if is_shout(hey_bob) && is_question(hey_bob)  return "Calm down, I know what I'm doing!";
    if is_shout(hey_bob)    return "Whoa, chill out!";
    if is_question(hey_bob) return "Sure.";
    if is_silent(hey_bob)   return "Fine. Be that way!";

    return "Whatever.";
}

is_silent :: inline (s: string) -> bool {
    return trim(s) == "";
}

is_question :: inline (s: string) -> bool {
    return ends_with(trim(s), "?");
}

is_shout :: inline (s: string) -> bool {
    has_letters := false;

    for s {
        if it >= #char "a" && it <= #char "z"  return false;
        if it >= #char "A" && it <= #char "Z"  has_letters = true;
    }

    return has_letters;
}

#import "String";
