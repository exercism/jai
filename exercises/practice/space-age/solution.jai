Planet :: enum {
    EARTH;
    MERCURY;
    VENUS;
    MARS;
    JUPITER;
    SATURN;
    URANUS;
    NEPTUNE;
}

age :: (planet: Planet, seconds: int) -> f64 {
    orbital_periods : [8]f64 = .[1.0, 0.2408467, 0.61519726, 1.8808158, 11.862615, 29.447498, 84.016846, 164.79132];
    return seconds / (31557600 * orbital_periods[planet]);
}
