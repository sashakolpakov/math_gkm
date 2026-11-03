import MathGKM.QuotientReciprocity

noncomputable section
open scoped BigOperators
namespace MathGKM.GaussianQuotient.LowDegree
open Polynomial
open MathGKM.GaussianQuotient

/-- Agreement retains every coefficient through the specified bound. -/
def Agree (d : ℕ) (P Q : Polynomial ℚ) : Prop :=
  ∀ i : ℕ, i ≤ d → P.coeff i = Q.coeff i

theorem agree_mul {d : ℕ} {P Q R S : Polynomial ℚ}
    (hPQ : Agree d P Q) (hRS : Agree d R S) : Agree d (P*R) (Q*S) := by
  classical
  intro i hi
  rw [coeff_mul, coeff_mul]
  apply Finset.sum_congr rfl
  intro p hp
  have he := Finset.mem_antidiagonal.mp hp
  rw [hPQ p.1 (by omega), hRS p.2 (by omega)]

theorem agree_prod {ι : Type*} (s : Finset ι) (F G : ι → Polynomial ℚ)
    (d : ℕ) (h : ∀ j ∈ s, Agree d (F j) (G j)) :
    Agree d (∏ j ∈ s, F j) (∏ j ∈ s, G j) := by
  classical
  induction s using Finset.induction_on with
  | empty => intro i hi; simp
  | @insert j s hj ih =>
    simp only [Finset.prod_insert hj]
    exact agree_mul (h j (by simp)) (ih (fun a ha => h a (by simp [ha])))

theorem agree_cancel {d : ℕ} (D P Q : Polynomial ℚ) (h0 : D.coeff 0 = 1)
    (h : Agree d (P*D) (Q*D)) : Agree d P Q := by
  intro i
  induction i using Nat.strong_induction_on with
  | h i ih =>
    intro hi
    have he := h i hi
    rw [coeff_mul, coeff_mul,
      Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
      Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
      Finset.sum_range_succ, Finset.sum_range_succ, Nat.sub_self, h0,
      mul_one, mul_one] at he
    have hs : (∑ j ∈ Finset.range i, P.coeff j * D.coeff (i-j)) =
        ∑ j ∈ Finset.range i, Q.coeff j * D.coeff (i-j) := by
      apply Finset.sum_congr rfl
      intro j hj
      rw [ih j (Finset.mem_range.mp hj) (by have := Finset.mem_range.mp hj; omega)]
    rw [hs] at he
    exact add_left_cancel he

theorem agree_factor_one (d a : ℕ) (ha : d < a) :
    Agree d (1 - (X : Polynomial ℚ)^a) 1 := by
  intro i hi
  simp [coeff_X_pow, show i ≠ a by omega]

theorem agree_factor_prod_one {ι : Type*} (s : Finset ι) (a : ι → ℕ)
    (d : ℕ) (ha : ∀ j ∈ s, d < a j) :
    Agree d (∏ j ∈ s, (1 - (X : Polynomial ℚ)^(a j))) 1 := by
  simpa using agree_prod s (fun j => 1 - (X : Polynomial ℚ)^(a j))
    (fun _ => 1) d (fun j hj => agree_factor_one d (a j) (ha j hj))

/-- Exact transport from the original quotient equation to its interval factors. -/
theorem quotient_interval_identity (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (H : Polynomial ℚ) (hB : B n l ≠ 0)
    (hH : B n k = B n l * iota H) :
    H * (∏ j ∈ Finset.Ioc l k, (1 - (X : Polynomial ℚ)^j)) =
      ∏ a ∈ Finset.Ioc (n-k) (n-l), (1 - (X : Polynomial ℚ)^a) := by
  have hln : l ≤ n := hlk.trans hkn
  have hcross : T n * (T l * T (n-l)) =
      (T n * iota H) * (T k * T (n-k)) := by
    simp only [B, if_pos hkn, if_pos hln] at hH
    rw [div_mul_eq_mul_div] at hH
    exact (div_eq_div_iff
      (mul_ne_zero (Matching.T_ne_zero k) (Matching.T_ne_zero (n-k)))
      (mul_ne_zero (Matching.T_ne_zero l) (Matching.T_ne_zero (n-l)))).mp hH
  have hcancel : iota H * (T k * T (n-k)) = T l * T (n-l) := by
    apply mul_left_cancel₀ (Matching.T_ne_zero n)
    simpa only [mul_assoc] using hcross.symm
  rw [Matching.T_split l k hlk,
    Matching.T_split (n-k) (n-l) (by omega)] at hcancel
  apply Matching.iota_injective
  have hiq : iota (X : Polynomial ℚ) = q := rfl
  simp only [map_mul, map_prod, map_sub, map_one, map_pow, hiq]
  apply mul_left_cancel₀ (mul_ne_zero (Matching.T_ne_zero l) (Matching.T_ne_zero (n-k)))
  calc
    _ = iota H * ((T l * ∏ j ∈ Finset.Ioc l k, (1-q^j)) * T (n-k)) := by ring
    _ = _ := hcancel
    _ = _ := by ring

theorem geometric_product_identity (k l d : ℕ) :
    (∏ j ∈ Finset.Ioc l k, Matching.geom j (d+1)) *
      (∏ j ∈ Finset.Ioc l k, (1 - (X : Polynomial ℚ)^j)) =
      ∏ j ∈ Finset.Ioc l k, (1 - (X : Polynomial ℚ)^(j*(d+1))) := by
  rw [← Finset.prod_mul_distrib]
  apply Finset.prod_congr rfl
  intro j hj
  rw [mul_comm]
  exact Matching.geom_identity j (d+1)

theorem interval_coeff_zero (k l : ℕ) :
    (∏ j ∈ Finset.Ioc l k, (1 - (X : Polynomial ℚ)^j)).coeff 0 = 1 := by
  have h := agree_factor_prod_one (Finset.Ioc l k) id 0 (by
    intro j hj
    have := (Finset.mem_Ioc.mp hj).1
    dsimp
    omega)
  simpa using h 0 (by omega)

/-- Low coefficients agree with a finite product of positive geometric sums. -/
theorem quotient_coeff_eq_geom (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (H : Polynomial ℚ) (hB : B n l ≠ 0)
    (hH : B n k = B n l * iota H) (d : ℕ) (hd : d ≤ n-k) :
    H.coeff d = (∏ j ∈ Finset.Ioc l k, Matching.geom j (d+1)).coeff d := by
  have hN := agree_factor_prod_one (Finset.Ioc (n-k) (n-l)) id d (by
    intro j hj
    have := (Finset.mem_Ioc.mp hj).1
    dsimp
    omega)
  have hR := agree_factor_prod_one (Finset.Ioc l k) (fun j => j*(d+1)) d (by
    intro j hj
    have hjpos : 1 ≤ j := by have := (Finset.mem_Ioc.mp hj).1; omega
    have := Nat.mul_le_mul_right (d+1) hjpos
    omega)
  have hprod : Agree d
      (H * ∏ j ∈ Finset.Ioc l k, (1 - (X : Polynomial ℚ)^j))
      ((∏ j ∈ Finset.Ioc l k, Matching.geom j (d+1)) *
        ∏ j ∈ Finset.Ioc l k, (1 - (X : Polynomial ℚ)^j)) := by
    rw [quotient_interval_identity n k l hlk hkn H hB hH, geometric_product_identity]
    intro i hi
    exact (hN i hi).trans (hR i hi).symm
  exact agree_cancel _ _ _ (interval_coeff_zero k l) hprod d le_rfl

theorem quotient_coeff_nat (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (H : Polynomial ℚ) (hB : B n l ≠ 0)
    (hH : B n k = B n l * iota H) (d : ℕ) (hd : d ≤ n-k) :
    ∃ a : ℕ, H.coeff d = (a : ℚ) := by
  rw [quotient_coeff_eq_geom n k l hlk hkn H hB hH d hd]
  exact Matching.natCoeffs_prod _ _ (fun j hj => Matching.natCoeffs_geom j (d+1)) d

theorem quotient_upper_coeff_nat (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n)
    (H : Polynomial ℚ) (hB : B n l ≠ 0)
    (hH : B n k = B n l * iota H) (d : ℕ)
    (hd : d ≤ H.natDegree) (hupper : H.natDegree-d ≤ n-k) :
    ∃ a : ℕ, H.coeff d = (a : ℚ) := by
  rw [Reciprocity.coeff_reflection n k l H hB hH d hd]
  exact quotient_coeff_nat n k l hlk hkn H hB hH _ hupper

end MathGKM.GaussianQuotient.LowDegree
