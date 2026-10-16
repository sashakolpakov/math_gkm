import MarkovMiddleCert0M570
import MarkovMiddleCert1M570
import MarkovMiddleCert2M570
import MarkovMiddleCert3M570
import MarkovMiddleCert4M570
import MarkovMiddleCert5M570
import MarkovMiddleCert6M570
import MarkovMiddleExpandM570
import MarkovStripLCMD11
/-! Machine-authored 5703599b. Split middle-cone sign proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000

theorem stripMiddle_largeM570 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t := by
 have he := gap_expandM570 k l t
 have h0 := gap_coefficient_0M570 k l hk hl
 have h1 := gap_coefficient_1M570 k l hk hl
 have h2 := gap_coefficient_2M570 k l hk hl
 have h3 := gap_coefficient_3M570 k l hk hl
 have h4 := gap_coefficient_4M570 k l hk hl
 have h5 := gap_coefficient_5M570 k l hk hl
 have h6 := gap_coefficient_6M570 k l hk hl
 have hn : 0 ≤ 4096*stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t := by
   rw [he]
   positivity
 linarith only [hn]

theorem strip_middle_smallM570 (a k l t : ℝ)
 (hz : (l-3)*(l-4)*(l-5)*(l-6)*(l-7)=0) :
 stripMiddleGapM570 a k l t=(k+1)*stripGapMD11 a k l := by
 unfold stripMiddleGapM570 stripMiddleIM570 stripGapMD11
 linear_combination -288*(k+l-3)*(k+l-4)*(l-2)*stripJMB9D a k l*t*hz

theorem strip_middle_gap_nonnegM570 (a k l t : ℕ)
 (he : 4*a=k+l+2+t) (hl : 3 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ stripMiddleGapM570 a k l t := by
 have ha : 1 ≤ a := by omega
 by_cases h7 : 7 ≤ l
 · have heR : (a:ℝ)=((k:ℝ)+((l:ℝ)-7)+9+t)/4 := by
     have : 4*(a:ℝ)=(k:ℝ)+l+2+t := by exact_mod_cast he
     linarith
   have hlR : 0 ≤ (l:ℝ)-7 := by
     have : (7:ℝ) ≤ l := by exact_mod_cast h7
     linarith
   rw [heR]
   simpa only [sub_add_cancel] using stripMiddle_largeM570 k ((l:ℝ)-7) t (by positivity) hlR (by positivity)
 · have hz : ((l:ℝ)-3)*(l-4)*(l-5)*(l-6)*(l-7)=0 := by
     have hc : l=3 ∨ l=4 ∨ l=5 ∨ l=6 := by omega
     rcases hc with rfl|rfl|rfl|rfl <;> norm_num
   rw [strip_middle_smallM570 a k l t hz]
   exact mul_nonneg (by positivity) (strip_gap_nonnegMD11 a k l ha hl hN)
end
end MathGKM.Markov
