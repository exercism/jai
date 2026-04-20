// Unfortunately, there is a limitation right now, with the interaction of polymorph variables
// in the type slot, and parameter auto-bakes, which is that they need to all
// be solved in one step, thus they can't depend on each other in the same
// procedure declaration. We thus can't parameterize the Circular_Buffer type by the element type
// and its capacity, and instead have to hardcode them.

Circular_Buffer :: struct {
    data: [] int;
    read_index: int;
    write_index: int;
    count: int;
}

new_circular_buffer :: (capacity: int) -> Circular_Buffer {
    return Circular_Buffer.{ data = NewArray(capacity, int, initialized=true) };
}

read :: (circular_buffer: *Circular_Buffer) -> bool, int {
    if circular_buffer.count == 0 return false, 0;
    value := circular_buffer.data[circular_buffer.read_index];
    circular_buffer.read_index = (circular_buffer.read_index + 1) % circular_buffer.data.count;
    circular_buffer.count -= 1;
    return true, value;
}

write :: (circular_buffer: *Circular_Buffer, value: int) -> bool {
    if circular_buffer.count == circular_buffer.data.count return false;
    circular_buffer.data[circular_buffer.write_index] = value;
    circular_buffer.write_index = (circular_buffer.write_index + 1) % circular_buffer.data.count;
    circular_buffer.count += 1;
    return true;
}

clear :: (circular_buffer: *Circular_Buffer) {
    circular_buffer.read_index = 0;
    circular_buffer.write_index = 0;
    circular_buffer.count = 0;
}

overwrite :: (circular_buffer: *Circular_Buffer, value: int) {
    circular_buffer.data[circular_buffer.write_index] = value;
    circular_buffer.write_index = (circular_buffer.write_index + 1) % circular_buffer.data.count;
    if circular_buffer.count < circular_buffer.data.count {
        circular_buffer.count += 1;
    } else {
        circular_buffer.read_index = (circular_buffer.read_index + 1) % circular_buffer.data.count;
    }
}
