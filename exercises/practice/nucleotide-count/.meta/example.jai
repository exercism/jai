NucleotideCounts :: struct {
    A: int;
    C: int;
    G: int;
    T: int;
}

nucleotide_counts :: (strand: string) -> bool, NucleotideCounts {
    counts: NucleotideCounts;

    for strand {
        if it == {
            case #char "A"; counts.A += 1;
            case #char "C"; counts.C += 1;
            case #char "G"; counts.G += 1;
            case #char "T"; counts.T += 1;
            case; return false, counts;
        }
    }

    return true, counts;
}
