import MathGKM.Accepted7fa6ababd048abc991ecd2fb
import MathGKM.Acceptedc00250913cef7b75726d4aef

/- Machine-authored round97. Exact aggregate compensation for the unchanged
complementary allocation blocks. No sign assertion or Counting assumption. -/
namespace AllocationCompensationR97
open ComplementaryAllocationR96 FullFiberRankR80
open scoped BigOperators
noncomputable section

def delta (N sigma j i a b c : ℕ) : ℤ :=
  G N sigma j (2*i+2) a b c (i+1) - G N sigma j (2*i+2) a b c i

def gain (N sigma j i a b : ℕ) : ℤ :=
  ∑ c ∈ Finset.range (a/2+1), max (delta N sigma j i a b c) 0

def loss (N sigma j i a b : ℕ) : ℤ :=
  ∑ c ∈ Finset.range (a/2+1), max (-delta N sigma j i a b c) 0

theorem sum_delta (N sigma j i a b : ℕ) :
    (∑ c ∈ Finset.range (a/2+1), delta N sigma j i a b c) =
      ((PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
      ((PairConvolutionR78.P N sigma j (2*i+2) a b i).card : ℤ) := by
  simp only [delta, Finset.sum_sub_distrib]
  rw [← Accepted7fa6ababd048abc991ecd2fb.obligation.1 N sigma j (2*i+2) a b (i+1),
    ← Accepted7fa6ababd048abc991ecd2fb.obligation.1 N sigma j (2*i+2) a b i,
    rank_coeff, rank_coeff]

theorem split_signed (z : ℤ) : z = max z 0 - max (-z) 0 := by
  by_cases hz : 0 ≤ z
  · rw [max_eq_left hz, max_eq_right (by omega)]
    omega
  · rw [max_eq_right (by omega), max_eq_left (by omega)]
    omega

theorem gain_sub_loss (N sigma j i a b : ℕ) :
    gain N sigma j i a b - loss N sigma j i a b =
      ((PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
      ((PairConvolutionR78.P N sigma j (2*i+2) a b i).card : ℤ) := by
  rw [← sum_delta]
  unfold gain loss
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro c hc
  exact (split_signed _).symm

theorem compensation_iff (N sigma j i a b : ℕ) :
    (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
      (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card ↔
    loss N sigma j i a b ≤ gain N sigma j i a b := by
  have hs := gain_sub_loss N sigma j i a b
  omega

theorem fixed_separator :
    delta 4 0 0 2 2 0 0 = -1 ∧ delta 4 0 0 2 2 0 1 = 4 ∧
    loss 4 0 0 2 2 0 = 1 ∧ gain 4 0 0 2 2 0 = 4 ∧
    (∑ c ∈ Finset.range (2/2+1), delta 4 0 0 2 2 0 c) = 3 := by
  have hv := Acceptedc00250913cef7b75726d4aef.obligation.1
  have hd0 : delta 4 0 0 2 2 0 0 = -1 := by
    change G 4 0 0 6 2 0 0 3 - G 4 0 0 6 2 0 0 2 = -1
    rw [hv.1, hv.2.1]
    norm_num
  have hd1 : delta 4 0 0 2 2 0 1 = 4 := by
    change G 4 0 0 6 2 0 1 3 - G 4 0 0 6 2 0 1 2 = 4
    rw [hv.2.2.1, hv.2.2.2]
    norm_num
  refine ⟨hd0, hd1, ?_, ?_, ?_⟩
  · norm_num [loss, Finset.sum_range_succ, hd0, hd1]
  · norm_num [gain, Finset.sum_range_succ, hd0, hd1]
  · norm_num [Finset.sum_range_succ, hd0, hd1]

theorem interface :
    (∀ N sigma j i a b : ℕ,
      (∑ c ∈ Finset.range (a/2+1), delta N sigma j i a b c) =
        ((PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
        ((PairConvolutionR78.P N sigma j (2*i+2) a b i).card : ℤ)) ∧
    (∀ N sigma j i a b : ℕ,
      (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
        (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card ↔
      loss N sigma j i a b ≤ gain N sigma j i a b) ∧
    (delta 4 0 0 2 2 0 0 = -1 ∧ delta 4 0 0 2 2 0 1 = 4 ∧
      loss 4 0 0 2 2 0 = 1 ∧ gain 4 0 0 2 2 0 = 4 ∧
      (∑ c ∈ Finset.range (2/2+1), delta 4 0 0 2 2 0 c) = 3) :=
  ⟨sum_delta, compensation_iff, fixed_separator⟩

end
end AllocationCompensationR97
#print axioms AllocationCompensationR97.interface
