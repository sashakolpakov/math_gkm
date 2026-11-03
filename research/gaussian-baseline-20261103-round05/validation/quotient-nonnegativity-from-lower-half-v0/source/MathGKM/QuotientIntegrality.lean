import MathGKM.Accepted42ad111d9b6c04f7ba2b0dde

noncomputable section
open scoped BigOperators
namespace MathGKM.GaussianQuotient.Integrality
open MathGKM.GaussianQuotient

def IntCoeffs (P : Polynomial ℚ) : Prop :=
  ∀ d : ℕ, ∃ z : ℤ, P.coeff d = (z : ℚ)

theorem integral_sum {ι : Type*} (s : Finset ι) (f : ι → ℚ)
    (hf : ∀ i ∈ s, ∃ z : ℤ, f i = (z : ℚ)) :
    ∃ z : ℤ, (∑ i ∈ s, f i) = (z : ℚ) := by
  classical
  induction s using Finset.induction_on with
  | empty => exact ⟨0, by simp⟩
  | @insert i s hi ih =>
    obtain ⟨a, ha⟩ := hf i (by simp)
    obtain ⟨b, hb⟩ := ih (fun j hj => hf j (by simp [hj]))
    exact ⟨a+b, by simp [Finset.sum_insert hi, ha, hb]⟩

/-- Unit constant term permits recursive integral division, with every lower
degree retained in the induction hypothesis. -/
theorem integral_of_mul (D H : Polynomial ℚ) (hD : IntCoeffs D)
    (hHD : IntCoeffs (H * D)) (h0 : D.coeff 0 = 1) : IntCoeffs H := by
  intro d
  induction d using Nat.strong_induction_on with
  | h d ih =>
    obtain ⟨a, ha⟩ := hHD d
    have hs : ∃ b : ℤ,
        (∑ i ∈ Finset.range d, H.coeff i * D.coeff (d-i)) = (b : ℚ) := by
      apply integral_sum
      intro i hi
      obtain ⟨u, hu⟩ := ih i (Finset.mem_range.mp hi)
      obtain ⟨v, hv⟩ := hD (d-i)
      exact ⟨u*v, by simp [hu, hv]⟩
    obtain ⟨b, hb⟩ := hs
    rw [Polynomial.coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
      Finset.sum_range_succ, Nat.sub_self, h0, mul_one, hb] at ha
    refine ⟨a-b, ?_⟩
    push_cast
    linarith

theorem intCoeffs_one : IntCoeffs (1 : Polynomial ℚ) := by
  intro d
  by_cases hd : d = 0
  · subst d; exact ⟨1, by simp⟩
  · exact ⟨0, by simp [Polynomial.coeff_one, hd]⟩

theorem intCoeffs_sub {P Q : Polynomial ℚ} (hP : IntCoeffs P)
    (hQ : IntCoeffs Q) : IntCoeffs (P-Q) := by
  intro d
  obtain ⟨a, ha⟩ := hP d
  obtain ⟨b, hb⟩ := hQ d
  exact ⟨a-b, by simp [ha, hb]⟩

theorem intCoeffs_mul {P Q : Polynomial ℚ} (hP : IntCoeffs P)
    (hQ : IntCoeffs Q) : IntCoeffs (P*Q) := by
  classical
  intro d
  choose a ha using hP
  choose b hb using hQ
  exact ⟨∑ p ∈ Finset.antidiagonal d, a p.1 * b p.2,
    by simp [Polynomial.coeff_mul, ha, hb]⟩

theorem intCoeffs_X_pow (m : ℕ) : IntCoeffs ((Polynomial.X : Polynomial ℚ)^m) := by
  intro d
  by_cases hd : m = d
  · exact ⟨1, by simp [Polynomial.coeff_X_pow, hd]⟩
  · exact ⟨0, by simp [Polynomial.coeff_X_pow, Ne.symm hd]⟩

def S (m : ℕ) : Polynomial ℚ :=
  ∏ i ∈ Finset.range m, (1 - Polynomial.X^(i+1))

theorem S_integral (m : ℕ) : IntCoeffs (S m) := by
  induction m with
  | zero => simpa [S] using intCoeffs_one
  | succ m ih =>
    rw [S, Finset.prod_range_succ]
    exact intCoeffs_mul ih (intCoeffs_sub intCoeffs_one (intCoeffs_X_pow _))

theorem S_coeff_zero (m : ℕ) : (S m).coeff 0 = 1 := by
  induction m with
  | zero => simp [S]
  | succ m ih =>
    rw [S, Finset.prod_range_succ, Polynomial.mul_coeff_zero]
    change (S m).coeff 0 * (1 - (Polynomial.X : Polynomial ℚ)^(m+1)).coeff 0 = 1
    simp [ih, Polynomial.coeff_X_pow]

theorem iota_S (m : ℕ) : iota (S m) = T m := by
  simp [S, T, map_prod, map_sub, map_pow, q]

theorem quotient_integral (n k l : ℕ) (H : Polynomial ℚ)
    (hB : B n l ≠ 0) (hH : B n k = B n l * iota H) :
    ∀ d : ℕ, ∃ z : ℤ, H.coeff d = (z : ℚ) := by
  have hln : l ≤ n := by
    by_contra hn
    exact hB (by simp [B, hn])
  by_cases hkn : k ≤ n
  · have hcross : T n * (T l * T (n-l)) =
        (T n * iota H) * (T k * T (n-k)) := by
      simp only [B, if_pos hkn, if_pos hln] at hH
      rw [div_mul_eq_mul_div] at hH
      exact (div_eq_div_iff
        (mul_ne_zero (Matching.T_ne_zero k) (Matching.T_ne_zero (n-k)))
        (mul_ne_zero (Matching.T_ne_zero l) (Matching.T_ne_zero (n-l)))).mp hH
    have hcancel : iota H * (T k * T (n-k)) = T l * T (n-l) := by
      apply mul_left_cancel₀ (Matching.T_ne_zero n)
      simpa only [mul_assoc] using hcross.symm
    have hpoly : H * (S k * S (n-k)) = S l * S (n-l) := by
      apply Matching.iota_injective
      simpa only [map_mul, iota_S] using hcancel
    apply integral_of_mul (S k * S (n-k)) H
    · exact intCoeffs_mul (S_integral k) (S_integral (n-k))
    · rw [hpoly]
      exact intCoeffs_mul (S_integral l) (S_integral (n-l))
    · rw [Polynomial.mul_coeff_zero, S_coeff_zero, S_coeff_zero, one_mul]
  · have hi : iota H = 0 := by
      have hz : B n l * iota H = 0 := by simpa [B, hkn] using hH.symm
      exact (mul_eq_zero.mp hz).resolve_left hB
    have hzero : H = 0 := Matching.iota_injective (by simpa using hi)
    intro d
    exact ⟨0, by simp [hzero]⟩

/-- The remaining sign question, under precisely the original premises. -/
def CoefficientNonnegativity : Prop :=
  ∀ n k l : ℕ, ∀ H : Polynomial ℚ,
    B n l ≠ 0 → B n k = B n l * iota H → ∀ d : ℕ, 0 ≤ H.coeff d

/-- This implication retains the entire sign question as an antecedent. -/
theorem positivity_of_nonnegativity (hnonneg : CoefficientNonnegativity) :
    FullPositivity := by
  intro n k l H hB hH d
  obtain ⟨z, hz⟩ := quotient_integral n k l H hB hH d
  have hznonneg : (0 : ℤ) ≤ z := by
    have hq := hnonneg n k l H hB hH d
    rw [hz] at hq
    exact_mod_cast hq
  refine ⟨z.toNat, ?_⟩
  rw [hz]
  exact_mod_cast (Int.toNat_of_nonneg hznonneg).symm

end MathGKM.GaussianQuotient.Integrality
