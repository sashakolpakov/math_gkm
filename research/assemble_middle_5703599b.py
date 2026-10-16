"""Machine-authored new candidates from inspected excluded drafts, never replay old writes."""
from pathlib import Path
R=Path('research')
head='\n'.join(f'import MarkovMiddleCert{r}M570' for r in range(7))+'\nimport MarkovMiddleExpandM570\nimport MarkovStripLCMD11\n'
head+='''/-! Machine-authored 5703599b. Split middle-cone sign proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000

theorem stripMiddle_largeM570 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t := by
 have he := gap_expandM570 k l t
'''
for r in range(7):head+=f' have h{r} := gap_coefficient_{r}M570 k l hk hl\n'
head+=''' have hn : 0 ≤ 4096*stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t := by
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
'''
(R/'MarkovMiddleGapM570.lean').write_text(head)
old=(R/'MarkovStripMiddleLCMD11.lean').read_text()
src='import MarkovMiddleGapM570\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 12000000\n'
src+=old[old.index('theorem strip_middle_transferMD11'):].replace('strip_middle_transferMD11','strip_middle_transferM570').replace('stripMiddleGapMD11','stripMiddleGapM570').replace('stripMiddleIMD11','stripMiddleIM570')
(R/'MarkovMiddleTransferM570.lean').write_text(src)
s=(R/'MarkovStripMiddleCoefficientsMD11.lean').read_text().replace('import MarkovStripMiddleGapMD11','import MarkovMiddleDefsM570').replace('source_middle_four_scaledMD11','source_middle_four_scaledM570').replace('stripMiddleIMD11','stripMiddleIM570').replace('Machine-authored d11e335e','Machine-authored 5703599b, adapted from excluded d11e335e draft')
(R/'MarkovMiddleCoefficientsM570.lean').write_text(s)
s=(R/'MarkovStripMiddleAllMD11.lean').read_text()
for old,new in [('MarkovStripMiddleCoefficientsMD11','MarkovMiddleCoefficientsM570'),('MarkovStripMiddleLCMD11','MarkovMiddleTransferM570'),('small_strip_2_7MD11','small_strip_2_7M570'),('source_middle_interiorMD11','source_middle_interiorM570'),('source_strip_thirdconeMD11','source_strip_thirdconeM570'),('source_middle_four_scaledMD11','source_middle_four_scaledM570'),('strip_middle_gap_nonnegMD11','strip_middle_gap_nonnegM570'),('strip_middle_transferMD11','strip_middle_transferM570')]:s=s.replace(old,new)
s=s.replace('Machine-authored d11e335e','Machine-authored 5703599b, adapted from excluded d11e335e draft')
(R/'MarkovMiddleAllM570.lean').write_text(s)
s=(R/'MarkovResidualMD11.lean').read_text().replace('MarkovStripMiddleAllMD11','MarkovMiddleAllM570').replace('InteriorCore63MD11','InteriorCore63M570').replace('root_iff_interiorMD11','root_iff_interiorM570').replace('source_strip_thirdconeMD11','source_strip_thirdconeM570').replace('Machine-authored d11e335e','Machine-authored 5703599b, adapted from excluded d11e335e draft')
(R/'MarkovResidualM570.lean').write_text(s)
print('New middle-cone assembly candidates generated; none admitted without checks.')
