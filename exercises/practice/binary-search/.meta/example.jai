binary_search :: (array: []int, value: int) -> bool, int {
    left := 0;
    right := array.count - 1;

    while left <= right {
        middle := left + (right - left) / 2;

        if array[middle] == value {
            return true, middle;
        } else if array[middle] < value {
            left = middle + 1;
        } else {
            right = middle - 1;
        }
    }

    return false, -1;
}
