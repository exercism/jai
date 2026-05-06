recite :: (subjects: []string) -> string {
    if subjects.count == 0 return "";

    proverb: String_Builder;
    for 0 .. subjects.count - 2 {
        print_to_builder(*proverb, "For want of a % the % was lost.\n", subjects[it], subjects[it+1]);
    }
    print_to_builder(*proverb, "And all for the want of a %.\n", subjects[0]);

    return builder_to_string(*proverb);
}
