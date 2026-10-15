"""Machine-authored shift polynomial and falling-coefficient identities."""
from pathlib import Path
import json
from rational_third_bdee import P
from probe_shift_f2da221d import load
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def expr(p,names):
 return ' + '.join('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(names,ks) if k]) for ks,v in sorted(p.items())) or '0'
data=json.loads((O/'linear-factor.json').read_text());lin=load(data['linear']);shape=load(data['shape'])
head='''import MarkovLinearDerivativeCC
import MarkovFourthBoundaryF2
/-! Machine-authored cc599cf1. Explicit coefficient identities, independently ring-checked. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
s=head
for i in range(13):
 p=P({k[:-1]+(0,):v for k,v in lin.items() if k[-1]==i})
 s+=f'\ndef shiftPart{i}CC {{A : Type*}} [CommRing A] (N C R : A) : A :=\n '+expr(p,['N','Z','C','R','J','T','U','x'])+'\n'
s+='\ndef shiftPolyCC {A : Type*} [CommRing A] (N c r x : A) : A :=\n '+' + '.join(f'shiftPart{i}CC N c r*x^{i}' for i in range(13))+'\n'
s+='''
theorem fourthShift_polyCC {A : Type*} [CommRing A] (N c r x : A) :
 fourthShiftCC N c r x=shiftPolyCC N c r x := by
 unfold fourthShiftCC firstShiftCC secondShiftCC thirdShiftCC fourShiftCC
   firstNumBC secondNumBC linearThirdMomentCC shiftPolyCC
'''
s+='   '+' '.join(f'shiftPart{i}CC' for i in range(13))+'\n ring\n'
s+='\ndef shiftShapeCC (N C R J : ℤ) : ℤ :=\n '+expr(shape,['N','Z','C','R','J','T','U','x'])+'\n'
s+='\ntheorem shiftShape_fallingCC (n c r j : ℤ) :\n 16*shiftShapeCC n c r j=\n '+' + '.join(f'shiftPart{i}CC n c r*fallingSevenK0B (j+7-{i})' for i in range(13))+' := by\n unfold shiftShapeCC fallingSevenK0B\n   '+' '.join(f'shiftPart{i}CC' for i in range(13))+'\n ring\n'
s+='''
theorem shiftPoly_CCC (n c r : ℤ) :
 shiftPolyCC (C n) (C c) (C r) (X:ℤ[X])=
 '''+' + '.join(f'C (shiftPart{i}CC n c r)*X^{i}' for i in range(13))+''' := by
 simp only [shiftPolyCC,'''+','.join(f'shiftPart{i}CC' for i in range(13))+''',map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,map_neg,map_zero]

theorem shiftPoly_convolutionCC (n c r : ℤ) (j : ℕ) :
 convSevenK0B (shiftPolyCC (C n) (C c) (C r) X) j=
 '''+' + '.join(f'shiftPart{i}CC n c r*chooseShiftSevenK0B j {i}' for i in range(13))+''' := by
 rw [shiftPoly_CCC]
 simp only [convSeven_addK0B,convSeven_monomialK0B]

theorem shiftShape_convolutionCC (n c r : ℤ) (j : ℕ) (hj : 5≤j) :
 315*convSevenK0B (shiftPolyCC (C n) (C c) (C r) X) j=shiftShapeCC n c r j := by
 rw [shiftPoly_convolutionCC]
 have hs := shiftShape_fallingCC n c r j
'''
for i in range(13):s+=f' have h{i} := chooseShiftSeven_fallingK0B j {i} (by omega)\n norm_num only [Nat.cast_ofNat] at h{i}\n'
s+=' rw ['+','.join(f'←h{i}' for i in range(13))+'] at hs\n nlinarith only [hs]\nend\nend MathGKM.Markov\n'
(R/'research/MarkovShiftShapeCC.lean').write_text(s)
print('shape module generated')
