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
 | one => simp [deformR3]
 | more n h0 h1 => simp [deformR3,h1,pow_succ']

theorem coeff_one_linear_pow80 (q : Polynomial ℤ) (a k : ℕ) :
 ((1+C q*X : BiPoly)^a).coeff k=(a.choose k : Polynomial ℤ)*q^k := by
 induction a generalizing k with
 | zero => cases k <;> simp [Polynomial.coeff_one]
 | succ a ih =>
   rw [pow_succ',add_mul,one_mul,mul_assoc]
   cases k with
   | zero => simp [Polynomial.mul_coeff_zero,ih]
   | succ k =>
     simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,ih,
       Nat.choose_succ_succ,Nat.cast_add,pow_succ]
     ring

theorem zero_weight_coeff80 (a k j : ℕ) :
 coeff (deformR3 0 a) k j=(a.choose k : ℤ)*((2*k).choose j : ℤ) := by
 rw [deform_zero_weight80]
 have he : (1+U*(1+V)^2 : BiPoly)=C (1 : Polynomial ℤ)+C ((1+X)^2)*X := by
   simp [U,V]; ring
 rw [he]
 change (((1+C ((1+X)^2)*X : BiPoly)^a).coeff k).coeff j=_
 rw [coeff_one_linear_pow80]
 rw [← pow_mul]
 rw [← Polynomial.C_eq_natCast,Polynomial.coeff_C_mul,Polynomial.coeff_one_add_X_pow]

theorem zero_weight_raw_coeff80 (a i j k : ℕ) (h : i+j=a+k) :
 coeff (typeP3 0 a) i j=(a.choose k : ℤ)*((2*k).choose j : ℤ) := by
 rw [← excessShear_coeff3,typeP_shear3,h]
 change ((X^a*deformR3 0 a).coeff (a+k)).coeff j=_
 rw [Nat.add_comm a k,Polynomial.coeff_X_pow_mul]
 exact zero_weight_coeff80 a k j

theorem zero_weight_below80 (a i j : ℕ) (h : i+j<a) :
 coeff (typeP3 0 a) i j=0 := by
 rw [← excessShear_coeff3,typeP_shear3]
 change ((X^a*deformR3 0 a).coeff (i+j)).coeff j=0
 rw [Polynomial.coeff_X_pow_mul']
 simp [show ¬ a ≤ i+j by omega]

theorem zero_weight_horizontal80 (a i j : ℕ) :
 coeff (typeP3 0 a) i j*coeff (typeP3 0 a) (i+2) j ≤
 coeff (typeP3 0 a) (i+1) j^2 := by
 by_cases h : i+j<a
 · rw [zero_weight_below80 a i j h,zero_mul]; exact sq_nonneg _
 · let k := i+j-a
   have he : i+j=a+k := by dsimp [k]; omega
   rw [zero_weight_raw_coeff80 a i j k he,
     zero_weight_raw_coeff80 a (i+2) j (k+2) (by omega),
     zero_weight_raw_coeff80 a (i+1) j (k+1) (by omega)]
   apply lc_product6 _ _ _ _ _ _ (by positivity) (by positivity) (by positivity)
   · exact choose_raw_lc1998 a k
   · convert choose_upper_stride_two9a72 (2*k) j using 1 <;> congr 2 <;> omega

theorem weighted_zero_horizontal80 (n i j : ℕ) :
 coeff (weightedP561 (List.replicate n 0)) i j*
 coeff (weightedP561 (List.replicate n 0)) (i+2) j ≤
 coeff (weightedP561 (List.replicate n 0)) (i+1) j^2 := by
 simp only [weighted_scalar561,weighted_uniform561,← typeP_matrix3]
 exact zero_weight_horizontal80 (n+1) i j

#print axioms typeP_zero80
#print axioms zero_weight_coeff80
#print axioms zero_weight_horizontal80
#print axioms weighted_zero_horizontal80
end
end MathGKM.Markov
