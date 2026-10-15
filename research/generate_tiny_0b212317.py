"""Machine-authored local square-zero reductions to avoid full moment expansion."""
from pathlib import Path
from fractions import Fraction as F
from itertools import product
import json
from rational_third_bdee import P,X,local
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0b212317'
gauges=json.loads((R/'evidence/markov-bc8d3b6f/gauge-normalization-candidates.json').read_text())
defs=[f'gauge{r["e"]}{r["k"]}BC' for r in gauges[:11]]+[r['name'] for r in gauges]
four=json.loads((R/'evidence/markov-bc8d3b6f/normalization-candidates.json').read_text())
def expr(p):
 return ' + '.join('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','J','T','U','x'],ks) if k]) for ks,v in sorted(p.items())) or '0'
header='''import MarkovMomentZeroK0B
/-! Machine-authored request 0b212317. Local square-zero coefficient reductions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
hp=''
for i in range(3,15):hp+=f' have hx{i} : x^{i}=0 := by rw [show {i}=2+{i-2} by omega,pow_add,hx,zero_mul]\n'
for title,arity in [('Third',3),('Four',4)]:
 vals={}
 for bs in product((0,1),repeat=arity):
  if arity==3:
   z=local(*bs);p=z.p*(1-X)**(6-z.d)
  else:
   row=next(row for row in four if tuple(row['bits'])==bs)
   p=P({tuple(k):F(v) for k,v in row['numerator']})*(1-X)**(8-row['denominator'])
  vals[bs]=P({k:v for k,v in p.items() if k[-1]<2})
 assert all(p==vals[bs[:2]+(0,)*(arity-2)] for bs,p in vals.items())
 text=header
 text+=f'\ndef tiny{title}K0B {{A : Type*}} [CommRing A] (N Z x : A) (p q : Bool) : A :=\n match p,q with\n'
 for p,q in product((0,1),repeat=2):text+=f' | {str(bool(p)).lower()},{str(bool(q)).lower()} => {expr(vals[(p,q)+(0,)*(arity-2)])}\n'
 args='p q r' if arity==3 else 'p q r s'
 text+=f'\ntheorem local{title}_tinyK0B {{A : Type*}} [CommRing A] (N Z x : A) ({args} : Bool) (hx : x^2=0) :\n local{title}NumBC N Z x {args}=tiny{title}K0B N Z x p q := by\n'+hp
 text+=' '+' <;> '.join('cases '+b for b in args.split())+'\n all_goals\n  simp only ['+','.join([f'local{title}NumBC',f'tiny{title}K0B']+defs+['hx']+[f'hx{i}' for i in range(3,15)]+['zero_pow','mul_zero','zero_mul','add_zero','zero_add','sub_zero'])+']\n  ring_nf\n  simp only ['+','.join(['hx']+[f'hx{i}' for i in range(3,15)]+['mul_zero','zero_mul','add_zero','zero_add'])+']\nend\nend MathGKM.Markov\n'
 (R/f'research/Markov{title}TinyK0B.lean').write_text(text)
text=header.replace('import MarkovMomentZeroK0B','import MarkovThirdTinyK0B\nimport MarkovFourTinyK0B')
text+='''
theorem thirdMoment_tinyK0B {A : Type*} [CommRing A] (N Z x c r q t u : A) (hx : x^2=0) :
 boolMomentADB2 (localThirdNumBC N Z x) c r q t u=
 boolMomentADB2 (localThirdNumBC N 0 x) c r q t u := by
 have he (Z : A) : localThirdNumBC N Z x=(fun p q _ => tinyThirdK0B N Z x p q) := by
   funext p q r; exact localThird_tinyK0B N Z x p q r hx
 rw [he Z,he 0]
 unfold boolMomentADB2 boolJetADB2 tinyThirdK0B
 ring

theorem fourMoment_tinyK0B {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) (hx : x^2=0) :
 fourMomentBE (localFourNumBC N Z x) c r=
 fourMomentBE (localFourNumBC N 0 x) c r := by
 have he (Z : A) : localFourNumBC N Z x=(fun p q _ _ => tinyFourK0B N Z x p q) := by
   funext p q r s; exact localFour_tinyK0B N Z x p q r s hx
 rw [he Z,he 0]
 unfold fourMomentBE fourSourceMoment897
 split_ifs <;> unfold boolMomentADB2 boolJetADB2 fourTripleBE fourQuadBE fourCanonicalBE fourPotentialBE tinyFourK0B <;> ring

theorem fourthNumerator_sqzeroK0B {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hx : x^2=0) :
 fourthNumeratorBC N Z x c r=fourthNumeratorBC N 0 x c r := by
'''+hp+'''
 have hf : firstNumBC N Z (c:A) r (2*r-c:ℕ) x=firstNumBC N 0 c r (2*r-c:ℕ) x := by
   simp only [firstNumBC,hx,hx3,mul_zero,zero_mul,add_zero,zero_add]
 have hs : secondNumBC N Z (c:A) r (2*r-c:ℕ) x=secondNumBC N 0 c r (2*r-c:ℕ) x := by
   simp only [secondNumBC,hx,hx3,hx4,hx5,hx6,hx7,mul_zero,zero_mul,add_zero,zero_add]
 unfold fourthNumeratorBC
 dsimp only
 rw [hf,hs,thirdMoment_tinyK0B N Z x _ _ _ _ _ hx,fourMoment_tinyK0B N Z x c r hx]
end
end MathGKM.Markov
'''
(R/'research/MarkovFourthSqZeroK0B.lean').write_text(text)
