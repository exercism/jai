to_test_case :: (canonical_case: CanonicalCase) -> Test {
    using test: Test;
    name = to_test_name(canonical_case.description_path);
    skip = canonical_case.index > 0;

    if canonical_case.property == {
        case "sharedBirthday";
            _, birthdates := get_property(canonical_case.input, "birthdates");
            
            lines: [..]string;
            array_add(*lines, "birthdates : [..] Calendar_Time;");

            for birthdate: birthdates.array {
                parts := split(birthdate.str, "-");
                year := to_integer(parts[0]);
                month := to_integer(parts[1]);
                day := to_integer(parts[2]);
                array_add(*lines, tprint("array_add(*birthdates, .{year = %, month_starting_at_0 = %, day_of_month_starting_at_0 = %});", to_code(year), to_code(month - 1), to_code(day - 1)));
            }
            array_add(*lines, tprint("assert_equal(%, shared_birthday(birthdates));", to_code(canonical_case.expected.boolean)));
            multiline_body = lines;
        case "randomBirthdates";
            lines: [..]string;

            if canonical_case.expected.type == .STRING && canonical_case.expected.str == "length == groupsize" {
                array_add(*lines, "for 1..10 {");
                array_add(*lines, tprint("    assert_equal(it, random_birthdates(it).count);"));
                array_add(*lines, "}");
            } else if get_property(canonical_case.expected, "years", "leapYear") {
                array_add(*lines, "is_leap_year :: (year: int) -> bool {");
                array_add(*lines, "    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);");
                array_add(*lines, "}");
                array_add(*lines, "");
                array_add(*lines, "for birthdate: random_birthdates(50) {");
                array_add(*lines, tprint("    assert_equal(false, is_leap_year(birthdate.year));"));
                array_add(*lines, "}");
            } else if get_property(canonical_case.expected, "months", "random") {
                array_add(*lines, "generated_unique_months: [..]s8;");
                array_add(*lines, "for birthdate: random_birthdates(100) {");
                array_add(*lines, tprint("    array_add_if_unique(*generated_unique_months, birthdate.month_starting_at_0);"));
                array_add(*lines, "}");
                array_add(*lines, "");
                array_add(*lines, tprint("assert_equal(12, generated_unique_months.count);"));
            } else if get_property(canonical_case.expected, "days", "random") {
                array_add(*lines, "generated_unique_days: [..]s8;");
                array_add(*lines, "for birthdate: random_birthdates(300) {");
                array_add(*lines, tprint("    array_add_if_unique(*generated_unique_days, birthdate.day_of_month_starting_at_0);"));
                array_add(*lines, "}");
                array_add(*lines, "");
                array_add(*lines, tprint("assert_equal(31, generated_unique_days.count);"));
            } else {
                assert(false, "Unexpected randomBirthdates test case");
            }

            multiline_body = lines;
        case "estimatedProbabilityOfSharedBirthday";
            _, group_size := get_property(canonical_case.input, "groupSize");
            expected := ifx canonical_case.expected.number then to_code(canonical_case.expected.number) else "0.0";

            lines: [..]string;
            array_add(*lines, tprint("estimated_probability := estimated_probability_of_shared_birthday(%);", to_code(group_size)));
            array_add(*lines, tprint("expected_probability := %;", expected));
            array_add(*lines, tprint("assert_equal(true, estimated_probability > expected_probability - 1.0);"));
            array_add(*lines, tprint("assert_equal(true, estimated_probability < expected_probability + 1.0);"));

            multiline_body = lines;
    }

    return test;
}

#run run_generator("baffling-birthdays", to_test_case);

#import "Basic";
#import "String";
#import,dir "../../../shared/generator";
