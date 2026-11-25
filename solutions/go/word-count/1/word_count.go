package wordcount

import (
	"regexp"
	"strings"
	"unicode"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	result := make(Frequency)
	words := regexp.MustCompile(`[^\w']+`).Split(normalize(phrase), -1)

	for _, w := range words {
		if w != "" {
			result[w] += 1
		}
	}

	return result
}

func normalize(phrase string) string {
	var sb strings.Builder
	phrase_runes := []rune(strings.ToLower(phrase))

	for i, r := range phrase_runes {
		if r == '\'' &&
			(i == 0 ||
				i == len(phrase_runes)-1 ||
				unicode.IsSpace(phrase_runes[i-1]) ||
				unicode.IsSpace(phrase_runes[i+1])) {
			continue
		}
		sb.WriteRune(r)
	}

	return sb.String()
}
