import MarkovHorizontalFourthScaledM511
/-! Machine-authored request 5110b3fa. Exact denominator clearing for the fourth row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
set_option linter.unusedSimpArgs false

theorem hmoment_fourth_seedM511 (x a b q t u v w z : ℝ)
 (hx : x≠0) (hh : x+1≠0) :
 let D := hDvalM13D x a b q t u
 let K := hKvalM13D x a b q t u
 let L := hLvalM13D x a b q t u
 let M := h4valM511 x a b q t u v w z
 x^3*(x+1)^4*((x+1)^4*(D^4+6*D^2*K+3*K^2+4*D*L+M)-
   4*(x+1)^3*(D^3+3*D*K+L)+12*(x+1)^2*(D^2+K)-24*(x+1)*D+24)=
 (h4seedM511 a b q t u v w z).eval x := by
 dsimp only
 rw [hD_closedM13D x a b q t u hh,hK_closedM13D x a b q t u hx hh,
   hL_closedM13D x a b q t u hx hh,h4val_closedM511 x a b q t u v w z hx hh]
 simp only [hDnM13D,hKnM13D,hLnM13D,h4numM511,h4seedM511,
   h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,
   Polynomial.eval_add,Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_C,Polynomial.eval_X]
 field_simp
 <;> ring

end
end MathGKM.Markov
