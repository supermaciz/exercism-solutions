package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	return f64(seconds) / year_in_seconds(planet)
}

year_in_seconds :: proc(planet: Planet) -> f64 {
	orbital_period_ratio: f64
	earth_year_seconds: f64 = 31_557_600

	switch planet {
	case Planet.Mercury:
		orbital_period_ratio = 0.2408467
	case Planet.Venus:
		orbital_period_ratio = 0.61519726
	case Planet.Earth:
		orbital_period_ratio = 1.0
	case Planet.Mars:
		orbital_period_ratio = 1.8808158
	case Planet.Jupiter:
		orbital_period_ratio = 11.862615
	case Planet.Saturn:
		orbital_period_ratio = 29.447498
	case Planet.Uranus:
		orbital_period_ratio = 84.016846
	case Planet.Neptune:
		orbital_period_ratio = 164.79132

	}
	return earth_year_seconds * orbital_period_ratio
}
