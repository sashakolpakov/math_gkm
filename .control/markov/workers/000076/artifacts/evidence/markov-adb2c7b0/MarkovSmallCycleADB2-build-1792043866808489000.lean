import MarkovThirdLowSourceADB2
/-! Machine-authored request adb2c7b0. An actual source witnesses why the
large-cycle formula cannot be silently extended to the three-letter case.
This refutes only that formula extension, not Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem third_small_source_polyADB2 :
 cutCoeffA27 (X:ℤ[X]) X 1 (central28 [false,false]++[true]) 3=
 1+4*X+6*X^2+4*X^3+X^4 := by
 have hc : central28 [false,false]=[false,false] := by decide
 rw [hc]
 simp [cutCoeffA27,cutChargeA27,cutFactorA27]
 ring

theorem third_small_source_coeffADB2 : coeff (frame [false,false]).mid.p 0 4=1 := by
 rw [source_cut_coeffA27 [false,false] 0 4 3 (by decide),third_small_source_polyADB2]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]

theorem third_small_formula_failureADB2 : ¬ThirdFormula75 [false,false] 3 1 0 0 0 := by
 intro h
 have hh := h 4
 rw [third_small_source_polyADB2] at hh
 norm_num [thirdSeq75,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow] at hh

#print axioms third_small_source_coeffADB2
#print axioms third_small_formula_failureADB2
end
end MathGKM.Markov
