import Mathlib
/-! Machine-authored 0d346fa7. Ordinary binomial coefficients evaluated as
rational polynomials, including all natural zero cases. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def choosePolyM0D3 (x : ℚ) (k : ℕ) : ℚ :=
 (descPochhammer ℚ k).eval x / (k.factorial:ℚ)

theorem choose_poly_natM0D3 (n k : ℕ) :
 (n.choose k:ℚ)=choosePolyM0D3 n k := by
 exact Nat.cast_choose_eq_descPochhammer_div n k

theorem choose_poly_zeroM0D3 (x : ℚ) : choosePolyM0D3 x 0=1 := by
 simp [choosePolyM0D3]

theorem choose_poly_succM0D3 (x : ℚ) (k : ℕ) :
 choosePolyM0D3 x (k+1)=choosePolyM0D3 x k*(x-k)/(k+1) := by
 simp only [choosePolyM0D3,descPochhammer_succ_right,Polynomial.eval_mul,
   Polynomial.eval_sub,Polynomial.eval_X,Polynomial.eval_natCast,
   Nat.factorial_succ,Nat.cast_mul,Nat.cast_add,Nat.cast_one]
 ring

end
end MathGKM.Markov
