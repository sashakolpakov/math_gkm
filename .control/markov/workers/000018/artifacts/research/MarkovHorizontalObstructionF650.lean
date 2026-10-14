import MarkovRightJetsF650

/-! Machine-authored request f6506bc6. Failure of horizontal binomial
normalization on an actual source triple. Raw LC is satisfied here. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem right_twelve_coeff650 :
    coeff (rightP650 11) 0 14=11 ∧ coeff (rightP650 11) 1 14=510 ∧
    coeff (rightP650 11) 2 14=10680 := by
  obtain ⟨h0,h1,h2⟩ := right_jets650 7
  norm_num [rightR650] at h0 h1 h2
  constructor
  · unfold coeff; rw [h0]
    norm_num [Polynomial.coeff_X_pow_mul',add_comm X 1,Polynomial.coeff_one_add_X_pow]
  constructor
  · unfold coeff; rw [h1]
    rw [mul_assoc,Polynomial.coeff_X_pow_mul']
    norm_num [Polynomial.coeff_mul,Finset.Nat.antidiagonal_succ,Finset.Nat.antidiagonal_zero,
      Finset.sum_range_succ,add_comm X 1,Polynomial.coeff_one_add_X_pow,
      Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_succ,Nat.choose]
  · have hh := congrArg (fun p : Polynomial ℤ => p.coeff 14) h2
    rw [mul_assoc,Polynomial.coeff_X_pow_mul'] at hh
    norm_num [Polynomial.coeff_ofNat_mul,Polynomial.coeff_mul,
      Finset.Nat.antidiagonal_succ,Finset.Nat.antidiagonal_zero,Finset.sum_range_succ,
      add_comm X 1,Polynomial.coeff_one_add_X_pow,
      Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_succ,Nat.choose] at hh
    unfold coeff; linarith

theorem right_twelve_valid650 :
    (frame (List.replicate 11 true)).mid.a=12 ∧
    (frame (List.replicate 11 true)).mid.b=13 ∧
    InPolygon 12 13 0 14 ∧ InPolygon 12 13 1 14 ∧ InPolygon 12 13 2 14 := by
  obtain ⟨ha,hb⟩ := right_labels650 11
  norm_num at ha hb
  exact ⟨ha,hb,by norm_num [InPolygon],by norm_num [InPolygon],by norm_num [InPolygon]⟩

/-- d-j=24-14=10. This is deliberately the stronger, normalized predicate. -/
theorem source_horizontal_normalized_failure650 :
    ((coeff (rightP650 11) 1 14:ℚ)/(10:ℕ).choose 1)^2 <
      ((coeff (rightP650 11) 0 14:ℚ)/(10:ℕ).choose 0)*
      ((coeff (rightP650 11) 2 14:ℚ)/(10:ℕ).choose 2) := by
  rw [right_twelve_coeff650.1,right_twelve_coeff650.2.1,right_twelve_coeff650.2.2]
  norm_num [Nat.choose]

theorem source_horizontal_raw_holds650 :
    coeff (rightP650 11) 0 14*coeff (rightP650 11) 2 14≤
      coeff (rightP650 11) 1 14^2 := by
  rw [right_twelve_coeff650.1,right_twelve_coeff650.2.1,right_twelve_coeff650.2.2]
  norm_num

#print axioms right_twelve_coeff650
#print axioms right_twelve_valid650
#print axioms source_horizontal_normalized_failure650
#print axioms source_horizontal_raw_holds650
end
end MathGKM.Markov
