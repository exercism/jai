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

ORBITAL_PERIODS : [8]float : .[1.0, 0.2408467, 0.61519726, 1.8808158, 11.862615, 29.447498, 84.016846, 164.79132];
EARTH_SECONDS_IN_YEAR : int = 31_557_600;

age :: (planet: Planet, seconds: int) -> float {
    age_on_planet := seconds / (EARTH_SECONDS_IN_YEAR * ORBITAL_PERIODS[planet]);
    return floor(age_on_planet * 100.0 + 0.5) / 100.0;
}

#import "Math";
