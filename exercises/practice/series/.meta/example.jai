to_slices :: (series: string, slice_length: int) -> bool, []string {
    if slice_length <= 0 || slice_length > series.count {
        return false, string.[];
    }

    slices: [..] string;
    for 0 .. series.count-slice_length {
        array_add(*slices, slice(series, it, slice_length));
    }

    return true, slices;
}

#import "String";
