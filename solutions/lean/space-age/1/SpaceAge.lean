namespace SpaceAge

/-
  You should define a Planet type here
-/
inductive Planet where
  | Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

def Planet.orbitalPeriod : Planet -> Float
  | .Mercury => 0.2408467
  | .Venus => 0.61519726
  | .Earth => 1.0
  | .Mars => 1.8808158
  | .Jupiter => 11.862615
  | .Saturn => 29.447498
  | .Uranus => 84.016846
  | .Neptune => 164.79132

def age (planet : Planet) (seconds : Nat) : Float :=
 seconds.toFloat / (31557600 * planet.orbitalPeriod)

end SpaceAge
