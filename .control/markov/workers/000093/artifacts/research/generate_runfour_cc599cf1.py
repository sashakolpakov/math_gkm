"""Machine-authored Lean certificate generation; checked by ordinary ring/positivity."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
row=json.loads((O/'run-four-probe.json').read_text())['rows'][0]
terms=[]
for ks,v in row['polynomial']:
 assert all(ks[k]==0 for k in [0,1,4,5,6,7]) and int(v)>=0
 terms.append('*'.join([v]+[name if k==1 else f'{name}^{k}' for name,k in [('C',ks[2]),('R',ks[3])] if k]))
s='''import MarkovFirstShiftSourceF2
/-! Machine-authored cc599cf1. Missing run-four first-shift case. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384

def runFourGapCC (C R : ℤ) : ℤ :=
 '''+' + '.join(terms)+'''

theorem runFourGap_identityCC (C R : ℤ) :
 lowCoeff5F2 (R+C+2) (4*(R+C+2)+(R+1))^2-
 lowCoeff4F2 (R+C+2) (4*(R+C+2)+(R+1))*
 (lowCoeff6F2 (R+C+2) (4*(R+C+2)+(R+1))+
 shiftCorrectionF2 4 (R+C+2) (R+1))=runFourGapCC C R := by
 unfold lowCoeff4F2 lowCoeff5F2 lowCoeff6F2 shiftCorrectionF2 runFourGapCC
 ring

theorem runFourGap_nonnegCC (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤runFourGapCC C R := by unfold runFourGapCC; positivity

theorem firstShift_four_lcCC (c r : ℤ) (hr : 1≤r) (hrc : r<c) :
 lowCoeff4F2 c (4*c+r)*(lowCoeff6F2 c (4*c+r)+shiftCorrectionF2 4 c r)≤
 lowCoeff5F2 c (4*c+r)^2 := by
 have he := runFourGap_identityCC (c-r-1) (r-1)
 have hp := runFourGap_nonnegCC (c-r-1) (r-1) (by omega) (by omega)
 have ec : r-1+(c-r-1)+2=c := by ring
 have er : r-1+1=r := by ring
 rw [ec,er] at he
 linarith only [he,hp]

theorem source_fourth_first_shift_fourCC (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i : ℕ)
 (hs : i+4+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i 6*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) 4 ≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) 5^2 := by
 have h0 := source_fourth_convF2 4 rest hc (i+2) 4 (by omega) (by omega)
 have h1 := source_fourth_convF2 4 rest hc (i+1) 5 (by omega) (by omega)
 have h2 := source_fourth_next_convF2 4 rest hc i (by omega)
 rw [convLow_at4F2] at h0
 rw [convLow_at5F2] at h1
 norm_num only [Nat.reduceAdd,Nat.cast_ofNat] at h0 h1 h2
 rw [convLow_at6F2] at h2
 have hg := firstShift_four_lcCC (frame rest).mid.b (frame rest).mid.a
   (by exact_mod_cast (frame_reduced rest).1)
   (by exact_mod_cast (frame_reduced rest).2.1)
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]

theorem source_fourth_first_shiftCC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hn : 4≤n) (i : ℕ)
 (hs : i+n+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) n ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+1)^2 := by
 by_cases h : 5≤n
 · exact source_fourth_first_shiftF2 n rest hc h i hs
 · have he : n=4 := by omega
   subst n
   exact source_fourth_first_shift_fourCC rest hc i hs
end
end MathGKM.Markov
'''
(R/'research/MarkovFirstShiftCC.lean').write_text(s)
