import MathGKM.Accepted0389682fd849add0e3926978
import MathGKM.Accepted0beeba7c6244e2295e3e804c
/- Machine-authored round83: actual cardinalities independently of gamma signs. -/
namespace StoppedFiberR83
open Polynomial
private theorem explicit_coeff (r : ℕ) :
    (36+64*X+36*X^2 : Polynomial ℤ).coeff r =
      if r=0 then 36 else if r=1 then 64 else if r=2 then 36 else 0 := by
  change (C 36+C 64*X+C 36*X^2 : Polynomial ℤ).coeff r = _
  by_cases h0 : r=0
  · subst r; norm_num [coeff_X]
  by_cases h1 : r=1
  · subst r; norm_num [coeff_X]
  by_cases h2 : r=2
  · subst r; norm_num [coeff_X]
  have hc : (36 : Polynomial ℤ).coeff r = 0 := by
    change (C (36 : ℤ)).coeff r = 0
    rw [coeff_C]
    simp [h0,Ne.symm h0]
  norm_num [hc,h0,h1,h2,Ne.symm h0,Ne.symm h1,Ne.symm h2,coeff_X_pow,coeff_X]
theorem counts (r : ℕ) :
    (PairConvolutionR78.P 8 1 4 2 0 6 r).card =
      if r=0 then 36 else if r=1 then 64 else if r=2 then 36 else 0 := by
  have h := (Accepted0beeba7c6244e2295e3e804c.obligation.1 8 1 4 2 0 6 r).1
  rw [Accepted0389682fd849add0e3926978.obligation,explicit_coeff] at h
  split_ifs at * <;> exact_mod_cast h.symm
theorem cardinality_certificate :
    (∀ r : ℕ, (PairConvolutionR78.P 8 1 4 2 0 6 r).card =
      if r=0 then 36 else if r=1 then 64 else if r=2 then 36 else 0) ∧
    (PairConvolutionR78.P 8 1 4 2 0 6 0).card ≤
      (PairConvolutionR78.P 8 1 4 2 0 6 1).card ∧
    ((PairConvolutionR78.P 8 1 4 2 0 6 1).card : ℤ) -
      ((PairConvolutionR78.P 8 1 4 2 0 6 0).card : ℤ) = 28 := by
  refine ⟨counts,?_,?_⟩ <;> norm_num [counts]
end StoppedFiberR83
#print axioms StoppedFiberR83.cardinality_certificate
