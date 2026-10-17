import MarkovWeightRepresentationMA45
/-! Machine-authored beca0ad5. Log-concavity of arbitrary weights does not
imply the auxiliary ordered convolution condition. Not a source counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

def badWeightMBEC (k : ℤ) : ℝ :=
 if k=0 then 1 else if k=1 then 3 else if k=2 then 9 else if k=3 then 1 else 0

theorem bad_weight_nonnegMBEC (k : ℤ) : 0≤badWeightMBEC k := by
 unfold badWeightMBEC
 split_ifs <;> norm_num

theorem bad_weight_crossLCMBEC : CrossLC badWeightMBEC := by
 intro i j hij
 by_cases hi : 0≤i ∧ i≤3
 · by_cases hj : -1≤j ∧ j≤2
   · obtain ⟨hi0,hi3⟩ := hi
     obtain ⟨hj0,hj2⟩ := hj
     interval_cases i <;> interval_cases j <;> norm_num [badWeightMBEC] at *
   · have hz : badWeightMBEC (j+1)=0 := by
       simp only [badWeightMBEC]; split_ifs <;> first | omega | rfl
     rw [hz,mul_zero]
     exact mul_nonneg (bad_weight_nonnegMBEC _) (bad_weight_nonnegMBEC _)
 · have hz : badWeightMBEC i=0 := by
     simp only [badWeightMBEC]; split_ifs <;> first | omega | rfl
   rw [hz,zero_mul]
   exact mul_nonneg (bad_weight_nonnegMBEC _) (bad_weight_nonnegMBEC _)

def weightedQMBEC (w : ℤ→ℝ) (j s : ℕ) : ℝ[X] :=
 ∑ i ∈ Finset.range (j+1), monomial i (w ((j:ℤ)-i)*((s+i+3).choose i:ℝ))

theorem weighted_q_actualMBEC (j s : ℕ) : weightedQMBEC qWeightM7E2 j s=qPolyM7E2 j s := by
 rfl

theorem bad_weight_gapMBEC :
 (weightedQMBEC badWeightMBEC 3 1^2).coeff 4*
   (weightedQMBEC badWeightMBEC 3 0*weightedQMBEC badWeightMBEC 3 2).coeff 3-
 (weightedQMBEC badWeightMBEC 3 1^2).coeff 3*
   (weightedQMBEC badWeightMBEC 3 0*weightedQMBEC badWeightMBEC 3 2).coeff 4 = -28620 := by
 norm_num [weightedQMBEC,Finset.sum_range_succ,badWeightMBEC,Nat.choose,
   pow_two,Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]

theorem arbitrary_lc_weight_shortcut_falseMBEC : ¬ (∀ w : ℤ→ℝ,
 (∀ k, 0≤w k) → CrossLC w → ∀ j s n : ℕ, n<2*j →
 (weightedQMBEC w j (s+1)^2).coeff n*(weightedQMBEC w j s*weightedQMBEC w j (s+2)).coeff (n+1) ≤
 (weightedQMBEC w j (s+1)^2).coeff (n+1)*(weightedQMBEC w j s*weightedQMBEC w j (s+2)).coeff n) := by
 intro H
 have h := H badWeightMBEC bad_weight_nonnegMBEC bad_weight_crossLCMBEC 3 0 3 (by omega)
 have he := bad_weight_gapMBEC
 norm_num only at h
 linarith

end
end MathGKM.Markov
