package bob

import "core:strings"
import "core:unicode"

response :: proc(input: string) -> (response: string) {
	clean_input := strings.trim_space(input)
	input_is_upper := is_upper(clean_input)
	input_is_question := strings.ends_with(clean_input, "?")

	switch {
	case input_is_question && input_is_upper:
		response = "Calm down, I know what I'm doing!"
	case input_is_upper:
		response = "Whoa, chill out!"
	case input_is_question:
		response = "Sure."
	case clean_input == "":
		response = "Fine. Be that way!"
	case:
		response = "Whatever."
	}
	return
}

is_upper :: proc(input: string) -> bool {
	letter_count := 0
	for r in input {
		if unicode.is_letter(r) {
			letter_count += 1
			if !unicode.is_upper(r) {
				return false
			}}
	}
	if letter_count == 0 {
		return false
	}
	return true
}
