import MarkovEightPositiveM295
import MarkovEightZeroM295
/-! Machine-authored 29509309. Discrete lower-region certificate by the exhaustive
natural-offset split zero/successor. Earlier large direct attempts are preserved. -/
namespace MathGKM.Markov
noncomputable section
theorem lower_gap_eight_nonnegM295 (x y : ℕ) :
 0 ≤ lowerPolynomialM0D3 8 ((x:ℚ)+1) ((y:ℚ)+1)^2 -
 lowerPolynomialM0D3 8 x ((y:ℚ)+2)*lowerPolynomialM0D3 8 ((x:ℚ)+2) y := by
 cases y with
 | zero => simpa using lower_zero_gap_nonnegM295 x
 | succ y =>
   have h := lower_positive_gap_nonnegM295 (x:ℚ) (y:ℚ) (by positivity) (by positivity)
   simpa only [Nat.cast_succ,add_assoc,show (1:ℚ)+1=2 by norm_num,
     show (1:ℚ)+2=3 by norm_num] using h
end
end MathGKM.Markov
