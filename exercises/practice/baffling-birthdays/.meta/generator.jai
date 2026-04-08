to_test_case :: (canonical_case: CanonicalCase) -> Test {
    using test: Test;
    name = to_test_name(canonical_case.description_path);
    skip = canonical_case.index > 0;

    if canonical_case.property == {
        case "sharedBirthday";
            _, birthdates := get_property(canonical_case.input, "birthdates");

            body = tprint("assert_equal(%, %(%));", to_code(canonical_case.expected), to_test_name(canonical_case.property), to_code(birthdates));
        case "randomBirthdates";
            lines: [..]string;
            array_add(*lines, "for 1..10 {");
            array_add(*lines, tprint("    assert_equal(it, %(it).count);", to_test_name(canonical_case.property)));
            array_add(*lines, "}");

            multiline_body = lines;
        case "estimatedProbabilityOfSharedBirthday";
            _, group_size := get_property(canonical_case.input, "groupSize");
            expected := ifx canonical_case.expected.number then to_code(canonical_case.expected.number) else "0.0";

            body = tprint("assert_equal(%, %(%));", expected, to_test_name(canonical_case.property), to_code(group_size));
    }

    return test;
}

AFTER_TESTS :: #string SUFFIX
to_date :: (str: string) -> Calendar_Time {
    using ct: Calendar_Time;
    parts = split(str, "-");
    year = to_integer(parts[0]);
    month_starting_at_0 = to_integer(parts[1]) - 1;
    day_of_month_starting_at_0 = to_integer(parts[2]) - 1;
    return ct;
}
SUFFIX;

#run run_generator("baffling-birthdays", to_test_case, AFTER_TESTS);

#import "Basic";
#import,dir "../../../shared/generator";
