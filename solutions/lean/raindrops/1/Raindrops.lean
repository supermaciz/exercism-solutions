namespace Raindrops

def convert (number : Nat) : String :=
  let sounds :=
    [(3, "Pling"), (5, "Plang"), (7, "Plong")].foldl addRaindropSound ""
  if sounds.isEmpty then toString number else sounds
where
  addRaindropSound :=
    fun acc (div, sound) => if number % div == 0 then acc ++ sound else acc

end Raindrops
