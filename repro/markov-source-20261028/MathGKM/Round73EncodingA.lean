import MathGKM.Acceptedfe87f36f66f96dc807b0faf3
import MathGKM.Round36MarginalTargetA

/-! Machine-authored round73: exact finite-support encoding, without counting recovery. -/
namespace KernelEncodingR73
open scoped BigOperators
noncomputable section

def E (N sigma i j : ℕ) : ℤ →₀ ℤ :=
  ∑ p ∈ Finset.range (N+1), Finsupp.single (p : ℤ) (ParityKernelR72.K N sigma i j p)

theorem evaluation (N sigma i j : ℕ) (z : ℤ) :
    E N sigma i j z = ParityKernelR72.K N sigma i j z := by
  classical
  by_cases hz : 0 ≤ z ∧ z ≤ N
  · have he : (z.toNat : ℤ) = z := by omega
    have hm : z.toNat ∈ Finset.range (N+1) := by simp; omega
    simp only [E, Finsupp.finset_sum_apply]
    rw [Finset.sum_eq_single z.toNat]
    · simp [he]
    · intro b hb hne
      have hne' : (b : ℤ) ≠ z := by omega
      simp [Finsupp.single_apply, hne', Ne.symm hne']
    · exact fun h => (h hm).elim
  · have hk : ParityKernelR72.K N sigma i j z = 0 := by
      by_cases hneg : z < 0
      · exact Acceptedfe87f36f66f96dc807b0faf3.obligation.2.1 N sigma i j z hneg
      · exact Acceptedfe87f36f66f96dc807b0faf3.obligation.2.2.1 N sigma i j z (by omega)
    rw [hk]
    simp only [E, Finsupp.finset_sum_apply]
    apply Finset.sum_eq_zero
    intro b hb
    have hb' : b < N+1 := Finset.mem_range.mp hb
    have hne : (b : ℤ) ≠ z := by omega
    simp [Finsupp.single_apply, hne, Ne.symm hne]

theorem support (N sigma i j : ℕ) :
    (E N sigma i j).support ⊆ Finset.Icc 0 (N : ℤ) := by
  intro z hz
  have hn := Finsupp.mem_support_iff.mp hz
  rw [evaluation] at hn
  simp only [Finset.mem_Icc]
  constructor
  · by_contra h
    exact hn (Acceptedfe87f36f66f96dc807b0faf3.obligation.2.1 N sigma i j z (by omega))
  · by_contra h
    exact hn (Acceptedfe87f36f66f96dc807b0faf3.obligation.2.2.1 N sigma i j z (by omega))

theorem mass (N sigma i j : ℕ) :
    MidpointMarginalR36.mass (E N sigma i j) =
      ∑ p ∈ Finset.range (N+1), ParityKernelR72.K N sigma i j (p : ℤ) := by
  classical
  unfold MidpointMarginalR36.mass E
  rw [← Finsupp.sum_finsetSum_index]
  · simp
  · intros; rfl
  · intros; rfl
end
end KernelEncodingR73

#print axioms KernelEncodingR73.evaluation
#print axioms KernelEncodingR73.mass
