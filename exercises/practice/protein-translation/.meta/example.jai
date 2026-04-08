to_proteins :: (strand: string) -> bool, []string {
    if strand.count == 0 return true, .[];

    translated_proteins: [..]string;

    i: int;
    while i < strand.count {
        codon := slice(strand, i, 3);
        
        if codon == {
            case "AUG"; array_add(*translated_proteins, "Methionine");
            case "UUU"; #through;
            case "UUC"; array_add(*translated_proteins, "Phenylalanine");
            case "UUA"; #through;
            case "UUG"; array_add(*translated_proteins, "Leucine");
            case "UCU"; #through;
            case "UCC"; #through;
            case "UCA"; #through;
            case "UCG"; array_add(*translated_proteins, "Serine");
            case "UAU"; #through;
            case "UAC"; array_add(*translated_proteins, "Tyrosine");
            case "UGU"; #through;
            case "UGC"; array_add(*translated_proteins, "Cysteine");
            case "UGG"; array_add(*translated_proteins, "Tryptophan");
            case "UAA"; #through;
            case "UAG"; #through;
            case "UGA"; break;
            case; return false, .[];
        }

        i += 3;
    }

    return true, translated_proteins;
}

#import "String";
#import "Math";
