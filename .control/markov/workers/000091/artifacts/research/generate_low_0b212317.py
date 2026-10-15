"""Machine-authored compact zero-Z numerator and falling coefficient candidate."""
from pathlib import Path
from fractions import Fraction as F
import json
from rational_third_bdee import P, N, C, Rr, Q, X, serialize, coerce
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-0b212317'
def expr(p,names=['N','Z','C','R','J','T','U','x']):
 out=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1,(ks,v)
  fs=[str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(names,ks) if k]
  out.append('*'.join(fs))
 return ' + '.join(out) or '0'
def subst(p,vals):
 out=coerce(0);powers={(i,k):vals[i]**k for i in range(8) for k in {a[i] for a in p}}
 for ks,v in p.items():
  z=coerce(v)
  for i,k in enumerate(ks):
   if k:z=z*powers[i,k]
  out=out+z
 return out
data=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows'][0]['low_numerator']
low=P({tuple(k):F(v) for k,v in data})
compact=P({k:v for k,v in low.items() if k[0]==0})
assert subst(compact,[N,coerce(0),C,N*C+Rr,Q,coerce(0),coerce(0),X])==low
parts=[]
for i in range(13):
 parts.append(P({k[:-1]+(0,):v for k,v in compact.items() if k[-1]==i}))
header='''import MarkovMomentZeroK0B
/-! Machine-authored request 0b212317. Uniform pre-shift numerator, with H=N*C+R. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
text=header
names=['N','Z','C','H','J','T','U','x']
for i,p in enumerate(parts):
 text+=f'\ndef fourthLow{i}K0B {{A : Type*}} [CommRing A] (C H : A) : A :=\n {expr(p,names)}\n'
text+='\ndef fourthLowPolyK0B {A : Type*} [CommRing A] (C H x : A) : A :=\n '+ ' + '.join(f'fourthLow{i}K0B C H*x^{i}' for i in range(13))+'\n'
text+='''\ntheorem fourthNumerator_zeroK0B {A : Type*} [CommRing A] (N x : A) (c r : ℕ) :
 fourthNumeratorBC N 0 x c r=fourthLowPolyK0B (c:A) (N*c+r) x := by
 unfold fourthNumeratorBC
 dsimp only
 rw [thirdMoment_zeroK0B,fourMoment_zeroK0B]
 simp only [firstNumBC,secondNumBC,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 unfold fourthLowPolyK0B '''+' '.join(f'fourthLow{i}K0B' for i in range(13))+''' zeroThird0K0B zeroThird1K0B zeroFour0K0B zeroFour1K0B
 ring
end
end MathGKM.Markov
'''
(R/'research/MarkovFourthLowK0B.lean').write_text(text)
shape=P()
for k,v in compact.items():
 f=coerce(v)
 for t in range(7):f=f*(Q+7-k[-1]-t)
 shape=shape+f*C**k[2]*Rr**k[3]
assert all(v.denominator==1 for v in shape.values())
shape=shape*F(1,16)
assert all(v.denominator==1 for v in shape.values())
(O/'compact-low-candidates.json').write_text(json.dumps(dict(low=serialize(compact),parts=[serialize(p) for p in parts],shape=serialize(shape),shape_scale=315,raw_scale=7560),indent=2)+'\n')
print({'compact_terms':len(compact),'shape_terms':len(shape),'shape_scale':315})
