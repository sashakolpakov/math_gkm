"""Machine-authored low-index source coefficient and nonnegative gap certificates."""
from pathlib import Path
from fractions import Fraction as F
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0b212317'
d=json.loads((O/'boundary-gap-probe.json').read_text())
def expr(p,names):
 return ' + '.join('*'.join([str(F(v).numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(names,ks) if k]) for ks,v in p) or '0'
txt='''import MarkovFourthGapK0B
/-! Machine-authored request 0b212317. Initial coefficient and adjacent-gap certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
for k in range(7):
 txt+=f'\ndef lowCoeff{k}K0B (C H : ℤ) : ℤ :=\n {expr(d["coefficients"][k],["N","Z","C","H","J","T","U","x"])}\n'
 txt+=f'''\ntheorem convLow_at{k}K0B (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) {k}=lowCoeff{k}K0B c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 unfold lowCoeff{k}K0B '''+' '.join(f'fourthLow{i}K0B' for i in range(13))+'''
 ring
'''
for center in range(1,6):
 row=next(row for row in d['rows'] if row['center']==center and row['offset']==2 and row['delta']==0)
 assert row['negative_terms']==0
 txt+=f'\ndef lowGap{center}K0B (C R : ℤ) : ℤ :=\n {expr(row["certificate"],["N","Z","C","R","J","T","U","x"])}\n'
 txt+=f'''\ntheorem lowGap{center}_identityK0B (C R : ℤ) :
 lowCoeff{center}K0B (C+2) ((C+2)*{center}+R+1)^2-
 lowCoeff{center-1}K0B (C+2) ((C+2)*{center}+R+1)*
 lowCoeff{center+1}K0B (C+2) ((C+2)*{center}+R+1)=lowGap{center}K0B C R := by
 unfold lowCoeff{center}K0B lowCoeff{center-1}K0B lowCoeff{center+1}K0B lowGap{center}K0B
 ring

theorem lowGap{center}_nonnegK0B (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤lowGap{center}K0B C R := by unfold lowGap{center}K0B; positivity

theorem lowCoeff{center}_lcK0B (c h : ℤ) (hc : 2≤c) (hh : c*{center}+1≤h) :
 lowCoeff{center-1}K0B c h*lowCoeff{center+1}K0B c h≤lowCoeff{center}K0B c h^2 := by
 have he := lowGap{center}_identityK0B (c-2) (h-c*{center}-1)
 have hn := lowGap{center}_nonnegK0B (c-2) (h-c*{center}-1) (by omega) (by omega)
 have ec : c-2+2=c := by ring
 have eh : (c-2+2)*{center}+(h-c*{center}-1)+1=h := by ring
 rw [eh,ec] at he
 linarith only [he,hn]
'''
txt+='''
theorem fourthLow_convolution_lcK0B (c h : ℤ) (j : ℕ) (hc : 2≤c)
 (hh : c*((j:ℤ)+1)+1≤h) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) j*
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) (j+2) ≤
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) (j+1)^2 := by
 by_cases hj : 5≤j
 · have h0 := fourthShape_convolutionK0B c h j hj
   have h1 := fourthShape_convolutionK0B c h (j+1) (by omega)
   have h2 := fourthShape_convolutionK0B c h (j+2) (by omega)
   have hg := fourthShape_logConcaveStrongK0B c h ((j:ℤ)+1) hc (by omega) hh
   have e0 : (j:ℤ)+1-1=j := by ring
   have e2 : (j:ℤ)+1+1=j+2 := by ring
   rw [e0,e2] at hg
   push_cast at h1 h2
   rw [←h0,←h1,←h2] at hg
   nlinarith only [hg]
 · interval_cases j
'''
for j in range(5):
 txt+=f'''   · norm_num only [Nat.reduceAdd] at *
     rw [convLow_at{j}K0B,convLow_at{j+1}K0B,convLow_at{j+2}K0B]
     exact lowCoeff{j+1}_lcK0B c h hc (by norm_num at hh ⊢; exact hh)
'''
txt+='end\nend MathGKM.Markov\n'
(R/'research/MarkovFourthBoundaryK0B.lean').write_text(txt)
