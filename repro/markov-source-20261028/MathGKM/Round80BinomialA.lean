import Mathlib

/- Machine-authored round80. Generic conditional transport, independent of matchings.
No assertion of actual gamma nonnegativity is used or proved. -/
namespace SymmetricBinomialR80
open scoped BigOperators
open Polynomial
noncomputable section

def block (L k : ℕ) : Polynomial ℤ := X^k*(1+X)^(L-2*k)
def weight (L k r : ℕ) : ℕ :=
  if k≤r ∧ r≤L-k then (L-2*k).choose (r-k) else 0
def expansion (L : ℕ) (gamma : ℕ → ℤ) : Polynomial ℤ :=
  ∑ k ∈ Finset.range (L/2+1), C (gamma k)*block L k

theorem block_coeff (L k r : ℕ) (hk : 2*k≤L) :
    (block L k).coeff r = (weight L k r : ℤ) := by
  rw [block, coeff_X_pow_mul']
  by_cases hkr : k≤r
  · rw [if_pos hkr, coeff_one_add_X_pow]
    by_cases hr : r≤L-k
    · simp [weight,hkr,hr]
    · have hz : L-2*k<r-k := by omega
      simp [weight,hkr,hr,Nat.choose_eq_zero_of_lt hz]
  · simp [weight,hkr]

theorem weight_symm (L k r : ℕ) (hk : 2*k≤L) (hr : r≤L) :
    weight L k r = weight L k (L-r) := by
  by_cases hs : k≤r ∧ r≤L-k
  · have ht : k≤L-r ∧ L-r≤L-k := by omega
    have hn : r-k≤L-2*k := by omega
    have he : L-r-k = (L-2*k)-(r-k) := by omega
    simp only [weight,if_pos hs,if_pos ht,he]
    exact (Nat.choose_symm hn).symm
  · have ht : ¬(k≤L-r ∧ L-r≤L-k) := by omega
    simp only [weight,if_neg hs,if_neg ht]

theorem choose_step (n r : ℕ) (hr : 2*r<n) : n.choose r≤n.choose (r+1) := by
  by_cases hh : r<n/2
  · exact Nat.choose_le_succ_of_lt_half_left hh
  · have he : n=r+(r+1) := by omega
    exact le_of_eq (Nat.choose_symm_of_eq_add he)

theorem weight_step (L k r : ℕ) (hk : 2*k≤L) (hr : 2*r<L) :
    weight L k r ≤ weight L k (r+1) := by
  by_cases hkr : k≤r
  · have hs : k≤r ∧ r≤L-k := by omega
    have ht : k≤r+1 ∧ r+1≤L-k := by omega
    simp only [weight,if_pos hs,if_pos ht]
    have he : r+1-k=(r-k)+1 := by omega
    rw [he]
    apply choose_step
    omega
  · have hs : ¬(k≤r ∧ r≤L-k) := by omega
    simp only [weight,if_neg hs]
    exact Nat.zero_le _

theorem expansion_coeff (L : ℕ) (gamma : ℕ → ℤ) (r : ℕ) :
    (expansion L gamma).coeff r =
      ∑ k ∈ Finset.range (L/2+1), gamma k*(weight L k r : ℤ) := by
  simp only [expansion,finsetSum_coeff,coeff_C_mul]
  apply Finset.sum_congr rfl
  intro k hk
  rw [block_coeff L k r (by have := Finset.mem_range.mp hk; omega)]

theorem transport (L : ℕ) (gamma : ℕ → ℤ) (H : Polynomial ℤ)
    (hexp : H=expansion L gamma)
    (hnn : ∀ k, k≤L/2 → 0≤gamma k) :
    (∀ r, r≤L → H.coeff r=H.coeff (L-r)) ∧
    (∀ r, 2*r<L → H.coeff r≤H.coeff (r+1)) ∧
    (∀ r, L<r → H.coeff r=0) := by
  subst H
  refine ⟨?_,?_,?_⟩
  · intro r hr
    simp only [expansion_coeff]
    apply Finset.sum_congr rfl
    intro k hk
    rw [weight_symm L k r (by have := Finset.mem_range.mp hk; omega) hr]
  · intro r hr
    simp only [expansion_coeff]
    apply Finset.sum_le_sum
    intro k hk
    have hkb : k≤L/2 := by have := Finset.mem_range.mp hk; omega
    apply mul_le_mul_of_nonneg_left _ (hnn k hkb)
    exact_mod_cast weight_step L k r (by omega) hr
  · intro r hr
    rw [expansion_coeff]
    apply Finset.sum_eq_zero
    intro k hk
    have hs : ¬(k≤r ∧ r≤L-k) := by omega
    simp [weight,hs]

end
end SymmetricBinomialR80
