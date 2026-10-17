import Mathlib
/-! Machine-authored e8743310. A finite-degree coefficient lemma with all
zero tails retained. It is used only after an exact source-row identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem quartic_lcME87 (a b c d e : ℤ)
 (h0 : a*c ≤ b^2) (h1 : b*d ≤ c^2) (h2 : c*e ≤ d^2) (i : ℕ) :
 (C a+C b*X+C c*X^2+C d*X^3+C e*X^4).coeff i*
 (C a+C b*X+C c*X^2+C d*X^3+C e*X^4).coeff (i+2) ≤
 (C a+C b*X+C c*X^2+C d*X^3+C e*X^4).coeff (i+1)^2 := by
 rcases i with _|_|_|_|i
 · simpa using h0
 · simpa using h1
 · simpa using h2
 · simp
 · have h0' : i+4≠0 := by omega
   have h1' : i+4≠1 := by omega
   have h2' : i+4≠2 := by omega
   have h3' : i+4≠3 := by omega
   have h4' : i+4+2≠4 := by omega
   simp [coeff_C_mul,h0',h1',h2',h3',h4']
end
end MathGKM.Markov
