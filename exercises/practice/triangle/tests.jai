run_tests :: () {
    equilateral_triangle_all_sides_are_equal();
    skip(equilateral_triangle_any_side_is_unequal());
    skip(equilateral_triangle_no_sides_are_equal());
    skip(equilateral_triangle_all_zero_sides_is_not_a_triangle());
    skip(isosceles_triangle_last_two_sides_are_equal());
    skip(isosceles_triangle_first_two_sides_are_equal());
    skip(isosceles_triangle_first_and_last_sides_are_equal());
    skip(isosceles_triangle_equilateral_triangles_are_also_isosceles());
    skip(isosceles_triangle_no_sides_are_equal());
    skip(isosceles_triangle_first_triangle_inequality_violation());
    skip(isosceles_triangle_second_triangle_inequality_violation());
    skip(isosceles_triangle_third_triangle_inequality_violation());
    skip(scalene_triangle_no_sides_are_equal());
    skip(scalene_triangle_all_sides_are_equal());
    skip(scalene_triangle_first_and_second_sides_are_equal());
    skip(scalene_triangle_first_and_third_sides_are_equal());
    skip(scalene_triangle_second_and_third_sides_are_equal());
    skip(scalene_triangle_may_not_violate_triangle_inequality());
}

equilateral_triangle_all_sides_are_equal :: () {
    assert_equal(true, is_equilateral(.[2, 2, 2]));
}

equilateral_triangle_any_side_is_unequal :: () {
    assert_equal(false, is_equilateral(.[2, 3, 2]));
}

equilateral_triangle_no_sides_are_equal :: () {
    assert_equal(false, is_equilateral(.[5, 4, 6]));
}

equilateral_triangle_all_zero_sides_is_not_a_triangle :: () {
    assert_equal(false, is_equilateral(.[0, 0, 0]));
}

isosceles_triangle_last_two_sides_are_equal :: () {
    assert_equal(true, is_isosceles(.[3, 4, 4]));
}

isosceles_triangle_first_two_sides_are_equal :: () {
    assert_equal(true, is_isosceles(.[4, 4, 3]));
}

isosceles_triangle_first_and_last_sides_are_equal :: () {
    assert_equal(true, is_isosceles(.[4, 3, 4]));
}

isosceles_triangle_equilateral_triangles_are_also_isosceles :: () {
    assert_equal(true, is_isosceles(.[4, 4, 4]));
}

isosceles_triangle_no_sides_are_equal :: () {
    assert_equal(false, is_isosceles(.[2, 3, 4]));
}

isosceles_triangle_first_triangle_inequality_violation :: () {
    assert_equal(false, is_isosceles(.[1, 1, 3]));
}

isosceles_triangle_second_triangle_inequality_violation :: () {
    assert_equal(false, is_isosceles(.[1, 3, 1]));
}

isosceles_triangle_third_triangle_inequality_violation :: () {
    assert_equal(false, is_isosceles(.[3, 1, 1]));
}

scalene_triangle_no_sides_are_equal :: () {
    assert_equal(true, is_scalene(.[5, 4, 6]));
}

scalene_triangle_all_sides_are_equal :: () {
    assert_equal(false, is_scalene(.[4, 4, 4]));
}

scalene_triangle_first_and_second_sides_are_equal :: () {
    assert_equal(false, is_scalene(.[4, 4, 3]));
}

scalene_triangle_first_and_third_sides_are_equal :: () {
    assert_equal(false, is_scalene(.[3, 4, 3]));
}

scalene_triangle_second_and_third_sides_are_equal :: () {
    assert_equal(false, is_scalene(.[4, 3, 3]));
}

scalene_triangle_may_not_violate_triangle_inequality :: () {
    assert_equal(false, is_scalene(.[7, 3, 2]));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
