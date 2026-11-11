namespace RnaTranscription

def toRna (dna : String) : String :=
  String.map translateNuc dna
where
  translateNuc : Char -> Char
    | 'G' => 'C'
    | 'C' => 'G'
    | 'T' => 'A'
    | 'A' => 'U'
    | x => panic! s!"Invalid nucleotid {x}"


end RnaTranscription
