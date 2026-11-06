import MathGKM.Round94CompleteA
import MathGKM.Accepted0be6b2c4fefa701c55d0d8a9
/- Machine-authored round94. Complete small/large-size composition. -/
theorem CompensationR94.all_central :
∀ n j i b : ℕ,
  (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card  ≤ 
    (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card := by
  intro n j i b
  by_cases hn : n < 3
  · exact Accepted0be6b2c4fefa701c55d0d8a9.obligation n j i b hn
  · exact CompensationR94.central n j i b (by omega)
#print axioms CompensationR94.all_central
