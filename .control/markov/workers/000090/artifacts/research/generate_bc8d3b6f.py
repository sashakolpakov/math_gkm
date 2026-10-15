"""Generate exact rational candidates. Only Lean validation establishes identities."""
from pathlib import Path
from fractions import Fraction as F
from functools import cache
from itertools import product
import json
import rational_third_bdee as z
from rational_third_bdee import N,Z,X,Rat,serialize
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bc8d3b6f'
four=json.loads((R/'evidence/markov-6604cff8/fourth-jet-candidates.json').read_text())['formulas']
z.jet=cache(z.jet);z.gauge=cache(z.gauge)
@cache
def jet4(e,q=0):
 f=four[str(e)]
 return Rat((z.exprval(f['P'],N+q)+Z*X**q*z.exprval(f['Q'],N+q))*F(1,24),9)
def d4(p,q):return jet4(3,q)+z.jet(2,0,p)*jet4(1,q)
def local4(p,q,r,s):
 a,b,c,d=z.gauge(p,q,1);a2,b2,c2,d2=z.gauge(p,q,2);a3,b3,c3,d3=z.gauge(p,q,3)
 ka,kb,kc,kd=z.gauge(q,r,1);ka2,kb2,kc2,kd2=z.gauge(q,r,2);kb3=z.gauge(q,r,3)[1]
 la,lb,lc,ld=z.gauge(r,s,1);lb2=z.gauge(r,s,2)[1]
 v2=kb2+ka-kd
 v3=kb3+ka*(lb2+la-ld)+ka2-(kb2+ka)*kd+kd**2-kd2-kc
 g2=d2+c;g3=d3+c*v2+c2;g4=d4(p,q)+c*v3+c2*v2+c3
 return 24*g4-24*d*g3-12*g2**2+24*d**2*g2-6*d**4
def expr(p,names,scale=1):
 parts=[]
 for ks,v in sorted(p.items()):
  v*=scale
  assert v.denominator==1,(ks,v)
  factors=[str(v.numerator)]
  for name,k in zip(names,ks):
   if k:factors.append(name if k==1 else name+'^'+str(k))
  parts.append('*'.join(factors))
 return ' + '.join(parts) if parts else '0'
header='''import MarkovFourthClosedN6604
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
names=['N','Z','C','R','Q','T','U','x']
def main():
 rows=[]
 for bits in product((0,1),repeat=4):
  ans=local4(*bits); key=''.join(map(str,bits))
  rows.append(dict(bits=bits,denominator=ans.d,terms=len(ans.p),numerator=serialize(ans.p)))
  print(key,ans.d,len(ans.p),sorted({v.denominator for v in ans.p.values()}),flush=True)
  assert ans.d<=8
  poly=ans.p*(1-X)**(8-ans.d)
  body=expr(poly,names)
  text=header+f'\ndef localFourNum{key}BC (N Z x : RunFieldBDEE) : RunFieldBDEE :=\n {body}\n'
  bs=' '.join('true' if b else 'false' for b in bits)
  text+=f'''theorem localFour_normalize_{key}BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n {bs}=
 localFourNum{key}BC n (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604 closedGaugeD4N6604 closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 unfold closedJetBDEE closedB4N6604 closedD4N6604 jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed00BDEE jetClosed01BDEE jetClosed02BDEE jetClosed03BDEE
   jetClosed10BDEE jetClosed11BDEE jetClosed12BDEE jetClosed13BDEE
   jetClosed20BDEE jetClosed21BDEE jetClosed22BDEE jetClosed23BDEE
   jetClosed30BDEE jetClosed31BDEE jetClosed32BDEE jetClosed33BDEE
   jetClosed14N6604 jetClosed34N6604 localFourNum{key}BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,
   Nat.cast_add,Nat.cast_one,pow_succ]
 change (1-runEmbedBDEE X)^8*_=_
 field_simp [one_sub_runX_neBDEE]
 ring
end
end MathGKM.Markov
'''
  (R/f'research/MarkovFourthNorm{key}BC.lean').write_text(text)
 (O/'normalization-candidates.json').write_text(json.dumps(rows,indent=2)+'\n')
if __name__=='__main__':main()
