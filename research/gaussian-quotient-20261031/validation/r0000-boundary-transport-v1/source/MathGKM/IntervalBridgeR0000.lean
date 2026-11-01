import MathGKM.GaussianQuotient
import MathGKM.ResearchSemantics
import Mathlib.Tactic

noncomputable section
namespace MathGKM.GaussianQuotient.IntervalBridgeR0000

def W (a r : ℕ) : RatFunc ℚ :=
  ∏ i ∈ Finset.range r, (1 - q ^ (a + i + 1))

def F (a b r : ℕ) : RatFunc ℚ := W b r / W a r

theorem iota_injective : Function.Injective iota := RatFunc.algebraMap_injective ℚ

theorem factor_ne_zero (i : ℕ) : (1 - q ^ (i + 1) : RatFunc ℚ) ≠ 0 := by
  intro h
  have hp : (1 - Polynomial.X ^ (i+1) : Polynomial ℚ) = 0 := by
    apply iota_injective
    simpa [q, map_sub, map_pow] using h
  have hc := congrArg (fun p : Polynomial ℚ => p.coeff 0) hp
  simp at hc

theorem T_ne_zero (m : ℕ) : T m ≠ 0 := by
  apply Finset.prod_ne_zero_iff.mpr
  intro i hi
  exact factor_ne_zero i

theorem B_ne_zero (n k : ℕ) (hk : k ≤ n) : B n k ≠ 0 := by
  simp only [B, if_pos hk]
  exact div_ne_zero (T_ne_zero _) (mul_ne_zero (T_ne_zero _) (T_ne_zero _))

theorem B_symmetry (n k : ℕ) (hk : k ≤ n) : B n (n-k) = B n k := by
  simp only [B, if_pos hk, if_pos (Nat.sub_le n k), Nat.sub_sub_self hk]
  rw [mul_comm (T (n-k))]

theorem T_add (a r : ℕ) : T (a+r) = T a * W a r := by
  simp only [T, W, Finset.prod_range_add]

theorem interval_identity (n k l : ℕ) (hlk : l ≤ k) (hkn : k ≤ n) :
    B n k / B n l = F l (n-k) (k-l) := by
  have hln : l ≤ n := le_trans hlk hkn
  have h1 : l + (k-l) = k := Nat.add_sub_of_le hlk
  have h2 : n-k+(k-l) = n-l := by omega
  have ht1 : T k = T l * W l (k-l) := by simpa only [h1] using T_add l (k-l)
  have ht2 : T (n-l) = T (n-k) * W (n-k) (k-l) := by
    rw [← h2]; exact T_add _ _
  have hw : W l (k-l) ≠ 0 := by
    intro h
    have := T_ne_zero k
    rw [ht1, h, mul_zero] at this
    exact this rfl
  simp only [B, if_pos hkn, if_pos hln, F]
  rw [ht1, ht2]
  field_simp [T_ne_zero, hw]

theorem natCoeffs_zero : NatCoeffs 0 := by
  intro d
  exact ⟨0, by simp⟩

theorem natCoeffs_one : NatCoeffs 1 := by
  intro d
  by_cases h : d=0
  · exact ⟨1, by simp [h]⟩
  · exact ⟨0, by simp [Polynomial.coeff_one, h]⟩

theorem separated_parameters (a b r : ℕ) (hsep : a+r ≤ b) :
    a ≤ a+r ∧ a+r ≤ a+b+r ∧ 2*(a+r) ≤ a+b+r ∧
      B (a+b+r) (a+r) / B (a+b+r) a = F a b r := by
  refine ⟨by omega, by omega, by omega, ?_⟩
  have h := interval_identity (a+b+r) (a+r) a (by omega) (by omega)
  simpa only [show a+b+r-(a+r)=b by omega, show a+r-a=r by omega] using h

theorem interval_correspondence :
    (∀ n k l : ℕ, l ≤ k → k ≤ n → B n k / B n l = F l (n-k) (k-l)) ∧
    (∀ a b r : ℕ, a+r ≤ b →
      a ≤ a+r ∧ a+r ≤ a+b+r ∧ 2*(a+r) ≤ a+b+r ∧
        B (a+b+r) (a+r) / B (a+b+r) a = F a b r) :=
  ⟨interval_identity, separated_parameters⟩

theorem boundary_transport (n k l : ℕ) (H : Polynomial ℚ)
    (hden : B n l ≠ 0) (heq : B n k = B n l * iota H)
    (hcase : n < k ∨ k=l ∨ (l ≤ n ∧ k=n-l)) : NatCoeffs H := by
  rcases hcase with hk | hk | ⟨hl, hk⟩
  · have hz : B n k = 0 := by simp [B, Nat.not_le.mpr hk]
    have hi : iota H = 0 := (mul_eq_zero.mp (heq.symm.trans hz)).resolve_left hden
    have hp : H = 0 := iota_injective (by simpa using hi)
    simpa [hp] using natCoeffs_zero
  · subst k
    have hi : iota H = 1 := (mul_left_cancel₀ hden (by simpa using heq.symm))
    have hp : H = 1 := iota_injective (by simpa using hi)
    simpa [hp] using natCoeffs_one
  · subst k
    have hb := B_symmetry n l hl
    have hi : iota H = 1 := mul_left_cancel₀ hden (by simpa [hb] using heq.symm)
    have hp : H = 1 := iota_injective (by simpa using hi)
    simpa [hp] using natCoeffs_one

end MathGKM.GaussianQuotient.IntervalBridgeR0000
