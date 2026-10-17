import MarkovNormalizedCutMFEE
/-! Machine-authored ad504da6. Normalized cuts with zero denominators.
Zero-denominator summands are retained and required to be nonpositive. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem normalized_subset_zeroMAD5 {ι : Type*} [DecidableEq ι]
 (s u : Finset ι) (hu : u ⊆ s) (a b : ι → ℝ)
 (hb : ∀ i ∈ s, 0 ≤ b i) (hz : ∀ i ∈ s, b i=0 → a i ≤ 0)
 (ha : 0 ≤ ∑ i ∈ s, a i)
 (hr : ∀ i ∈ s\u, ∀ j ∈ u, a i*b j ≤ a j*b i) :
 0 ≤ ∑ i ∈ u, a i := by
 have hbtotal : 0 ≤ ∑ i ∈ s, b i := sum_nonneg hb
 by_cases hp : 0 < ∑ i ∈ s, b i
 · have hbtail : 0 ≤ ∑ i ∈ u, b i := sum_nonneg (fun i hi => hb i (hu hi))
   have hcross : 0 ≤ ∑ i ∈ s\u, ∑ j ∈ u, (a j*b i-a i*b j) := by
     apply sum_nonneg
     intro i hi
     apply sum_nonneg
     intro j hj
     exact sub_nonneg.mpr (hr i hi j hj)
   have he : (∑ i ∈ s\u, ∑ j ∈ u, (a j*b i-a i*b j))=
     (∑ i ∈ s, b i)*(∑ j ∈ u, a j)-(∑ i ∈ s, a i)*(∑ j ∈ u, b j) := by
     rw [←sum_sdiff hu (f:=a),←sum_sdiff hu (f:=b)]
     simp only [sum_sub_distrib,←sum_mul,←mul_sum]
     ring
   rw [he] at hcross
   have hprod := mul_nonneg ha hbtail
   exact (mul_nonneg_iff_of_pos_left hp).mp (by linarith)
 · have hbzero : ∀ i ∈ s, b i=0 := by
     apply (sum_eq_zero_iff_of_nonneg hb).mp
     linarith
   have han : ∀ i ∈ s, a i ≤ 0 := fun i hi => hz i hi (hbzero i hi)
   have hout : ∑ i ∈ s\u, a i ≤ 0 := sum_nonpos (fun i hi => han i (mem_sdiff.mp hi).1)
   rw [←sum_sdiff hu (f:=a)] at ha
   linarith

theorem normalized_rank_zeroMAD5 {ι : Type*} [DecidableEq ι]
 (s : Finset ι) (rank : ι → ℕ) (a b : ι → ℝ)
 (hb : ∀ i ∈ s, 0 ≤ b i) (hz : ∀ i ∈ s, b i=0 → a i ≤ 0)
 (ha : 0 ≤ ∑ i ∈ s, a i)
 (hr : ∀ i ∈ s, ∀ j ∈ s, rank i ≤ rank j → a i*b j ≤ a j*b i)
 (h : ℕ) : 0 ≤ ∑ i ∈ s, if h ≤ rank i then a i else 0 := by
 classical
 rw [←sum_filter]
 apply normalized_subset_zeroMAD5 s (s.filter (fun i => h ≤ rank i))
   (filter_subset _ _) a b hb hz ha
 intro i hi j hj
 have his := (mem_sdiff.mp hi).1
 have hin : ¬h ≤ rank i := by
   have hh := (mem_sdiff.mp hi).2
   simpa only [mem_filter,his,true_and] using hh
 have hjs := (mem_filter.mp hj).1
 have hjr := (mem_filter.mp hj).2
 exact hr i his j hjs (by omega)

end
end MathGKM.Markov
