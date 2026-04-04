reverse_string :: (value: string) -> string {
    builder: String_Builder;
    init_string_builder(*builder, value.count);

    for <=true value  append(*builder, it);

    return builder_to_string(*builder);
}
