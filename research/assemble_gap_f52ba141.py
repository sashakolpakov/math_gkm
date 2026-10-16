"""Machine-authored assembly of the exhaustive gap charts."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f52ba141'
mods=json.loads((O/'second-generated.json').read_text())['modules']
src='\n'.join('import '+m for m in mods)+'''
/-! Machine-authored f52ba141. Exact all-index compensation, no source balance. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
theorem second_endpointsMF52 (i j : ℕ) (m : ℝ) (hm : 1 ≤ m) (hs : 1 ≤ i+j) :
 0 ≤ secondGapMF52 (i+1) (j+1) m 0 ∧
 0 ≤ secondGapMF52 (i+1) (j+1) m (2*m) ∧
 0 ≤ secondMixedMF52 (i+1) (j+1) m := by
 have hz : 0 ≤ m-1 := by linarith
 rcases i with _ | (_ | i) <;> rcases j with _ | (_ | j)
'''
for kn in ['one','two','large']:
 for ln in ['one','two','large']:
  if kn==ln=='one':src+=' · omega\n';continue
  xx='i' if kn=='large' else '0'; yy='j' if ln=='large' else '0'
  src+=' · refine ⟨?_,?_,?_⟩\n'
  for gn in ['zero','end','mixed']:
   src+=f'''   · have h := second_{kn}_{ln}_{gn}MF52 {xx} {yy} (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
'''
src+='''
theorem second_gap_nonnegMF52 (i j : ℕ) (m t : ℝ)
 (hm : 1 ≤ m) (ht : 0 ≤ t) (htm : t ≤ 2*m) (hs : 1 ≤ i+j) :
 0 ≤ secondGapMF52 (i+1) (j+1) m t := by
 obtain ⟨h0,h2,hb⟩ := second_endpointsMF52 i j m hm hs
 have he := second_bernsteinMF52 (i+1) (j+1) m t
 have hpos : 0 < (2*m)^2 := by positivity
 have hnon : 0 ≤ (2*m-t)^2*secondGapMF52 (i+1) (j+1) m 0+
   t*(2*m-t)*secondMixedMF52 (i+1) (j+1) m+
   t^2*secondGapMF52 (i+1) (j+1) m (2*m) := by
   have hd : 0 ≤ 2*m-t := by linarith
   positivity
 rw [←he] at hnon
 exact (mul_nonneg_iff_of_pos_left hpos).mp hnon
end
end MathGKM.Markov
'''
(R/'research/MarkovSecondGapMF52.lean').write_text(src)
