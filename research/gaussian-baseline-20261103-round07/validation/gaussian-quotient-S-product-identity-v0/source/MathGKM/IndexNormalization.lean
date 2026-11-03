import MathGKM.LowDegreeSign
import MathGKM.Targetb813d299f003eeaf015fdd49

noncomputable section
open scoped BigOperators
namespace MathGKM.GaussianQuotient.IndexNormalization
open Polynomial
open MathGKM.GaussianQuotient
open MathGKM.GaussianQuotient.Integrality

theorem B_symm (n j : ℕ) (hj : j ≤ n) : B n j = B n (n-j) := by
  simp only [B, if_pos hj, if_pos (Nat.sub_le n j), Nat.sub_sub_self hj]
  rw [mul_comm (T j)]

theorem denominator_in_range (n l : ℕ) (hB : B n l ≠ 0) : l ≤ n := by
  by_contra hn
  exact hB (by simp [B, hn])

theorem B_ne_zero (n j : ℕ) (hj : j ≤ n) : B n j ≠ 0 := by
  simpa only [B, if_pos hj] using
    div_ne_zero (Matching.T_ne_zero n)
      (mul_ne_zero (Matching.T_ne_zero j) (Matching.T_ne_zero (n-j)))

theorem quotient_zero_out_of_range (n k l : ℕ) (hk : n < k)
    (H : Polynomial ℚ) (hB : B n l ≠ 0)
    (hH : B n k = B n l * iota H) : H = 0 := by
  have hi : iota H = 0 := by
    have hz : B n l * iota H = 0 := by simpa [B, Nat.not_le.mpr hk] using hH.symm
    exact (mul_eq_zero.mp hz).resolve_left hB
  exact Matching.iota_injective (by simpa using hi)

theorem quotient_product (n k l : ℕ) (hkn : k ≤ n) (H : Polynomial ℚ)
    (hB : B n l ≠ 0) (hH : B n k = B n l * iota H) :
    H * (S k * S (n-k)) = S l * S (n-l) := by
  have hln := denominator_in_range n l hB
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
  apply Matching.iota_injective
  simpa only [map_mul, iota_S] using hcancel

theorem S_ne_zero (m : ℕ) : S m ≠ 0 := by
  intro hz
  have hc := congrArg (fun P : Polynomial ℚ => P.coeff 0) hz
  simpa only [S_coeff_zero, coeff_zero, zero_ne_one, one_ne_zero] using hc

theorem factor_ne_zero (m : ℕ) (hm : 0 < m) :
    (1 - (X : Polynomial ℚ)^m) ≠ 0 := by
  intro hz
  have hc := congrArg (fun P : Polynomial ℚ => P.coeff 0) hz
  simp [Polynomial.coeff_X_pow, Nat.ne_of_lt hm] at hc

theorem S_degree_twice (m : ℕ) : 2 * (S m).natDegree = m * (m+1) := by
  induction m with
  | zero => simp [S]
  | succ m ih =>
    have hs : S (m+1) = S m * (1 - (X : Polynomial ℚ)^(m+1)) := by
      simp only [S, Finset.prod_range_succ]
    have hf : (1 - (X : Polynomial ℚ)^(m+1)).natDegree = m+1 := by
      rw [natDegree_sub_eq_right_of_natDegree_lt (by simp)]
      simp
    rw [hs, natDegree_mul (S_ne_zero m) (factor_ne_zero (m+1) (by omega)), hf]
    nlinarith

theorem quotient_ne_zero (n k l : ℕ) (hkn : k ≤ n) (H : Polynomial ℚ)
    (hB : B n l ≠ 0) (hH : B n k = B n l * iota H) : H ≠ 0 := by
  intro hz
  have hp := quotient_product n k l hkn H hB hH
  rw [hz, zero_mul] at hp
  exact mul_ne_zero (S_ne_zero l) (S_ne_zero (n-l)) hp.symm

theorem quotient_degree (n k l : ℕ) (hkn : k ≤ n) (H : Polynomial ℚ)
    (hB : B n l ≠ 0) (hH : B n k = B n l * iota H) :
    H.natDegree + l*(n-l) = k*(n-k) := by
  have hln := denominator_in_range n l hB
  have hp := congrArg (fun P : Polynomial ℚ => P.natDegree)
    (quotient_product n k l hkn H hB hH)
  rw [natDegree_mul (quotient_ne_zero n k l hkn H hB hH)
    (mul_ne_zero (S_ne_zero k) (S_ne_zero (n-k))),
    natDegree_mul (S_ne_zero k) (S_ne_zero (n-k)),
    natDegree_mul (S_ne_zero l) (S_ne_zero (n-l))] at hp
  have hkadd : k + (n-k) = n := Nat.add_sub_of_le hkn
  have hladd : l + (n-l) = n := Nat.add_sub_of_le hln
  have hdk := S_degree_twice k
  have hdnk := S_degree_twice (n-k)
  have hdl := S_degree_twice l
  have hdnl := S_degree_twice (n-l)
  nlinarith

theorem B_min (n j : ℕ) (hj : j ≤ n) : B n (min j (n-j)) = B n j := by
  rcases le_total j (n-j) with h | h
  · rw [min_eq_left h]
  · rw [min_eq_right h]
    exact (B_symm n j hj).symm

theorem min_half (n j : ℕ) : 2 * min j (n-j) ≤ n := by
  omega

theorem lower_half_order (n a b : ℕ) (ha : 2*a ≤ n) (hb : 2*b ≤ n)
    (hab : a*(n-a) ≤ b*(n-b)) : a ≤ b := by
  by_contra h
  have hba : b < a := by omega
  have haadd : a + (n-a) = n := Nat.add_sub_of_le (by omega)
  have hbadd : b + (n-b) = n := Nat.add_sub_of_le (by omega)
  have hdiff : a-b > 0 := by omega
  have hrest : n-a-b > 0 := by omega
  have hdiffadd : b + (a-b) = a := Nat.add_sub_of_le (by omega)
  have hrestadd : a+b+(n-a-b) = n := by omega
  have hp := Nat.mul_pos hdiff hrest
  nlinarith

theorem normalize (n k l : ℕ) (hkn : k ≤ n) (H : Polynomial ℚ)
    (hB : B n l ≠ 0) (hH : B n k = B n l * iota H) :
    min l (n-l) ≤ min k (n-k) ∧ 2 * min k (n-k) ≤ n ∧
    B n (min l (n-l)) ≠ 0 ∧
    B n (min k (n-k)) = B n (min l (n-l)) * iota H := by
  have hln := denominator_in_range n l hB
  have hB' : B n (min l (n-l)) ≠ 0 := by rwa [B_min n l hln]
  have hH' : B n (min k (n-k)) = B n (min l (n-l)) * iota H := by
    rwa [B_min n k hkn, B_min n l hln]
  have hd := quotient_degree n (min k (n-k)) (min l (n-l))
    (le_trans (min_le_left _ _) hkn) H hB' hH'
  refine ⟨lower_half_order n _ _ (min_half n l) (min_half n k) (by omega),
    min_half n k, hB', hH'⟩

/-- All remaining normalized lower-half signs after the proved low band. -/
def MiddleNonnegativity : Prop :=
  ∀ n k l : ℕ, l ≤ k → 2*k ≤ n → ∀ H : Polynomial ℚ,
    B n l ≠ 0 → B n k = B n l * iota H →
    ∀ d : ℕ, n-k < d → 2*d ≤ H.natDegree → 0 ≤ H.coeff d

/-- The exact existing lower-half node, with the whole remaining middle band
retained as an open antecedent. -/
theorem lower_half_of_middle (hmiddle : MiddleNonnegativity) :
    MathGKM.Targetb813d299f003eeaf015fdd49.Residual0 := by
  intro n k l H hB hH d hhalf
  by_cases hkn : k ≤ n
  · obtain ⟨hlk', hkhalf', hB', hH'⟩ := normalize n k l hkn H hB hH
    by_cases hd : d ≤ n - min k (n-k)
    · obtain ⟨a, ha⟩ := LowDegree.quotient_coeff_nat n (min k (n-k)) (min l (n-l))
        hlk' (by omega) H hB' hH' d hd
      rw [ha]
      exact Nat.cast_nonneg a
    · exact hmiddle n (min k (n-k)) (min l (n-l)) hlk' hkhalf' H hB' hH'
        d (by omega) hhalf
  · rw [quotient_zero_out_of_range n k l (by omega) H hB hH]
    simp

end MathGKM.GaussianQuotient.IndexNormalization
