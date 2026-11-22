namespace Raindrops

def convert (number : Nat) : String :=
  let sounds :=
    [(3, "Pling"), (5, "Plang"), (7, "Plong")].foldl addRaindropSound ""
  if sounds.isEmpty then toString number else sounds
where
  addRaindropSound :=
    fun acc (div, sound) => if number % div == 0 then acc ++ sound else acc

theorem convert_1 : convert 1 = "1" := rfl
theorem convert_105 : convert 105 = "PlingPlangPlong" := rfl


theorem not_divisible (h3 : n % 3 ≠ 0) (h5 : n % 5 ≠ 0) (h7 : n % 7 ≠ 0) : convert n = toString n := by
  simp [convert, List.foldl, convert.addRaindropSound, h3, h5, h7]


end Raindrops
