"""Exact tail decomposition and LC candidates. All identities require Lean checking."""
from pathlib import Path
from fractions import Fraction as F
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-06b5b1f9'
header='''/-! Machine-authored 06b5b1f9. Exact fourth-slice tail certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
end='end\nend MathGKM.Markov\n'
names=['N','Z','C','R','Q','T','U','x']
def expr(p):
 out=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  fs=[str(v.numerator)]
  for a,k in zip(names,ks):
   if k:fs.append(a if k==1 else a+'^'+str(k))
  out.append('*'.join(fs))
 return ' + '.join(out) or '0'
def fact(p):
 groups={}
 for ks,v in p.items():
  e=ks[-1];k=ks[:-1]+(0,);groups.setdefault(e,P())[k]=v
 return ' + '.join(('' if e==0 else 'x'+('' if e==1 else '^'+str(e))+'*')+'('+expr(q)+')' for e,q in sorted(groups.items())) or '0'
def definition(name,p,args):return f'\ndef {name} {{A : Type*}} [CommRing A] ({args} : A) : A :=\n '+fact(p)+'\n'
data=json.loads((R/'evidence/markov-8067e0c5/tail-probe.json').read_text())
h4=load(json.loads((R/'evidence/markov-fa9eb434/universal-numerator-candidates.json').read_text())['coefficients'][4])
param=[(coerce(0),coerce(0),coerce(0),coerce(0)),(coerce(0),coerce(0),coerce(0),(4*Rr-C)*X**5),(coerce(0),3*Rr-C,coerce(0),(C-2*Rr)*X**5),(2*Rr-C,C-Rr,coerce(0),2*(2*Rr-C)*X**6),(2*Rr-C,C-Rr,3*Rr-2*C,2*(C-Rr)*X**6),(2*Rr-C,C-Rr,3*Rr-2*C,2*(C-Rr)*X**6+(4*Rr-3*C)*X**7)]
mods=[];summary=[]
for ch,row in enumerate(data['charts']):
 vs=[load(v)*F(1,315) for v in row['values']]
 tail=sum((v*X**k for k,v in enumerate(vs)),coerce(0))
 q,t,u,corr=param[ch]
 top=subst(h4,[N,Z,C,Rr,q,t,u,X])+96*(1-X)**8*corr
 rem=top-(1-X)**8*tail
 assert max(k[-1] for k in rem)<=7
 text='import MarkovFullSourceFA\n'+header
 for k,v in enumerate(vs):text+=definition(f'tailV{ch}{k}M06',v,'C R')
 poly=f'tailPoly{ch}M06';rest=f'tailRem{ch}M06';seq=f'tailSeq{ch}M06'
 text+=f'\ndef {poly} {{A : Type*}} [CommRing A] (C R x : A) : A :=\n '+' + '.join(f'tailV{ch}{k}M06 C R'+('' if k==0 else '*x'+('' if k==1 else '^'+str(k))) for k in range(8))+'\n'
 text+=definition(rest,rem,'C R x')
 text+=f'\ndef {seq} (C R : ℤ) : ℕ → ℤ\n'+''.join(f' | {k} => tailV{ch}{k}M06 C R\n' for k in range(8))+' | _ => 0\n'
 text+=f'''\ntheorem tail_top_split{ch}M06 {{A : Type*}} [CommRing A] (N C R x : A) :
 fullH4FA N C R ({expr(q)}) ({expr(t)}) ({expr(u)}) x+96*(1-x)^8*({fact(corr)})=
 (1-x)^8*{poly} C R x+{rest} C R x := by
 unfold fullH4FA {poly} {rest} {' '.join(f'tailV{ch}{k}M06' for k in range(8))}
 ring

theorem tail_remainder_degree{ch}M06 (c r : ℕ) :
 ({rest} (c:ℤ[X]) r X).natDegree≤7 := by
 unfold {rest}
 compute_degree!

theorem tail_poly_coeff{ch}M06 (c r : ℤ) (k : ℕ) (hk : k≤7) :
 ({poly} (c:ℤ[X]) r X).coeff k={seq} c r k := by
 have hv0 : {poly} (c:ℤ[X]) r X=
 '''+' + '.join(f'Polynomial.C (tailV{ch}{j}M06 c r)'+('' if j==0 else '*X'+('' if j==1 else '^'+str(j))) for j in range(8))+f''' := by
   simp only [{poly},{','.join(f'tailV{ch}{j}M06' for j in range(8))},map_add,map_mul,map_pow,map_intCast,map_neg,map_ofNat,map_zero,Polynomial.C_eq_intCast]
   rw [show Polynomial.C c=(c:ℤ[X]) from Polynomial.C_eq_intCast c,
     show Polynomial.C r=(r:ℤ[X]) from Polynomial.C_eq_intCast r]
 rw [hv0]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 interval_cases k <;> norm_num [{seq}]
'''
 # Exact coefficient certificates in the two nonnegative Farey coordinates.
 p,qb=row['left'];s,ub=row['right'];cv=qb*(C+1)+ub*(Rr+1);rv=p*(C+1)+s*(Rr+1)
 chart=[subst(v,[N,Z,cv,rv,Q,T,U,X]) for v in vs]
 text+='\nattribute [local irreducible] '+ ' '.join(f'tailV{ch}{j}M06' for j in range(8))+'\n'
 for k in range(6):
  gap=chart[k+1]**2-chart[k]*chart[k+2]
  assert all(v>=0 for v in gap.values())
  name=f'tailGap{ch}{k}M06';text+=definition(name,gap,'C R')
  text+=f'''\ntheorem tail_gap{ch}{k}_eqM06 (C R : ℤ) :
 tailV{ch}{k+1}M06 ({expr(cv)}) ({expr(rv)})^2-
 tailV{ch}{k}M06 ({expr(cv)}) ({expr(rv)})*tailV{ch}{k+2}M06 ({expr(cv)}) ({expr(rv)})={name} C R := by
 unfold {name} tailV{ch}{k}M06 tailV{ch}{k+1}M06 tailV{ch}{k+2}M06
 ring
theorem tail_gap{ch}{k}_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤{name} C R := by
 unfold {name}
 positivity
'''
 text+=f'''\ntheorem tail_seq_lc{ch}M06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R)
 (k : ℕ) (hk : k≤5) :
 {seq} ({expr(cv)}) ({expr(rv)}) k*{seq} ({expr(cv)}) ({expr(rv)}) (k+2)≤
 {seq} ({expr(cv)}) ({expr(rv)}) (k+1)^2 := by
 interval_cases k
'''
 for k in range(6):text+=f' · simpa only [{seq}] using (sub_nonneg.mp ((tail_gap{ch}{k}_eqM06 C R).symm ▸ tail_gap{ch}{k}_nonnegM06 C R hc hr))\n'
 module=f'MarkovTailChamber{ch}M06';mods.append(module);(R/f'research/{module}.lean').write_text(text+end)
 summary.append(dict(chamber=ch,remainder_terms=len(rem),remainder_degree=max(k[-1] for k in rem),tail_terms=len(tail),gap_nonnegative=True))
(O/'tail-modules.json').write_text(json.dumps(mods));(O/'tail-candidates.json').write_text(json.dumps(summary,indent=2)+'\n');print(summary)
