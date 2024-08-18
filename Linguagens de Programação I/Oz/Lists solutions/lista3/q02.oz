declare
fun {Cubert X}
   fun {CubertIter Guess}
      if {GoodEnough Guess} then Guess
      else {CubertIter {Improve Guess}} end
   end
   fun {GoodEnough Guess}
      {Abs X-Guess*Guess*Guess}/X < 0.000001
   end
   fun {Improve Guess}
      (X/(Guess*Guess) + 2.0*Guess)/3.0
   end
   Guess = 1.0
in
   {CubertIter Guess}
end
{Browse {Cubert 3.0}}