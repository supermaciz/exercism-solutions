package wordcount

import (
	"regexp"
	"strings"
	"unicode"
)

type Frequency map[string]int

var splitRegex *regexp.Regexp = regexp.MustCompile(`[^\w']+`)

func WordCount(phrase string) Frequency {
	result := make(Frequency)
	words := splitRegex.Split(normalize(phrase), -1)

	for _, w := range words {
		if w != "" {
			result[w] += 1
		}
	}

	return result
}

func normalize(phrase string) string {
	var sb strings.Builder
	phraseRunes := []rune(strings.ToLower(phrase))

	for i, r := range phraseRunes {
		if r == '\'' &&
			(i == 0 ||
				i == len(phraseRunes)-1 ||
				unicode.IsSpace(phraseRunes[i-1]) ||
				unicode.IsSpace(phraseRunes[i+1])) {
			continue
		}
		sb.WriteRune(r)
	}

	return sb.String()
}
