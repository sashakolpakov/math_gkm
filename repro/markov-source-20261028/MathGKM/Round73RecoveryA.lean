import MathGKM.Round73EncodingA
import MathGKM.Round64ProjectionA

/-! Machine-authored round73. Counting is a proposition, not a proved theorem.
The recovery theorem below retains precisely that coefficient premise. -/
namespace KernelRecoveryR73
open scoped BigOperators
open KernelEncodingR73 MatchingProjectionR64
noncomputable section

def Counting : Prop := ∀ N sigma i j : ℕ, sigma ≤ 1 → ∀ a b : ℕ,
  ((B N sigma i j).coeff a).coeff b =
    if i+j+a+b=N ∧ 2*(a+b)≤N then ParityKernelR72.K N sigma i j (a : ℤ) else 0

def P (N sigma i j : ℕ) : Color :=
  ∑ a ∈ Finset.range (N+1), Polynomial.monomial a
    (Polynomial.monomial (N-i-j-a) (ParityKernelR72.K N sigma i j a))

theorem kernel_guards (N sigma i j a : ℕ)
    (h : ParityKernelR72.K N sigma i j (a : ℤ) ≠ 0) :
    i+j ≤ N ∧ 2*(N-i-j) ≤ N ∧ a ≤ N-i-j := by
  unfold ParityKernelR72.K at h
  split at h
  · dsimp at h
    split at h
    · simp_all
    · contradiction
  · contradiction

theorem presentation_coeff (N sigma i j a b : ℕ) :
    ((P N sigma i j).coeff a).coeff b =
      if i+j+a+b=N ∧ 2*(a+b)≤N then ParityKernelR72.K N sigma i j a else 0 := by
  classical
  by_cases ha : a < N+1
  · simp only [P, Polynomial.finset_sum_coeff]
    rw [Finset.sum_eq_single a]
    · simp only [Polynomial.coeff_monomial, ite_true]
      by_cases hk : ParityKernelR72.K N sigma i j (a : ℤ) = 0
      · simp [hk]
      · obtain ⟨hij,h2,hak⟩ := kernel_guards N sigma i j a hk
        have he : (N-i-j-a=b) ↔ (i+j+a+b=N ∧ 2*(a+b)≤N) := by omega
        simp only [he]
    · intro c hc hne
      simp [Polynomial.coeff_monomial, hne, Ne.symm hne]
    · intro h
      exact (h (Finset.mem_range.mpr ha)).elim
  · have hk := Acceptedfe87f36f66f96dc807b0faf3.obligation.2.2.1 N sigma i j (a : ℤ)
      (by omega)
    have hf : ¬(i+j+a+b=N ∧ 2*(a+b)≤N) := by omega
    simp only [P, Polynomial.finset_sum_coeff]
    rw [if_neg hf]
    apply Finset.sum_eq_zero
    intro c hc
    have hne : c ≠ a := by have := Finset.mem_range.mp hc; omega
    simp [Polynomial.coeff_monomial,hne,Ne.symm hne]

theorem recovery (hc : Counting) (N sigma i j : ℕ) (hs : sigma ≤ 1) :
    MidpointMarginalR36.mass (E N sigma i j) = unit (B N sigma i j) := by
  have he : B N sigma i j = P N sigma i j := by
    apply Polynomial.ext
    intro a
    apply Polynomial.ext
    intro b
    rw [presentation_coeff, hc N sigma i j hs a b]
  rw [he, KernelEncodingR73.mass]
  simp [P, unit, Polynomial.eval_monomial]
end
end KernelRecoveryR73

#print axioms KernelRecoveryR73.recovery
