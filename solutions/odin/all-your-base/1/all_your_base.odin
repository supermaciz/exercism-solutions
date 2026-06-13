package all_your_base

import "core:slice"
Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
	Unimplemented,
}

rebase :: proc(input_base: int, digits: []int, output_base: int) -> (result: []int, err: Error) {
	validate_params(input_base, digits, output_base) or_return

	value := 0
	for d in digits {
		value = value * input_base + d
	}
	acc := make([dynamic]int)
	if value == 0 {
		append(&acc, 0)
		return acc[:], err
	}

	for value > 0 {
		rem := value % output_base
		append(&acc, rem)
		value /= output_base
	}
	result = acc[:]
	slice.reverse(result)
	return result, err
}

validate_params :: proc(input_base: int, digits: []int, output_base: int) -> ([]int, Error) {
	if input_base < 2 {
		return nil, .Input_Base_Too_Small
	}
	if output_base < 2 {
		return nil, .Output_Base_Too_Small
	}
	for d in digits {
		if d < 0 || d >= input_base {
			return nil, .Invalid_Input_Digit
		}
	}
	return nil, .None
}
