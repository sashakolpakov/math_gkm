"""Machine-authored structured derivative, avoiding giant fourth expansion."""
from pathlib import Path
from fractions import Fraction as F
import json,re,ast
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,moment
from probe_shift_f2da221d import load
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def expr(p):
 return ' + '.join('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','Q','T','U','x'],ks) if k]) for ks,v in sorted(p.items())) or '0'
header='''import MarkovLinearMomentsCC
/-! Machine-authored cc599cf1. Structured first derivative in the shift variable. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
d=json.loads((O/'linear-local-candidates.json').read_text())
polys={}
for name in ['first','second']:
 src=(R/f'research/Markov{name.capitalize()}NormBC.lean').read_text()
 body=src.split(' : A :=\n',1)[1].split('\ntheorem',1)[0]
 polys[name]=eval(body.replace('^','**'),{'__builtins__':{}},dict(N=N,Z=Z,C=C,R=Rr,Q=Q,x=X))
for name,title in [('third','Third'),('four','Four')]:
 polys[name]=moment({ast.literal_eval(k)[:3]:load(v) for k,v in d[title]['values'].items()})
s=header
for name,p in polys.items():
 p1=P({tuple(list(k[:1])+[0]+list(k[2:])):v for k,v in p.items() if k[1]==1})
 assert all(k[4:7]==(0,0,0) for k in p1)
 s+=f'\ndef {name}ShiftCC {{A : Type*}} [CommRing A] (N C R x : A) : A :=\n '+expr(p1)+'\n'
 if name in ['first','second']:
  s+=f'''
theorem {name}Num_linearCC {{A : Type*}} [CommRing A] (N Z c r q x : A) (hz : Z^2=0) :
 {name}NumBC N Z c r q x={name}NumBC N 0 c r 0 x+Z*{name}ShiftCC N c r x := by
 simp only [{name}NumBC,{name}ShiftCC,hz,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 ring
'''
 else:
  title=name.capitalize()
  s+=f'''
theorem linear{title}_splitCC {{A : Type*}} [CommRing A] (N Z c r x : A) :
 linear{title}MomentCC N Z c r x=linear{title}MomentCC N 0 c r x+Z*{name}ShiftCC N c r x := by
 simp only [linear{title}MomentCC,{name}ShiftCC,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 ring
'''
s+='''
def fourthShiftCC {A : Type*} [CommRing A] (N c r x : A) : A :=
 fourShiftCC N c r x+
 4*(firstNumBC N 0 c r 0 x*thirdShiftCC N c r x+
    firstShiftCC N c r x*linearThirdMomentCC N 0 c r x)-
 8*firstShiftCC N c r x*(1+x)^3*(1-x)^6+
 6*secondNumBC N 0 c r 0 x*secondShiftCC N c r x-
 8*(firstNumBC N 0 c r 0 x)^3*firstShiftCC N c r x

theorem fourthNumerator_linearCC {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hz : Z^2=0) :
 fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r=
 Z*fourthShiftCC N c r x := by
 have hz3 : Z^3=0 := by rw [show 3=2+1 by omega,pow_add,hz,zero_mul]
 have hz4 : Z^4=0 := by rw [show 4=2+2 by omega,pow_add,hz,zero_mul]
 unfold fourthNumeratorBC
 dsimp only
 rw [thirdMoment_linearCC N Z x _ _ _ _ _ hz,
   thirdMoment_linearCC N 0 x _ _ _ _ _ (by simp),
   fourthMoment_linearCC N Z x c r hz,
   fourthMoment_linearCC N 0 x c r (by simp),
   firstNum_linearCC N Z _ _ _ x hz,secondNum_linearCC N Z _ _ _ x hz,
   firstNum_linearCC N 0 _ _ _ x (by simp),secondNum_linearCC N 0 _ _ _ x (by simp),
   linearThird_splitCC N Z,linearFour_splitCC N Z]
 simp only [zero_mul,add_zero]
 unfold fourthShiftCC
 ring_nf
 simp only [hz,hz3,hz4,mul_zero,zero_mul,add_zero,zero_add,sub_zero]

theorem fourthShift_mapCC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N c r x : A) :
 g (fourthShiftCC N c r x)=fourthShiftCC (g N) (g c) (g r) (g x) := by
 simp only [fourthShiftCC,firstShiftCC,secondShiftCC,thirdShiftCC,fourShiftCC,
   firstNumBC,secondNumBC,linearThirdMomentCC,map_add,map_sub,map_mul,map_pow,
   map_ofNat,map_neg,map_one,map_zero]
end
end MathGKM.Markov
'''
(R/'research/MarkovLinearDerivativeCC.lean').write_text(s)
print('derivative candidates generated')
