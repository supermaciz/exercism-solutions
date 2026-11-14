namespace TwoFer

def twoFer : Option String → String
  | none => "One for you, one for me."
  | some name => s!"One for {name}, one for me."

end TwoFer
