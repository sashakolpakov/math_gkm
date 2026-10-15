"""Machine-authored Lean coefficient-shape and gap certificate candidates."""
from pathlib import Path
from fractions import Fraction as F
import json
from rational_third_bdee import P
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0b212317'
def expr(data,names):
 out=[]
 for ks,v in data:
  v=F(v);assert v.denominator==1
  out.append('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(names,ks) if k]))
 return ' + '.join(out) or '0'
data=json.loads((O/'compact-low-candidates.json').read_text())
header='''/-! Machine-authored request 0b212317. Exact algebraic candidate checked separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
defs=' '.join(f'fourthLow{i}K0B' for i in range(13))
sh='import MarkovFourthLowK0B\nimport MarkovConvK0B\n'+header
sh+=f'\ndef fourthShapeK0B (C H J : ℤ) : ℤ :=\n {expr(data["shape"],["N","Z","C","H","J","T","U","x"])}\n'
fall=' + '.join(f'fourthLow{i}K0B c h*fallingSevenK0B (j+7-{i})' for i in range(13))
choose=' + '.join(f'fourthLow{i}K0B c h*chooseShiftSevenK0B j {i}' for i in range(13))
pol=' + '.join(f'C (fourthLow{i}K0B c h)*X^{i}' for i in range(13))
sh+=f'''\ntheorem fourthShape_fallingK0B (c h j : ℤ) :
 16*fourthShapeK0B c h j={fall} := by
 unfold fourthShapeK0B fallingSevenK0B {defs}
 ring

theorem fourthLow_CK0B (c h : ℤ) :
 fourthLowPolyK0B (C c) (C h) (X:ℤ[X])={pol} := by
 simp only [fourthLowPolyK0B,{','.join(defs.split())},map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,map_neg]

theorem fourthLow_convolutionK0B (c h : ℤ) (j : ℕ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) j={choose} := by
 rw [fourthLow_CK0B]
 simp only [convSeven_addK0B,convSeven_monomialK0B]

theorem fourthShape_convolutionK0B (c h : ℤ) (j : ℕ) (hj : 5≤j) :
 315*convSevenK0B (fourthLowPolyK0B (C c) (C h) X) j=fourthShapeK0B c h j := by
 rw [fourthLow_convolutionK0B]
 have hs := fourthShape_fallingK0B c h j
'''
for i in range(13):
 sh+=f' have h{i} := chooseShiftSeven_fallingK0B j {i} (by omega)\n norm_num only [Nat.cast_ofNat] at h{i}\n'
sh+=' linear_combination (hs + '+ ' + '.join(f'(fourthLow{i}K0B c h)*h{i}' for i in range(13))+') / 16\n'
sh+='''
theorem source_fourth_shapeK0B (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : 5≤j) (hn : j<n) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i j =
 fourthShapeK0B (frame rest).mid.b ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) j := by
 have he := source_fourth_initial_binomialK0B n rest hc i j hs hn
 have ht := fourthShape_convolutionK0B ((frame rest).mid.b:ℤ)
   ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) j hj
 have hp : fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a =
     fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
       (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X := by
   rw [fourthNumerator_zeroK0B]
   simp only [map_add,map_mul,map_natCast]
 rw [hp] at he
 change 24*coeff _ i j=convSevenK0B _ j at he
 linear_combination 315*he+ht
end
end MathGKM.Markov
'''
(R/'research/MarkovFourthShapeK0B.lean').write_text(sh)
gap=json.loads((O/'compact-gap-probe.json').read_text())['rows'][2]
assert gap['offset']==2 and gap['negative_terms']==0
gp='import MarkovFourthShapeK0B\n'+header
gp+=f'\ndef fourthGapK0B (C R J : ℤ) : ℤ :=\n {expr(gap["certificate"],["N","Z","C","R","J","T","U","x"])}\n'
gp+='''
theorem fourthGap_identityK0B (C R J : ℤ) :
 fourthShapeK0B (C+2) ((C+2)*(J+7)+R) (J+6)^2-
 fourthShapeK0B (C+2) ((C+2)*(J+7)+R) (J+5)*
 fourthShapeK0B (C+2) ((C+2)*(J+7)+R) (J+7)=fourthGapK0B C R J := by
 unfold fourthShapeK0B fourthGapK0B
 ring

theorem fourthGap_nonnegK0B (C R J : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) :
 0≤fourthGapK0B C R J := by
 unfold fourthGapK0B
 positivity

theorem fourthShape_logConcaveK0B (c h j : ℤ) (hc : 2≤c) (hj : 6≤j)
 (hh : c*(j+1)≤h) :
 fourthShapeK0B c h (j-1)*fourthShapeK0B c h (j+1)≤fourthShapeK0B c h j^2 := by
 have h1 := fourthGap_identityK0B (c-2) (h-c*(j+1)) (j-6)
 have h2 := fourthGap_nonnegK0B (c-2) (h-c*(j+1)) (j-6) (by omega) (by omega) (by omega)
 have he : (c-2+2)*(j-6+7)+(h-c*(j+1))=h := by ring
 rw [he] at h1
 have h0 : c-2+2=c := by ring
 have h5 : j-6+5=j-1 := by ring
 have h6 : j-6+6=j := by ring
 have h7 : j-6+7=j+1 := by ring
 rw [h0,h5,h6,h7] at h1
 linarith only [h1,h2]
end
end MathGKM.Markov
'''
(R/'research/MarkovFourthGapK0B.lean').write_text(gp)
print({'shape_terms':len(data['shape']),'gap_terms':gap['terms']})
