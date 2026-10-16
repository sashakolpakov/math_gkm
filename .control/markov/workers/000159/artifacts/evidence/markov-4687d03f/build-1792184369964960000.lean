import MarkovRowCoeffM468
/-! Machine-authored 4687d03f. Uniform denominator-shift recurrence. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem rowJ_zeroM468 (n : ℕ) : rowJMFFD n 0=1 := by
 simp [rowJMFFD]

theorem rowH_parameterM468 (n j : ℕ) (hn : j+1 ≤ n) :
 rowHMFFD (n+2) (j+1)+rowHMFFD n j =
 rowHMFFD (n+1) (j+1)+(X+1)*rowHMFFD (n+1) j := by
 induction j using Nat.strong_induction_on with
 | h j ih =>
   rcases j with _|_|j
   · have h := rowJ_parameterM468 n 0 hn
     simp only [rowHMFFD,rowJ_zeroM468] at *
     linear_combination h
   · have h0 := rowJ_parameterM468 n 0 (by omega)
     have h1 := rowJ_parameterM468 n 1 hn
     simp only [rowHMFFD,rowJ_zeroM468] at *
     linear_combination h1+ (2*(X+1)+2*(1-X))*h0
   · have h0 := rowJ_parameterM468 n j (by omega)
     have h1 := rowJ_parameterM468 n (j+1) (by omega)
     have h2 := rowJ_parameterM468 n (j+2) hn
     have ih0 := ih j (by omega) (by omega)
     have ih1 := ih (j+1) (by omega) (by omega)
     simp only [rowHMFFD] at ih0 ih1 ⊢
     linear_combination h2+2*(X+1)*h1+(X+1)^2*h0+
       2*(1-X)*ih1-(X+1)^2*ih0

end
end MathGKM.Markov
