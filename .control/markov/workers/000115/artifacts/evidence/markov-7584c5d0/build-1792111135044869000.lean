import MarkovVerticalBoundsM758
import MarkovCross774
/-! Machine-authored 7584c5d0. All indices and zero positions of the seed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem vE_positiveM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (hq : 2 ≤ q) (hj : 2 ≤ j ∧ j ≤ 2*q+4) :
 0 < vEM758 a r (2*r-a:ℕ) q j := by
 by_cases h : j ≤ q+1
 · rw [vE_lowM758 _ _ _ _ _ hq ⟨hj.1,h⟩]
   exact v_pos_lowM758 a r hr hra q j hj.1
 by_cases h1 : j=q+2
 · rw [vE_bridgeM758 _ _ _ _ _ hq h1]
   exact v_pos_bridgeM758 a r hr hra q j hq
 by_cases h2 : j ≤ 2*q+1
 · rw [vE_midM758 _ _ _ _ _ hq (by omega)]
   exact v_pos_midM758 a r hr hra q j (by omega)
 have hh : j=2*q+2 ∨ j=2*q+3 ∨ j=2*q+4 := by omega
 rcases hh with hh|hh|hh
 · rw [vE_tail2M758 _ _ _ _ _ hq hh]
   exact v_pos_tail2M758 a r hr hra q j hq
 · rw [vE_tail3M758 _ _ _ _ _ hq hh]
   exact v_pos_tail3M758 a r hr hra q j hq
 · rw [vE_tail4M758 _ _ _ _ _ hq hh]
   exact v_pos_tail4M758 a r hr hra q j hq

theorem vE_nonnegM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (hq : 2 ≤ q) : 0 ≤ vEM758 a r (2*r-a:ℕ) q j := by
 by_cases h0 : j ≤ 0
 · rw [vE_zeroM758 _ _ _ _ _ hq h0]
 by_cases h1 : j=1
 · rw [vE_oneM758 _ _ _ _ _ hq h1]; positivity
 by_cases h2 : 2*q+5 ≤ j
 · rw [vE_pastM758 _ _ _ _ _ hq h2]
 exact le_of_lt (vE_positiveM758 a r hr hra q j hq (by omega))

theorem vE_adjacentM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q j : ℤ) (hq : 2 ≤ q) :
 vEM758 a r (2*r-a:ℕ) q (j-1)*vEM758 a r (2*r-a:ℕ) q (j+1) ≤
 vEM758 a r (2*r-a:ℕ) q j^2 := by
 by_cases h0 : j ≤ 1
 · rw [vE_zeroM758 _ _ _ _ _ hq (by omega),zero_mul]; exact sq_nonneg _
 by_cases h1 : 2*q+4 ≤ j
 · rw [vE_pastM758 _ _ _ _ (j+1) hq (by omega),mul_zero]; exact sq_nonneg _
 by_cases h2 : j=2
 · subst j
   rw [vE_oneM758 _ _ _ _ _ hq (by omega),
     vE_lowM758 _ _ _ _ (2+1) hq (by omega),vE_lowM758 _ _ _ _ 2 hq (by omega)]
   exact v_gap_firstM758 a r hr hra q 2 trivial
 by_cases h3 : j ≤ q
 · rw [vE_lowM758 _ _ _ _ (j-1) hq (by omega),
     vE_lowM758 _ _ _ _ (j+1) hq (by omega),vE_lowM758 _ _ _ _ j hq (by omega)]
   exact v_gap_lowM758 a r hr hra q j (by omega)
 by_cases h4 : j=q+1
 · subst j
   rw [vE_lowM758 _ _ _ _ (q+1-1) hq (by omega),
     vE_bridgeM758 _ _ _ _ (q+1+1) hq (by omega),vE_lowM758 _ _ _ _ (q+1) hq (by omega)]
   convert v_gap_cross1M758 a r hr hra q (q+1) hq using 1 <;> ring_nf
 by_cases h5 : j=q+2
 · subst j
   rw [vE_lowM758 _ _ _ _ (q+2-1) hq (by omega),
     vE_midM758 _ _ _ _ (q+2+1) hq (by omega),vE_bridgeM758 _ _ _ _ (q+2) hq rfl]
   convert v_gap_cross2M758 a r hr hra q (q+2) hq using 1 <;> ring_nf
 by_cases ht2 : j=2*q+2
 · subst j
   rw [vE_midM758 _ _ _ _ (2*q+2-1) hq (by omega),
     vE_tail3M758 _ _ _ _ (2*q+2+1) hq (by omega),vE_tail2M758 _ _ _ _ (2*q+2) hq rfl]
   convert v_gap_tail2M758 a r hr hra q (2*q+2) hq using 1 <;> ring_nf
 by_cases ht3 : j=2*q+3
 · subst j
   rw [vE_tail2M758 _ _ _ _ (2*q+3-1) hq (by omega),
     vE_tail4M758 _ _ _ _ (2*q+3+1) hq (by omega),vE_tail3M758 _ _ _ _ (2*q+3) hq rfl]
   exact v_gap_tail3M758 a r hr hra q (2*q+3) hq
 by_cases hq2 : q=2
 · subst q
   have hj : j=5 := by omega
   subst j
   rw [vE_bridgeM758 _ _ _ _ (5-1) hq (by omega),
     vE_tail2M758 _ _ _ _ (5+1) hq (by omega),vE_midM758 _ _ _ _ 5 hq (by omega)]
   exact v_gap_twoM758 a r hr hra 2 5 trivial
 by_cases h6 : j=q+3
 · subst j
   rw [vE_bridgeM758 _ _ _ _ (q+3-1) hq (by omega),
     vE_midM758 _ _ _ _ (q+3+1) hq (by omega),vE_midM758 _ _ _ _ (q+3) hq (by omega)]
   convert v_gap_cross3M758 a r hr hra q (q+3) (by omega) using 1 <;> ring_nf
 by_cases h7 : j ≤ 2*q
 · rw [vE_midM758 _ _ _ _ (j-1) hq (by omega),
     vE_midM758 _ _ _ _ (j+1) hq (by omega),vE_midM758 _ _ _ _ j hq (by omega)]
   exact v_gap_midM758 a r hr hra q j (by omega)
 have hj : j=2*q+1 := by omega
 subst j
 rw [vE_midM758 _ _ _ _ (2*q+1-1) hq (by omega),
   vE_tail2M758 _ _ _ _ (2*q+1+1) hq (by omega),vE_midM758 _ _ _ _ (2*q+1) hq (by omega)]
 convert v_gap_tail1M758 a r hr hra q (2*q+1) (by omega) using 1 <;> ring_nf

theorem vE_crossM758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)
 (q : ℤ) (hq : 2 ≤ q) :
 CrossLC (fun j => (vEM758 a r (2*r-a:ℕ) q j:ℝ)) := by
 apply crossLC_of_adjacent_interval774
 · intro j; exact_mod_cast vE_nonnegM758 a r hr hra q j hq
 · intro j; exact_mod_cast vE_adjacentM758 a r hr hra q j hq
 · intro i k j hik hkj hi hj
   have hi' : 1 ≤ i := by
     by_contra hh
     rw [vE_zeroM758 _ _ _ _ _ hq (by omega)] at hi
     norm_num at hi
   have hj' : j ≤ 2*q+4 := by
     by_contra hh
     rw [vE_pastM758 _ _ _ _ _ hq (by omega)] at hj
     norm_num at hj
   by_cases hk : k=1
   · have he : i=k := by omega
     simpa only [he] using hi
   · exact_mod_cast vE_positiveM758 a r hr hra q k hq (by omega)
end
end MathGKM.Markov
