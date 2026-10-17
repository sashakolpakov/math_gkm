"""Machine-authored parameter/source bridge for separately checked certificates."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
src='''import MarkovAbsorbedBoundaryCertificateM418
import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored 418bcc64. Connect the rational boundary certificates
to the actual absorbed kernel, with its binomial normalization. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
'''
for s in [2,3]:
 for mode in [0,1]:
  c=4 if s==2 else 8
  ds='t+2+g' if mode==0 else 't+1'
  e=['g+2','g+1','g'] if mode==0 else ['1','0','0']
  src+=f'''\ntheorem absorbed_boundary_case{s}{mode}M418 (v g k : ℕ) :
 let t:=v+4
 let d:={ds}
 let j:=d+{s}
 0 ≤ ((cutPolyMFEE t (absorbedLiftM418 d j {c} (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j {c} t)*cutPolyMFEE t (absorbedLiftM418 d j {c} (t+2))).coeff k := by
 let t:=v+4
 let d:={ds}
 let j:=d+{s}
 let B : ℚ := ((t+j+3).choose j:ℚ)
 have hz : 0 ≤ B-(j:ℚ)-1 := by
   have hb : (j:ℚ)+1 ≤ B := by exact_mod_cast base_choose_lowerM418 j t
   linarith
 have e0 : d-t={e[0]} := by dsimp [d,t]; omega
 have e1 : d-(t+1)={e[1]} := by dsimp [d,t]; omega
 have e2 : d-(t+2)={e[2]} := by dsimp [d,t]; omega
 apply absorbed_boundary_of_modelM418 d j t k {c} (by dsimp [j]; omega)
'''
  for k in range(1,4):
   name=f'absorbedBoundary{s}{mode}{k}M418'
   src+=f''' · have hh := {name[:-4]}_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [{name},boundaryModel{k-1}M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
'''
src+='\nend\nend MathGKM.Markov\n'
(R/'research/MarkovAbsorbedBoundarySourceM418.lean').write_text(src)
print('generated four parameter bridges')
