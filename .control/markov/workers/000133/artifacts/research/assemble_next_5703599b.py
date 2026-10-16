"""Machine-authored next-cone sign, transfer, and exact residual candidates."""
from pathlib import Path
R=Path('research')
src='\n'.join(f'import MarkovNextCert{r}M570' for r in range(7))+'\nimport MarkovNextExpandM570\nimport MarkovNextSmallGapM570\n'
src+='''namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
theorem stripNext_largeM570 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripNextGapM570 ((k+l+9+t)/3) k (l+7) t := by
 have he := next_expandM570 k l t
'''
for r in range(7):src+=f' have h{r} := next_coefficient_{r}M570 k l hk hl\n'
src+=''' have hn : 0 ≤ 729*stripNextGapM570 ((k+l+9+t)/3) k (l+7) t := by
   rw [he]
   positivity
 linarith only [hn]

theorem strip_next_gap_nonnegM570 (a k l t : ℕ)
 (he : 3*a=k+l+2+t) (hl : 3 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ stripNextGapM570 a k l t := by
 have ha : 1 ≤ a := by omega
 have haR : 0 ≤ (a:ℝ)-1 := by
   have : (1:ℝ) ≤ a := by exact_mod_cast ha
   linarith
 by_cases h7 : 7 ≤ l
 · have heR : (a:ℝ)=((k:ℝ)+((l:ℝ)-7)+9+t)/3 := by
     have : 3*(a:ℝ)=(k:ℝ)+l+2+t := by exact_mod_cast he
     linarith
   have hlR : 0 ≤ (l:ℝ)-7 := by
     have : (7:ℝ) ≤ l := by exact_mod_cast h7
     linarith
   rw [heR]
   simpa only [sub_add_cancel] using stripNext_largeM570 k ((l:ℝ)-7) t (by positivity) hlR (by positivity)
 · have hc : l=3 ∨ l=4 ∨ l=5 ∨ l=6 := by omega
   rcases hc with rfl|rfl|rfl|rfl
'''
for n in range(3,7):
 v=7-n
 src+=f'''   · have hk : 0 ≤ (k:ℝ)-{v} := by
       have : ({v}:ℝ) ≤ k := by exact_mod_cast (show {v} ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using next_small{n}M570 ((a:ℝ)-1) ((k:ℝ)-{v}) t haR hk (by positivity)
'''
src+='end\nend MathGKM.Markov\n';(R/'MarkovNextGapM570.lean').write_text(src)
s=(R/'MarkovMiddleTransferM570.lean').read_text()
s=s.replace('MarkovMiddleGapM570','MarkovNextGapM570').replace('strip_middle_transferM570','strip_next_transferM570').replace('stripMiddleGapM570','stripNextGapM570').replace('stripMiddleIM570','stripNextIM570')
s=s.replace('stripHMB9D a k l','stripHMCE8 a k l t')
s=s.replace('(k+l-4)*c₃','(k+l-4)*(k+1)*c₃')
s=s.replace('(k+l-6)*(k+1)*\n   (c₃^2','(k+l-6)*(k+1)^2*\n   (c₃^2')
s=s.replace('4*(k+l-5)*(k+l-6)*(k+1)*(','4*(k+l-5)*(k+l-6)*(')
s=s.replace('3*(k+l-3)*(k+l-4)*(','3*(k+l-3)*(k+l-4)*(k+1)*(')
s=s.replace('(k+l-6)*(k+1) := by','(k+l-6)*(k+1)^2 := by')
(R/'MarkovNextTransferM570.lean').write_text(s)
print('Next gap and transfer candidates written')
