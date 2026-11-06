import MathGKM.Round49DiagonalA
import MathGKM.Round36MarginalTargetA

/-! Machine-authored round49: finite-support integer encoding, no mass consumer. -/
namespace ActualDiagonalR49
noncomputable section

def encode (n i j : ℕ) : ℤ →₀ ℤ :=
  Finsupp.onFinset (Finset.Icc 0 (n : ℤ))
    (fun z => if 0 ≤ z ∧ z ≤ n then MidpointR36.W n i j z.toNat else 0)
    (by
      intro z hz
      by_contra hnot
      have hnot' : ¬(0 ≤ z ∧ z ≤ n) := by simpa only [Finset.mem_Icc] using hnot
      simp [hnot'] at hz)

theorem encode_apply (n i j : ℕ) (z : ℤ) :
    encode n i j z = if 0 ≤ z ∧ z ≤ n then MidpointR36.W n i j z.toNat else 0 := by
  rfl

theorem encode_nat (n i j s : ℕ) (hs : s ≤ n) :
    encode n i j s = MidpointR36.W n i j s := by simp [encode_apply,hs]

theorem encode_nonnegative (n i j : ℕ) (z : ℤ) : 0 ≤ encode n i j z := by
  rw [encode_apply]
  split_ifs
  · exact MidpointR36.W_nonnegative ..
  · omega

theorem diagonal_compatible (n i j : ℕ) (hn : 1 ≤ n) :
    MidpointMarginalR36.Compatible (encode n i (j+2)) (encode n (i+2) j)
      (encode n (i+1) (j+1)) := by
  refine ⟨encode_nonnegative n i (j+2),encode_nonnegative n (i+2) j,
    encode_nonnegative n (i+1) (j+1),?_⟩
  intro s t
  by_cases hs : 0 ≤ s ∧ s ≤ n
  · by_cases ht : 0 ≤ t ∧ t ≤ n
    · have hm : 0 ≤ (s+t)/2 ∧ (s+t)/2 ≤ n := by omega
      have hm' : 0 ≤ (s+t+1)/2 ∧ (s+t+1)/2 ≤ n := by omega
      simp only [encode_apply,if_pos hs,if_pos ht,if_pos hm,if_pos hm']
      have e0 : ((s+t)/2).toNat = (s.toNat+t.toNat)/2 := by omega
      have e1 : ((s+t+1)/2).toNat = (s.toNat+t.toNat+1)/2 := by omega
      rw [e0,e1]
      exact diagonal_all n i j s.toNat t.toNat hn
    · rw [encode_apply n (i+2) j t,if_neg ht,mul_zero]
      exact mul_nonneg (encode_nonnegative ..) (encode_nonnegative ..)
  · rw [encode_apply n i (j+2) s,if_neg hs,zero_mul]
    exact mul_nonneg (encode_nonnegative ..) (encode_nonnegative ..)
end
end ActualDiagonalR49

#print axioms ActualDiagonalR49.diagonal_compatible
