namespace Hamming

def distance (strand1 : String) (strand2 : String) : Option Nat :=
  if strand1.length != strand2.length
  then none
  else
    let pairs := List.zip strand1.toList strand2.toList
    let isDifferent := fun (x, y) => x != y
    pairs.countP isDifferent

end Hamming
