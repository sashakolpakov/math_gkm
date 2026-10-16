import MarkovLowerShapeME9C
/-! Machine-authored ffd747f5. Literal source arithmetic for the finite small
parameters, with a universal zero-tail argument. Ordinary kernel reduction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 100000

theorem fifth_small_boundedMFFD (q i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hq4 : q ≤ 4) (hi : i ≤ 11) :
 threeRawM9E2 q r i 5*threeRawM9E2 q r (i+2) 5 ≤ threeRawM9E2 q r (i+1) 5^2 := by
 interval_cases q <;> cases r <;> interval_cases i <;> decide

theorem fifth_small_allMFFD (q i : ℕ) (r : Bool) (hq : 1 ≤ q) (hq4 : q ≤ 4) :
 threeRawM9E2 q r i 5*threeRawM9E2 q r (i+2) 5 ≤ threeRawM9E2 q r (i+1) 5^2 := by
 by_cases hi : i ≤ 11
 · exact fifth_small_boundedMFFD q i r hq hq4 hi
 · rw [three_raw_degreeME9C q i 5 r hq ?_,zero_mul]
   · exact sq_nonneg _
   · unfold sourceNME9C
     split_ifs <;> omega

end
end MathGKM.Markov
