namespace RnaTranscription

def toRna (dna : String) : String :=
  dna.map translateNuc
where
  translateNuc : Char -> Char
    | 'G' => 'C'
    | 'C' => 'G'
    | 'T' => 'A'
    | 'A' => 'U'
    | c => c


end RnaTranscription
