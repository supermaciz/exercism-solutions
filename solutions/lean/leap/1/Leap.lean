namespace Leap

def leapYear (year : UInt16) : Bool :=
  if year % 100 == 0
    then year % 400 == 0
    else year % 4 == 0

end Leap
