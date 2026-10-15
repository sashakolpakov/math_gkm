"""Machine-authored backwards onset certificates. Generated identities require Lean checking."""
from pathlib import Path
from math import comb
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm/research');O=R.parent/'evidence/markov-1b02dddc'
names=['n','z','c','r','q','t','u','x']
def expr(p):
 out=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  fs=[str(v.numerator)]
  for name,k in zip(names,ks):
   if k:fs.append(name if k==1 else f'{name}^{k}')
  out.append('*'.join(fs))
 return ' + '.join(out) or '0'
def definition(name,p,args):return f'\ndef {name} ({args} : ℤ) : ℤ :=\n {expr(p)}\n'
header='''/-! Machine-authored 1b02dddc. Backwards onset algebra; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
'''
end='end\nend MathGKM.Markov\n'
h3=load(json.loads((R.parent/'evidence/markov-fa9eb434/universal-numerator-candidates.json').read_text())['coefficients'][3])
parts={}
for ks,v in h3.items():
 d=14-ks[-1];k=ks[:-1]+(0,)
 parts.setdefault(d,P())[k]=v
assert all(0<=d<=10 for d in parts)
pn=lambda d:f'penPart{d}M1B'
st='import MarkovFullDegree3M06\nimport MarkovConvK0B\n'+header
for d,p in sorted(parts.items()):st+=definition(pn(d),p,'n c r q t u')
poly=' + '.join(f'Polynomial.C ({pn(d)} n c r q t u)*X^{d}' for d in sorted(parts))
revpoly=' + '.join(f'Polynomial.C ({pn(d)} n c r q t u)*X^{14-d}' for d in sorted(parts))
st+='\ndef penPolyM1B (n c r q t u : ℤ) : ℤ[X] :=\n '+poly+'\n'
st+=f'''\ntheorem pen_reflectM1B (n c r q t u : ℤ) :
 reflect 14 (fullH3FA (n:ℤ[X]) c r q t u X)=penPolyM1B n c r q t u := by
 have he : fullH3FA (n:ℤ[X]) c r q t u X={revpoly} := by
  simp only [fullH3FA,{','.join(pn(d) for d in parts)},
   map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_zero,map_one,Polynomial.C_eq_intCast]
  ring
 rw [he]
 simp only [reflect_add,reflect_C_mul_X_pow]
 norm_num [revAt,penPolyM1B]
'''
corrections={}
for k in range(1,7):
 corr=sum((v*315*comb(7+6-k-d,7) for d,v in parts.items() if d<=6-k),coerce(0))
 corrections[k]=corr
 st+=definition(f'penCorr{k}M1B',corr,'n c r q t u')
 st+=f'''\ntheorem pen_conv{k}M1B (n c r q t u : ℤ) :
 315*convSevenK0B (penPolyM1B n c r q t u) {6-k}=penCorr{k}M1B n c r q t u := by
 unfold penPolyM1B
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 norm_num [chooseShiftSevenK0B]
 unfold penCorr{k}M1B {' '.join(pn(d) for d in parts)}
 ring
'''
(R/'MarkovPenultimateM1B.lean').write_text(st+end)
param=[(coerce(0),coerce(0),coerce(0)),(coerce(0),coerce(0),coerce(0)),(coerce(0),3*Rr-C,coerce(0)),(2*Rr-C,C-Rr,coerce(0)),(2*Rr-C,C-Rr,3*Rr-2*C),(2*Rr-C,C-Rr,3*Rr-2*C)]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
backs=json.loads((R.parent/'evidence/markov-94b1de05/backward-candidates.json').read_text())
saved=[]
for ch,(q,t,u) in enumerate(param):
 st=f'import MarkovBackwardChamber{ch}M94\nimport MarkovPenultimateM1B\n'+header
 vals=[]
 for k in range(1,9):
  corr=subst(corrections[k],[N,Z,C,Rr,q,t,u,X]) if k<=6 else coerce(0)
  st+=definition(f'onsetCorrection{ch}_{k}M1B',corr,'n c r')
  st+=f'\ndef onsetValue{ch}_{k}M1B (n c r : ℤ) : ℤ :=\n backShape{ch}M94 c r (n-{k})+onsetCorrection{ch}_{k}M1B n c r\n'
  if k<=6:
   st+=f'''\ntheorem onsetCorrection{ch}_{k}_eqM1B (n c r : ℤ) :
 penCorr{k}M1B n c r ({expr(q)}) ({expr(t)}) ({expr(u)})=onsetCorrection{ch}_{k}M1B n c r := by
 unfold penCorr{k}M1B onsetCorrection{ch}_{k}M1B
 ring
'''
  vals.append(subst(load(backs[ch]['shape']),[N,Z,C,Rr,Q,N-k,U,X])+corr)
 (R/f'MarkovOnsetValues{ch}M1B.lean').write_text(st+end)
 (a,b),(s,tb)=bounds[ch:ch+2];cv=b*(C+1)+tb*(Rr+1);rv=a*(C+1)+s*(Rr+1)
 chartvals=[subst(v,[N+7,Z,cv,rv,Q,T,U,X]) for v in vals]
 for k in range(1,7):
  v0,v1,v2=chartvals[k-1:k+2];gap=v1*v1-v0*v2
  assert all(v>=0 for v in gap.values()),(ch,k)
  st=f'import MarkovOnsetValues{ch}M1B\n'+header
  st+=definition(f'onsetGap{ch}_{k}M1B',gap,'n c r')
  st+=f'''\ntheorem onset_gap{ch}_{k}M1B (n c r : ℤ) :
 onsetValue{ch}_{k+1}M1B (n+7) ({expr(cv)}) ({expr(rv)})^2-
 onsetValue{ch}_{k}M1B (n+7) ({expr(cv)}) ({expr(rv)})*
 onsetValue{ch}_{k+2}M1B (n+7) ({expr(cv)}) ({expr(rv)})=onsetGap{ch}_{k}M1B n c r := by
 unfold onsetValue{ch}_{k}M1B onsetValue{ch}_{k+1}M1B onsetValue{ch}_{k+2}M1B
 unfold backShape{ch}M94 onsetCorrection{ch}_{k}M1B onsetCorrection{ch}_{k+1}M1B onsetCorrection{ch}_{k+2}M1B onsetGap{ch}_{k}M1B
 ring
theorem onset_lc{ch}_{k}M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue{ch}_{k}M1B (n+7) ({expr(cv)}) ({expr(rv)})*
 onsetValue{ch}_{k+2}M1B (n+7) ({expr(cv)}) ({expr(rv)})≤
 onsetValue{ch}_{k+1}M1B (n+7) ({expr(cv)}) ({expr(rv)})^2 := by
 apply sub_nonneg.mp
 rw [onset_gap{ch}_{k}M1B]
 unfold onsetGap{ch}_{k}M1B
 positivity
'''
  (R/f'MarkovOnsetGap{ch}_{k}M1B.lean').write_text(st+end)
  saved.append(dict(chamber=ch,k=k,gap_terms=len(gap),negative_terms=0,values=[serialize(v) for v in [v0,v1,v2]],gap=serialize(gap)))
  print(ch,k,len(gap),flush=True)
(O/'onset-candidates.json').write_text(json.dumps(saved,indent=2)+'\n')
