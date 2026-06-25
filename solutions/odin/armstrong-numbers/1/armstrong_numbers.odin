package armstrong_numbers

import "core:fmt"

is_armstrong_number :: proc(n: u128) -> bool {
	digits := fmt.aprint(n)
	defer delete(digits)
	power: u128 = u128(len(digits))

	sum: u128
	for char in digits {
		d := u128(char - '0')
		sum += pow(d, power)
	}

	return sum == n
}

pow :: proc(n: u128, power: u128) -> u128 {
	result: u128 = 1
	for i in 0 ..< power {
		result *= n
	}
	return result
}
