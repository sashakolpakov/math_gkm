import MarkovWeighted5611
import MarkovPellSummand9a72
/-! Machine-authored request 80b7912a. Exact zero-common-weight Pell family.
This deformation is not a source polynomial except at the initial case. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem typeP_zero80 (a : ℕ) : typeP3 0 a=((U+V)^2+U)^a := by
 induction a using Nat.twoStepInduction with
 | zero => simp [typeP3]
 | one => simp [typeP3]
 | more n h0 h1 => simp [typeP3,h1,pow_succ']

theorem deform_zero_weight80 (a : ℕ) :
 deformR3 0 a=(1+U*(1+V)^2)^a := by
 induction a using Nat.twoStepInduction with
 | zero => simp [deformR3]
 | one => simp [deformR3]; ring
 | more n h0 h1 => simp [deformR3,h1,pow_succ']; ring

theorem zero_weight_coeff80 (a k j : ℕ) :
 coeff (deformR3 0 a) k j=(a.choose k : ℤ)*((2*k).choose j : ℤ) := by
 rw [deform_zero_weight80]
 have he : (1+U*(1+V)^2 : BiPoly)=C (1 : Polynomial ℤ)+C ((1+X)^2)*X := by
   simp [U,V]; ring
 rw [he]
 simp [coeff,Polynomial.coeff_add_pow,Polynomial.coeff_one_add_X_pow]

#print axioms typeP_zero80
#print axioms zero_weight_coeff80
end
end MathGKM.Markov
