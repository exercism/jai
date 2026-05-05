to_rna :: (dna: string) -> string {
    rna := copy_string(dna);

    for * rna {
        if it.* == {
            case #char "C"; it.* = #char "G";
            case #char "G"; it.* = #char "C";
            case #char "T"; it.* = #char "A";
            case #char "A"; it.* = #char "U";
        }
    }

    return rna;
}
