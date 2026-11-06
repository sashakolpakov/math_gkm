import Mathlib

/-! Machine-authored round72. The committed guarded color-count kernel.
This module asserts no universal coefficient-counting identity or original inequality.
The natural p coordinate is extended by zero to the integers.
-/
namespace ParityKernelR72
open scoped BigOperators

def W (g t : ℕ) : ℕ :=
  if g = 0 then if t = 0 then 1 else 0 else (t+g-1).choose t

def slots (m sigma c : ℕ) : ℕ :=
  ((Finset.range (m+1)).filter (fun r => (r+sigma)%2=c)).card

def K (N sigma i j : ℕ) (p : ℤ) : ℤ :=
  if 0 ≤ p ∧ i+j ≤ N then
    let k := N-i-j
    let a := p.toNat
    if 2*k ≤ N ∧ a ≤ k ∧ a ≤ i ∧ k-a ≤ j then
      let m := N-2*k
      (W (slots m sigma 0) a * W (slots m sigma 1) (k-a) * m.choose (i-a) : ℕ)
    else 0
  else 0

def MidpointPrediction : Prop :=
  ∀ N sigma i j : ℕ, sigma ≤ 1 → ∀ s t : ℤ,
    K N sigma i j s * K N sigma (i+2) j t ≤
      K N sigma (i+1) j ((s+t)/2) * K N sigma (i+1) j ((s+t+1)/2)

theorem kernel_nonnegative (N sigma i j : ℕ) (p : ℤ) : 0 ≤ K N sigma i j p := by
  unfold K
  split_ifs <;> positivity

theorem kernel_zero_negative (N sigma i j : ℕ) (p : ℤ) (hp : p < 0) :
    K N sigma i j p = 0 := by
  simp [K, show ¬ 0 ≤ p by omega]

theorem kernel_zero_tail (N sigma i j : ℕ) (p : ℤ) (hp : (N : ℤ) < p) :
    K N sigma i j p = 0 := by
  have hnat : N < p.toNat := by omega
  unfold K
  split
  · dsimp
    rw [if_neg (by omega)]
  · rfl

theorem kernel_zero_degree (N sigma i j : ℕ) (p : ℤ) (h : N < i+j) :
    K N sigma i j p = 0 := by
  simp [K, show ¬ i+j ≤ N by omega]

theorem exact_separator :
    K 10 1 0 5 0 = 1 ∧ K 10 1 2 5 1 = 48 ∧
    K 10 1 1 5 0 = 10 ∧ K 10 1 1 5 1 = 4 ∧
    ((0+1 : ℤ)/2 = 0) ∧ ((0+1+1 : ℤ)/2 = 1) ∧
    K 10 1 0 5 0 * K 10 1 2 5 1 >
      K 10 1 1 5 ((0+1)/2) * K 10 1 1 5 ((0+1+1)/2) ∧
    (∑ p ∈ Finset.range 11, K 10 1 0 5 (p : ℤ)) = 1 ∧
    (∑ p ∈ Finset.range 11, K 10 1 1 5 (p : ℤ)) = 14 ∧
    (∑ p ∈ Finset.range 11, K 10 1 2 5 (p : ℤ)) = 117 ∧
    (14 : ℤ)^2-1*117 = 79 := by
  decide

theorem midpoint_prediction_false : ¬ MidpointPrediction := by
  intro h
  have hi := h 10 1 0 5 (by decide) 0 1
  have hs := exact_separator
  norm_num [hs.1, hs.2.1, hs.2.2.1, hs.2.2.2.1] at hi

end ParityKernelR72

#print axioms ParityKernelR72.kernel_nonnegative
#print axioms ParityKernelR72.kernel_zero_tail
#print axioms ParityKernelR72.exact_separator
#print axioms ParityKernelR72.midpoint_prediction_false
