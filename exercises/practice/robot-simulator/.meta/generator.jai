to_test_case :: (canonical_case: CanonicalCase) -> Test {
    _, x := get_property(canonical_case.input, "position", "x");
    _, y := get_property(canonical_case.input, "position", "y");
    _, direction := get_property(canonical_case.input, "direction");

    _, expected_x := get_property(canonical_case.expected, "position", "x");
    _, expected_y := get_property(canonical_case.expected, "position", "y");
    _, expected_direction := get_property(canonical_case.expected, "direction");

    lines: [..] string;
    array_add(*lines, tprint("robot := create(%, %, %);", to_code(x), to_code(y), to_enum(direction)));

    if canonical_case.property == "move" {
        _, instructions := get_property(canonical_case.input, "instructions");
        array_add(*lines, tprint("move(*robot, %);", to_code(instructions)));
    }

    array_add(*lines, tprint("assert_equal(%, robot.x);", to_code(expected_x)));
    array_add(*lines, tprint("assert_equal(%, robot.y);", to_code(expected_y)));
    array_add(*lines, tprint("assert_equal(%, robot.direction);", to_enum(expected_direction, "Direction")));

    return Test.{
        name = to_test_name(canonical_case.description_path),
        multiline_body = lines,
        skip = canonical_case.index > 0
    };
}

#run run_generator("robot-simulator", to_test_case);

#import "Basic";
#import,dir "../../../shared/generator";
