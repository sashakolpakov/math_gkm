import MarkovRankWeightMFEE
/-! Machine-authored fee405c8. A finite normalized-pair route: positive
denominators and ordered cross inequalities imply nonnegative upper cuts.
This theorem does not assert those hypotheses for the Markov kernel. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem normalized_subset_nonnegMFEE {ι : Type*} [DecidableEq ι]
 (s u : Finset ι) (hu : u ⊆ s) (a b : ι → ℝ)
 (hb : ∀ i ∈ s, 0 < b i) (ha : 0 ≤ ∑ i ∈ s, a i)
 (hr : ∀ i ∈ s\u, ∀ j ∈ u, a i*b j ≤ a j*b i) :
 0 ≤ ∑ i ∈ u, a i := by
 by_cases hs : s.Nonempty
 · have hbtotal : 0 < ∑ i ∈ s, b i := sum_pos (fun i hi => hb i hi) hs
   have hbtail : 0 ≤ ∑ i ∈ u, b i := sum_nonneg (fun i hi => (hb i (hu hi)).le)
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
   have hp := mul_nonneg ha hbtail
   have hmul : 0 ≤ (∑ i ∈ s, b i)*(∑ i ∈ u, a i) := by linarith
   exact (mul_nonneg_iff_of_pos_left hbtotal).mp hmul
 · have he : s=∅ := not_nonempty_iff_eq_empty.mp hs
   have hue : u=∅ := subset_empty.mp (he ▸ hu)
   simp [hue]

theorem normalized_rank_cutMFEE {ι : Type*} [DecidableEq ι]
 (s : Finset ι) (rank : ι → ℕ) (a b : ι → ℝ)
 (hb : ∀ i ∈ s, 0 < b i) (ha : 0 ≤ ∑ i ∈ s, a i)
 (hr : ∀ i ∈ s, ∀ j ∈ s, rank i ≤ rank j → a i*b j ≤ a j*b i)
 (h : ℕ) : 0 ≤ ∑ i ∈ s, if h ≤ rank i then a i else 0 := by
 classical
 rw [←sum_filter]
 apply normalized_subset_nonnegMFEE s (s.filter (fun i => h ≤ rank i))
   (filter_subset _ _) a b hb ha
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
