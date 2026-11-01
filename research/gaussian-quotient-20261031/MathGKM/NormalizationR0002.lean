import MathGKM.Accepted30cb1ba43f22bb0566e20763
import MathGKM.Accepted8d6330b3708d310a4b883202

noncomputable section
namespace MathGKM.GaussianQuotient.NormalizationR0002
open Polynomial IntervalBridgeR0000

/-- Polynomial factorial product; its image is the original `T`. -/
def P (m : ℕ) : Polynomial ℚ :=
  ∏ i ∈ Finset.range m, (1 - X ^ (i+1))

theorem image_P (m : ℕ) : iota (P m) = T m := by
  simp [P, T, q, map_prod, map_sub, map_pow]

theorem P_ne_zero (m : ℕ) : P m ≠ 0 := by
  intro h
  have := T_ne_zero m
  rw [← image_P, h, map_zero] at this
  exact this rfl

theorem degree_P (m : ℕ) : 2 * (P m).natDegree = m*(m+1) := by
  induction m with
  | zero => simp [P]
  | succ m ih =>
    have hf : (1-X^(m+1) : Polynomial ℚ) ≠ 0 := by
      intro h
      have := factor_ne_zero m
      apply this
      have he := congrArg iota h
      simpa [q, map_sub, map_pow] using he
    have hd : (1-X^(m+1) : Polynomial ℚ).natDegree = m+1 := by
      rw [natDegree_sub_eq_right_of_natDegree_lt (by simp)]
      simp
    have hp : P (m+1) = P m * (1-X^(m+1)) := by
      simp only [P, Finset.prod_range_succ]
    rw [hp, natDegree_mul (P_ne_zero _) hf, hd]
    nlinarith

theorem denominator_identity (n k l : ℕ) (H : Polynomial ℚ)
    (hk : k ≤ n) (hl : l ≤ n)
    (heq : B n k = B n l * iota H) :
    P l * P (n-l) = P k * P (n-k) * H := by
  apply iota_injective
  simp only [map_mul, image_P]
  simp only [B, if_pos hk, if_pos hl] at heq
  field_simp [T_ne_zero] at heq
  exact heq

theorem half_range_order (n k l : ℕ) (H : Polynomial ℚ)
    (hk : 2*k ≤ n) (hl : 2*l ≤ n)
    (heq : B n k = B n l * iota H) : l ≤ k := by
  have hkn : k ≤ n := by omega
  have hln : l ≤ n := by omega
  have hp := denominator_identity n k l H hkn hln heq
  have hd : (P k * P (n-k)).natDegree ≤ (P l * P (n-l)).natDegree :=
    natDegree_le_of_dvd ⟨H, hp⟩ (mul_ne_zero (P_ne_zero _) (P_ne_zero _))
  rw [natDegree_mul (P_ne_zero _) (P_ne_zero _),
    natDegree_mul (P_ne_zero _) (P_ne_zero _)] at hd
  have dk := degree_P k
  have dl := degree_P l
  have dnk := degree_P (n-k)
  have dnl := degree_P (n-l)
  have ek : n-k+k=n := Nat.sub_add_cancel hkn
  have el : n-l+l=n := Nat.sub_add_cancel hln
  by_contra h
  have hkl : k < l := by omega
  have hpos : 0 < (l-k)*(n-k-l) := Nat.mul_pos (by omega) (by omega)
  have ekl : l-k+k=l := Nat.sub_add_cancel hkl.le
  have en : n-k-l+l=n-k := Nat.sub_add_cancel (by omega)
  nlinarith

def folded (n k : ℕ) : ℕ := min k (n-k)

theorem B_folded (n k : ℕ) (hk : k ≤ n) : B n (folded n k) = B n k := by
  by_cases h : k ≤ n-k
  · simp only [folded, min_eq_left h]
  · simpa only [folded, min_eq_right (le_of_not_ge h)] using B_symmetry n k hk

theorem folded_half (n k : ℕ) (hk : k ≤ n) : 2*folded n k ≤ n := by
  unfold folded
  omega

/-- Both original premises, with the identical arbitrary polynomial, survive folding. -/
theorem normalize (n k l : ℕ) (H : Polynomial ℚ)
    (hk : k ≤ n) (hden : B n l ≠ 0) (heq : B n k = B n l * iota H) :
    let K := folded n k
    let L := folded n l
    2*K ≤ n ∧ 2*L ≤ n ∧ L ≤ K ∧ B n L ≠ 0 ∧
      B n K = B n L * iota H ∧ L+(K-L) ≤ n-K ∧
      F L (n-K) (K-L) = iota H := by
  have hl : l ≤ n := by
    by_contra h
    simp [B, h] at hden
  have hk' := folded_half n k hk
  have hl' := folded_half n l hl
  have hd : B n (folded n l) ≠ 0 := by rwa [B_folded n l hl]
  have he : B n (folded n k) = B n (folded n l) * iota H := by
    rwa [B_folded n k hk, B_folded n l hl]
  have horder := half_range_order n (folded n k) (folded n l) H hk' hl' he
  refine ⟨hk', hl', horder, hd, he, by omega, ?_⟩
  rw [← Accepted8d6330b3708d310a4b883202.obligation.1 n
    (folded n k) (folded n l) horder (by omega)]
  apply (div_eq_iff hd).mpr
  simpa [mul_comm] using he

def SeparatedPositivity : Prop :=
  ∀ a b r : ℕ, ∀ H : Polynomial ℚ,
    a+r ≤ b → F a b r = iota H → NatCoeffs H

theorem full_iff_separated : FullPositivity ↔ SeparatedPositivity := by
  constructor
  · intro hfull a b r H hsep he
    have hp := Accepted8d6330b3708d310a4b883202.obligation.2 a b r hsep
    have hd := B_ne_zero (a+b+r) a (by omega)
    apply hfull (a+b+r) (a+r) a H hd
    have he' : B (a+b+r) (a+r) / B (a+b+r) a = iota H := hp.2.2.2.trans he
    simpa [mul_comm] using (div_eq_iff hd).mp he'
  · intro hsep n k l H hd he
    by_cases hk : k ≤ n
    · have hn := normalize n k l H hk hd he
      exact hsep (folded n l) (n-folded n k) (folded n k-folded n l) H
        hn.2.2.2.2.2.1 hn.2.2.2.2.2.2
    · exact Accepted30cb1ba43f22bb0566e20763.obligation n k l H hd he
        (Or.inl (by omega))

end MathGKM.GaussianQuotient.NormalizationR0002
