decode_commands :: (number: int) -> [] string {
    commands: [..] string;

    if (number & 1 != 0) array_add(*commands, "wink");
    if (number & 2 != 0) array_add(*commands, "double blink");
    if (number & 4 != 0) array_add(*commands, "close your eyes");
    if (number & 8 != 0) array_add(*commands, "jump");
    if (number & 16 != 0) {
        for i: 0 .. commands.count / 2 - 1 {
            swap(*commands[i], *commands[commands.count - 1 - i]);
        }
    }

    return commands;
}
