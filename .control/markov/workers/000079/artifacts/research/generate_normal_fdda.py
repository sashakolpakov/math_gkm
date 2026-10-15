"""Machine-authored algebra certificates from inherited exact jet formulas."""
from pathlib import Path
import rational_third_bdee as m
from fractions import Fraction
from itertools import product
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fddabb33'
def poly(p,names=['N','Z','c','r','q','t','u','x']):
 ts=[]
 for ks,v in sorted(p.items()):
  f=[str(v.numerator) if v.denominator==1 else f'({v.numerator}/{v.denominator})']
  f += [s if k==1 else f'{s}^{k}' for s,k in zip(names,ks) if k]
  ts.append('*'.join(f))
 return ' + '.join(ts) or '0'
def rat(p):return f'({poly(p.p)}) / (1-x)^{p.d}' if p.d else f'({poly(p.p)})'
head='''/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
tail='end\nend MathGKM.Markov\n'
s='import MarkovThirdClosedBDEE\n'+head
for e,k in product(range(4),repeat=2):
 s+=f'def normalJet{e}{k}FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=\n {rat(m.jet(e,k))}\n'
for e,k in product(range(4),repeat=2):
 s+=f'''theorem normal_jet_{e}{k}FDDA (n : ℕ) :
 closedJetBDEE {e} {k} n=normalJet{e}{k}FDDA n (runXBDEE^n) runXBDEE := by
 change runEmbedBDEE (jetClosed{e}{k}BDEE n)/(6*(1-runXBDEE)^{2*k+1})=_
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed{e}{k}BDEE,normalJet{e}{k}FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
'''
s+=tail
(R/'research/MarkovNormalJetsFDDA.lean').write_text(s)
# Generic local formulas use only nine normalized jets, independently of source paths.
for bits in product((0,1),repeat=3):
 p,q,r=bits;tag=''.join(map(str,bits));v=m.local(*bits)
 ss='import MarkovNormalJetsFDDA\n'+head
 def jet(e,k,d):return f'(normalJet{e}{k}FDDA (N+{d}) (Z*x^{d}) x)'
 def gauge(p,q,k):
  a,b,c,d=[jet(e,k,q) for e in range(4)];hp=jet(2,0,p);hq=jet(2,0,q)
  return [f'({a}-{hq}*{b})',b,f'({c}+{hp}*{a}-{hq}*{d}-{hp}*{hq}*{b})',f'({d}+{hp}*{b})']
 a,b,c,d=gauge(p,q,1);a2,b2,c2,d2=gauge(p,q,2);d3=gauge(p,q,3)[3]
 ka,kb,kc,kd=gauge(q,r,1);kb2=gauge(q,r,2)[1]
 expr=f'2*{d}^3-6*{d}*{d2}+6*{d3}+6*({c}*{kb2}+{c2}*{kb})-6*{c}*{kb}*({d}+{kd})+6*{c}*{ka}'
 ss+=f'def normalLocal{tag}FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=\n {poly(v.p)}\n'
 ss+=f'''theorem normal_local_generic_{tag}FDDA (N Z x : RunFieldBDEE) (hx : 1-x≠0) :
 (1-x)^6*({expr})=normalLocal{tag}FDDA N Z x := by
 unfold normalLocal{tag}FDDA '''+' '.join(f'normalJet{e}{k}FDDA' for e,k in [(0,1),(0,2),(1,3),(1,1),(1,2),(2,0),(2,1),(2,2),(3,1),(3,2),(3,3)])+'''
 field_simp
 <;> ring
'''
 ss+=tail
 (R/f'research/MarkovNormalLocal{tag}FDDA.lean').write_text(ss)
print(json.dumps(dict(jets=16,locals=8)))
