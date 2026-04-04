hamming_distance :: (strand1: string, strand2: string) -> bool, int {
    if strand1.count != strand2.count  return false, 0;

    distance := 0;
    for i: 0..strand1.count - 1 {
        if strand1[i] == strand2[i]  continue;

        distance += 1;
    }

    return true, distance;
}
