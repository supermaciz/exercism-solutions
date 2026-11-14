namespace Darts

def score (x : Float) (y : Float) : Int :=
  let distSq := x * x + y * y
  if distSq <= 1 then 10
  else if distSq <= 25 then 5
  else if distSq <= 100 then 1
  else 0


end Darts
