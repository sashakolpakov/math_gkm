import MarkovAbel65c4
/-! Machine-authored fee405c8. Signed finite sums survive increasing weights
when every upper rank cut has nonnegative total. Zero weights are allowed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem weight_telescopeMFEE (w : ℕ → ℝ) (r : ℕ) :
 w r = w 0 + ∑ k ∈ range r, (w (k+1)-w k) := by
 induction r with
 | zero => simp
 | succ r ih => rw [sum_range_succ]; linarith

theorem weight_cut_expansionMFEE (w : ℕ → ℝ) (r N : ℕ) (hr : r ≤ N) :
 w r = w 0 + ∑ k ∈ range N, if k+1 ≤ r then w (k+1)-w k else 0 := by
 rw [weight_telescopeMFEE w r]
 congr 1
 symm
 apply sum_subset (range_mono hr)
 · intro k hk
   have := mem_range.mp hk
   rw [if_pos (by omega)]
 · intro k hk hkr
   have : ¬ k < r := by simpa using hkr
   rw [if_neg (by omega)]

theorem rank_weight_nonnegMFEE {ι : Type*} (s : Finset ι) (a : ι → ℝ)
 (rank : ι → ℕ) (N : ℕ) (hr : ∀ i ∈ s, rank i ≤ N)
 (w : ℕ → ℝ) (hw : 0 ≤ w 0) (hm : ∀ k, k<N → w k ≤ w (k+1))
 (ha : ∀ h, h ≤ N → 0 ≤ ∑ i ∈ s, if h ≤ rank i then a i else 0) :
 0 ≤ ∑ i ∈ s, a i*w (rank i) := by
 have htotal : 0 ≤ ∑ i ∈ s, a i := by simpa using ha 0 (by omega)
 have hexp : (∑ i ∈ s, a i*w (rank i)) =
   (∑ i ∈ s, a i)*w 0 +
   ∑ k ∈ range N, (w (k+1)-w k)*(∑ i ∈ s, if k+1 ≤ rank i then a i else 0) := by
   calc
    _ = ∑ i ∈ s, a i*(w 0 + ∑ k ∈ range N,
       if k+1 ≤ rank i then w (k+1)-w k else 0) := by
      apply sum_congr rfl
      intro i hi
      rw [←weight_cut_expansionMFEE w (rank i) N (hr i hi)]
    _ = _ := by
      simp only [mul_add,mul_sum,sum_add_distrib,sum_mul]
      rw [sum_comm]
      congr 1
      apply sum_congr rfl
      intro k hk
      rw [mul_sum]
      apply sum_congr rfl
      intro i hi
      split_ifs <;> ring
 rw [hexp]
 apply add_nonneg (mul_nonneg htotal hw)
 apply sum_nonneg
 intro k hk
 exact mul_nonneg (sub_nonneg.mpr (hm k (mem_range.mp hk))) (ha (k+1) (by have := mem_range.mp hk; omega))

end
end MathGKM.Markov
