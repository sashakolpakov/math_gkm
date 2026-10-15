"""Machine-authored backwards third-block algebra; generated identities need Lean validation."""
from pathlib import Path
from fractions import Fraction as F
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
ROOT=Path('/Users/sasha/math_gkm');R=ROOT/'research';O=ROOT/'evidence/markov-94b1de05'
names=['n','z','c','r','q','e','u','x']
def expr(p):
 terms=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  fs=[str(v.numerator)]
  for name,k in zip(names,ks):
   if k:fs.append(name if k==1 else f'{name}^{k}')
  terms.append('*'.join(fs))
 return ' + '.join(terms) or '0'
def definition(name,p,args):return f'\ndef {name} ({args} : ℤ) : ℤ :=\n '+expr(p)+'\n'
header='''/-! Machine-authored 94b1de05. Backwards fourth-slice algebra. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 32000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
'''
end='end\nend MathGKM.Markov\n'
h4=load(json.loads((ROOT/'evidence/markov-fa9eb434/universal-numerator-candidates.json').read_text())['coefficients'][4])
param=[(coerce(0),coerce(0),coerce(0),coerce(0)),(coerce(0),coerce(0),coerce(0),(4*Rr-C)*X**5),(coerce(0),3*Rr-C,coerce(0),(C-2*Rr)*X**5),(2*Rr-C,C-Rr,coerce(0),2*(2*Rr-C)*X**6),(2*Rr-C,C-Rr,3*Rr-2*C,2*(C-Rr)*X**6),(2*Rr-C,C-Rr,3*Rr-2*C,2*(C-Rr)*X**6+(4*Rr-3*C)*X**7)]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
third=json.loads((ROOT/'evidence/markov-8067e0c5/third-block-probe.json').read_text())['charts']
saved=[]
for ch,(q,t,u,corr) in enumerate(param):
 top=subst(h4,[N,Z,C,Rr,q,t,u,X])+96*(1-X)**8*corr
 parts={}
 for ks,v in top.items():
  degree=15-ks[-1];k=ks[:-1]+(0,)
  parts.setdefault(degree,P())[k]=v
 assert all(0<=d<=10 for d in parts)
 shape=coerce(0)
 for d,p in parts.items():
  falling=coerce(1)
  for a in range(7):falling*=T+14-d-a
  shape+=p*falling*F(1,16)
 pn=lambda d:f'backPart{ch}_{d}M94'
 bp=f'backPoly{ch}M94';bs=f'backShape{ch}M94'
 s=f'import MarkovTailSource{ch}M06\nimport MarkovConvK0B\n'+header
 for d,p in sorted(parts.items()):s+=definition(pn(d),p,'c r')
 poly=' + '.join(f'Polynomial.C ({pn(d)} c r)*X^{d}' for d in sorted(parts))
 revpoly=' + '.join(f'Polynomial.C ({pn(d)} c r)*X^{15-d}' for d in sorted(parts))
 s+=f'\ndef {bp} (c r : ℤ) : ℤ[X] :=\n {poly}\n'
 s+=definition(bs,shape,'c r e')
 s+=f'''\ntheorem back_reflect{ch}M94 (c r : ℤ) :
 reflect 15 ((1-X)^8*tailPoly{ch}M06 (c:ℤ[X]) r X+tailRem{ch}M06 (c:ℤ[X]) r X)=
 {bp} c r := by
 have he : (1-X)^8*tailPoly{ch}M06 (c:ℤ[X]) r X+tailRem{ch}M06 (c:ℤ[X]) r X=
  {revpoly} := by
  simp only [tailPoly{ch}M06,tailRem{ch}M06,{','.join(f'tailV{ch}{d}M06' for d in range(8))},{','.join(pn(d) for d in parts)},
   map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_zero,map_one,Polynomial.C_eq_intCast]
  rw [show Polynomial.C c=(c:ℤ[X]) from Polynomial.C_eq_intCast c,
    show Polynomial.C r=(r:ℤ[X]) from Polynomial.C_eq_intCast r]
  ring
 rw [he]
 simp only [reflect_add,reflect_C_mul_X_pow]
 norm_num [revAt,{bp}]

theorem back_falling{ch}M94 (c r e : ℤ) :
 16*{bs} c r e=
 '''+' + '.join(f'{pn(d)} c r*fallingSevenK0B (e+14-{d})' for d in sorted(parts))+f''' := by
 unfold {bs} fallingSevenK0B {' '.join(pn(d) for d in parts)}
 ring

theorem back_convolution{ch}M94 (c r : ℤ) (j : ℕ) (hj : 3≤j) :
 315*convSevenK0B ({bp} c r) j={bs} c r ((j:ℤ)-7) := by
 unfold {bp}
 simp only [convSeven_addK0B,convSeven_monomialK0B]
 have hs := back_falling{ch}M94 c r ((j:ℤ)-7)
'''
 for d in sorted(parts):
  s+=f' have h{d} := chooseShiftSeven_fallingK0B j {d} (by omega)\n norm_num only [Nat.cast_ofNat] at h{d}\n'
 s+=' have he : (j:ℤ)-7+14=(j:ℤ)+7 := by ring\n rw [he] at hs\n'
 s+=' rw ['+','.join(f'←h{d}' for d in sorted(parts))+'] at hs\n nlinarith only [hs]\n'
 mod=f'MarkovBackwardChamber{ch}M94';(R/f'{mod}.lean').write_text(s+end)
 (p,qb),(ss,tt)=bounds[ch:ch+2];cv=qb*(C+1)+tt*(Rr+1);rv=p*(C+1)+ss*(Rr+1)
 vals=[subst(shape,[N,Z,cv,rv,Q,T-i,U,X]) for i in range(3)]
 assert vals==[load(v) for v in third[ch]['values']],ch
 gap=vals[1]**2-vals[0]*vals[2]
 assert all(v>=0 for v in gap.values())
 s=f'import {mod}\n'+header
 s+=definition(f'backGap{ch}M94',gap,'c r e')
 s+=f'''\ntheorem back_gap{ch}M94 (c r e : ℤ) :
 {bs} ({expr(cv)}) ({expr(rv)}) (e-1)^2-
 {bs} ({expr(cv)}) ({expr(rv)}) e*{bs} ({expr(cv)}) ({expr(rv)}) (e-2)=backGap{ch}M94 c r e := by
 unfold {bs} backGap{ch}M94
 ring
theorem back_lc{ch}M94 (c r e : ℤ) (hc : 0≤c) (hr : 0≤r) (he : 0≤e) :
 {bs} ({expr(cv)}) ({expr(rv)}) e*{bs} ({expr(cv)}) ({expr(rv)}) (e-2)≤
 {bs} ({expr(cv)}) ({expr(rv)}) (e-1)^2 := by
 apply sub_nonneg.mp
 rw [back_gap{ch}M94]
 unfold backGap{ch}M94
 positivity
'''
 (R/f'MarkovBackwardGap{ch}M94.lean').write_text(s+end)
 saved.append(dict(chamber=ch,shape=serialize(shape),parts={d:serialize(p) for d,p in parts.items()},gap=serialize(gap),candidate_matches=True))
(O/'backward-candidates.json').write_text(json.dumps(saved,indent=2)+'\n')
print([(d['chamber'],len(d['shape']),len(d['gap'])) for d in saved])
