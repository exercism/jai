run_tests :: () {
    age_on_earth();
    skip(age_on_mercury());
    skip(age_on_venus());
    skip(age_on_mars());
    skip(age_on_jupiter());
    skip(age_on_saturn());
    skip(age_on_uranus());
    skip(age_on_neptune());
}

age_on_earth :: () {
    assert_equal(31.69, age(.EARTH, 1000000000));
}

age_on_mercury :: () {
    assert_equal(280.88, age(.MERCURY, 2134835688));
}

age_on_venus :: () {
    assert_equal(9.78, age(.VENUS, 189839836));
}

age_on_mars :: () {
    assert_equal(35.88, age(.MARS, 2129871239));
}

age_on_jupiter :: () {
    assert_equal(2.41, age(.JUPITER, 901876382));
}

age_on_saturn :: () {
    assert_equal(2.15, age(.SATURN, 2000000000));
}

age_on_uranus :: () {
    assert_equal(0.46, age(.URANUS, 1210123456));
}

age_on_neptune :: () {
    assert_equal(0.35, age(.NEPTUNE, 1821023456));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
