import MarkovRightJetsF650

/-! Machine-authored request 7252232b. An actual-source obstruction to
factorial-weighted horizontal LC. The raw inequality holds at this triple. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem right_twentyone_coeff725 :
    coeff (rightP650 20) 0 24=190 ∧ coeff (rightP650 20) 1 24=13965 ∧
    coeff (rightP650 20) 2 24=514845 := by
  obtain ⟨h0,h1,h2⟩ := right_jets650 16
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
  · have hh := congrArg (fun p : Polynomial ℤ => p.coeff 24) h2
    rw [mul_assoc,Polynomial.coeff_X_pow_mul'] at hh
    norm_num [Polynomial.coeff_ofNat_mul,Polynomial.coeff_mul,
      Finset.Nat.antidiagonal_succ,Finset.Nat.antidiagonal_zero,Finset.sum_range_succ,
      add_comm X 1,Polynomial.coeff_one_add_X_pow,
      Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_succ,Nat.choose] at hh
    unfold coeff; linarith

theorem right_twentyone_valid725 :
    (frame (List.replicate 20 true)).mid.a=21 ∧
    (frame (List.replicate 20 true)).mid.b=22 ∧
    InPolygon 21 22 0 24 ∧ InPolygon 21 22 1 24 ∧ InPolygon 21 22 2 24 := by
  obtain ⟨ha,hb⟩ := right_labels650 20
  norm_num at ha hb
  exact ⟨ha,hb,by norm_num [InPolygon],by norm_num [InPolygon],by norm_num [InPolygon]⟩

/-- This concerns i! times the coefficient, explicitly a stronger predicate. -/
theorem source_factorial_failure725 :
    (((1:ℕ).factorial:ℤ)*coeff (rightP650 20) 1 24)^2 <
      (((0:ℕ).factorial:ℤ)*coeff (rightP650 20) 0 24)*
      (((2:ℕ).factorial:ℤ)*coeff (rightP650 20) 2 24) := by
  rw [right_twentyone_coeff725.1,right_twentyone_coeff725.2.1,right_twentyone_coeff725.2.2]
  norm_num

theorem source_factorial_example_raw_holds725 :
    coeff (rightP650 20) 0 24*coeff (rightP650 20) 2 24≤
      coeff (rightP650 20) 1 24^2 := by
  rw [right_twentyone_coeff725.1,right_twentyone_coeff725.2.1,right_twentyone_coeff725.2.2]
  norm_num

#print axioms right_twentyone_coeff725
#print axioms right_twentyone_valid725
#print axioms source_factorial_failure725
#print axioms source_factorial_example_raw_holds725
end
end MathGKM.Markov
