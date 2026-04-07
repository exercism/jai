convert :: (number: int) -> string {
    builder: String_Builder;
    init_string_builder(*builder);

    if number % 3 == 0 print_to_builder(*builder, "Pling");
    if number % 5 == 0 print_to_builder(*builder, "Plang");
    if number % 7 == 0 print_to_builder(*builder, "Plong");

    if builder_string_length(*builder) > 0 {
        return builder_to_string(*builder);
    }

    return tprint("%", number);
}

#import "String";
