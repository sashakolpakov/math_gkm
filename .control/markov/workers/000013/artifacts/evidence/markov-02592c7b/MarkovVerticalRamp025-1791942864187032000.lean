import MarkovCross774
import MarkovHorizontalLCB46

/-! Machine-authored request 02592c7b. A variable-length residual inequality.
This module does not assume or prove its identification with a source row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def rampSeq025 (a r : ℝ) (q : ℕ) (k : ℤ) : ℝ :=
  if 0 ≤ k ∧ k < q then 4*(a*k+r)
  else if k=q then 3*(a*q+r)-1
  else if k=q+1 then a*(q+1)+r-1 else 0

theorem ramp_nonneg025 (a r : ℝ) (q : ℕ)
    (ha : 3 ≤ a) (hr : 0 ≤ r) (hq : 1 ≤ q) (k : ℤ) :
    0 ≤ rampSeq025 a r q k := by
  have hq' : (1:ℝ) ≤ q := by exact_mod_cast hq
  unfold rampSeq025
  split_ifs with hk he he
  · have hk' : (0:ℝ) ≤ k := by exact_mod_cast hk.1
    positivity
  · nlinarith
  · nlinarith
  · rfl

theorem ramp_pos025 (a r : ℝ) (q : ℕ)
    (ha : 3 ≤ a) (hr : 0 ≤ r) (hq : 1 ≤ q) (k : ℤ)
    (hk : 1 ≤ k ∧ k ≤ q+1) : 0 < rampSeq025 a r q k := by
  have hq' : (1:ℝ) ≤ q := by exact_mod_cast hq
  have hk' : (1:ℝ) ≤ k := by exact_mod_cast hk.1
  unfold rampSeq025
  split_ifs with h he he
  · nlinarith
  · nlinarith
  · nlinarith
  · omega

theorem ramp_zero025 (a r : ℝ) (q : ℕ) (k : ℤ)
    (hk : k<0 ∨ q+1<k) : rampSeq025 a r q k=0 := by
  unfold rampSeq025
  split_ifs <;> first | omega | rfl

theorem ramp_adjacent025 (a r : ℝ) (q : ℕ)
    (ha : 3 ≤ a) (hr : 0 ≤ r) (hq : 1 ≤ q) (k : ℤ) :
    rampSeq025 a r q (k-1)*rampSeq025 a r q (k+1) ≤
      rampSeq025 a r q k^2 := by
  by_cases hk0 : k ≤ 0
  · rw [ramp_zero025 a r q (k-1) (Or.inl (by omega)),zero_mul]
    exact sq_nonneg _
  by_cases hkl : q+1 ≤ k
  · rw [ramp_zero025 a r q (k+1) (Or.inr (by omega)),mul_zero]
    exact sq_nonneg _
  have hq' : (1:ℝ) ≤ q := by exact_mod_cast hq
  have hk' : (1:ℝ) ≤ k := by exact_mod_cast (show (1:ℤ) ≤ k by omega)
  by_cases hlast : k=q
  · subst k
    simp only [rampSeq025]
    simp only [show 0 ≤ (q:ℤ)-1 ∧ (q:ℤ)-1<q by omega,
      show ¬ (0 ≤ (q:ℤ)+1 ∧ (q:ℤ)+1<q) by omega,
      show (q:ℤ)+1 ≠ q by omega,show ¬ (0 ≤ (q:ℤ) ∧ (q:ℤ)<q) by omega,
      if_true,if_false]
    push_cast
    have hb : a ≤ a*q+r := by nlinarith
    have hc : 0 ≤ (a*q+r-a) := by linarith
    have cert : 0 ≤ (3*(a*q+r)-1)^2-
        4*(a*((q:ℝ)-1)+r)*(a*((q:ℝ)+1)+r-1) := by
      have h1 : 0 ≤ a*q+r := by nlinarith
      nlinarith [sq_nonneg (a*q+r),sq_nonneg a,
        mul_nonneg (show 0 ≤ a*q+r-1 by nlinarith)
          (show 0 ≤ a*q+r-1 by nlinarith)]
    linarith
  by_cases hpen : k+1=q
  · have he : (q:ℝ)=(k:ℝ)+1 := by exact_mod_cast hpen.symm
    have hez : (q:ℤ)=k+1 := hpen.symm
    simp only [rampSeq025]
    simp only [show 0 ≤ k-1 ∧ k-1<q by omega,
      show ¬ (0 ≤ k+1 ∧ k+1<q) by omega,
      show 0 ≤ k ∧ k<q by omega,hpen,if_true,if_false]
    push_cast
    rw [he]
    have hprod : 0 ≤ a*(k-1)+r := by nlinarith
    nlinarith [sq_nonneg (a*k+r),sq_nonneg a]
  · have h1 : 0 ≤ k-1 ∧ k-1<q := by omega
    have h2 : 0 ≤ k+1 ∧ k+1<q := by omega
    have h3 : 0 ≤ k ∧ k<q := by omega
    simp only [rampSeq025,h1,h2,h3,if_true]
    push_cast
    nlinarith [sq_nonneg a]

theorem ramp_crossLC025 (a r : ℝ) (q : ℕ)
    (ha : 3 ≤ a) (hr : 0 ≤ r) (hq : 1 ≤ q) :
    CrossLC (rampSeq025 a r q) := by
  apply crossLC_of_adjacent_interval774 _ (ramp_nonneg025 a r q ha hr hq)
    (ramp_adjacent025 a r q ha hr hq)
  intro i k j hik hkj hi hj
  have hi0 : 0 ≤ i := by
    by_contra h; rw [ramp_zero025 a r q i (Or.inl (by omega))] at hi; linarith
  have hjq : j ≤ q+1 := by
    by_contra h; rw [ramp_zero025 a r q j (Or.inr (by omega))] at hj; linarith
  by_cases hk : k=0
  · have he : i=0 := by omega
    simpa [hk,he] using hi
  · exact ramp_pos025 a r q ha hr hq k (by omega)

#print axioms ramp_adjacent025
#print axioms ramp_crossLC025
end
end MathGKM.Markov
