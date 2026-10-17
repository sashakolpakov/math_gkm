"""Machine-authored exact certificates for the full second middle row.
Fixed columns bridge to the already proved unbounded-column region.
Symbolic computation is certificate generation; Lean must check identities.
"""
from top_symbolic_b3eed364 import add,scale,mul,one,x,F,serial
from math import comb,lcm
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8d0715b'
def lin(a,c):return add(scale(x,a),scale(one,c))
def cp(p,k):
 a=one
 for z in range(k):a=scale(mul(a,add(p,scale(one,-z))),F(1,z+1))
 return a
def mass(i,off,offset):
 a={}
 for l in range(i+4):
  a=add(a,scale(mul(cp(lin(1,off+2*i+8),i+3-l),add(cp(lin(1,offset),i+l),scale(cp(lin(1,offset+1),i+l+2),4))),comb(i+l,i)))
 return a
def divexact(f,g):
 out={};rem=f.copy();kg=max(g);vg=g[kg]
 while rem:
  k=max(rem);v=rem[k];z=tuple(a-b for a,b in zip(k,kg));assert min(z)>=0
  q={z:v/vg};out=add(out,q);rem=add(rem,scale(mul(q,g),-1))
 return out
def horner(p):
 n=max(a for a,b in p);s=str(p.get((n,0),0))
 for j in range(n-1,-1,-1):s=f'({s})*h+{p.get((j,0),0)}'
 return s
def run():
 rows=[]
 for i in range(6,13):
  src='''import MarkovTopThirdGapMEB6
/-! Machine-authored f8d0715b. Exact univariate raw-gap certificate for
the second middle row; all denominator parameters are unbounded. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 50000000
set_option maxRecDepth 100000
attribute [local irreducible] topShortQMEB6
'''
  for C in [7,8]:
   off=i+2-C;offset=i+2
   a,b,c=[mass(j,off,offset) for j in [i,i+1,i+2]]
   gap=add(mul(b,b),scale(mul(a,c),-1))
   factor=one
   for j in range(i):factor=mul(factor,mul(lin(1,offset-j),lin(1,offset-j)))
   factor=mul(factor,lin(1,2))
   reduced=divexact(gap,factor);den=lcm(*(v.denominator for v in reduced.values()));g=scale(reduced,den)
   assert all(v>0 for v in g.values()),(i,C)
   fs='*'.join([f'(h+{offset-j})^2' for j in range(i)]+['(h+2)'])
   rhs=f'({fs})*({horner(g)})'
   name=f'top_second_{i}_{C}_gapMF8D'
   src+=f'''
theorem {name} (h : ℚ) (hh : 0 ≤ h) :
 topShortQMEB6 (h+{off}) (h+{offset}) {i}*topShortQMEB6 (h+{off}) (h+{offset}) {i+2} <
 topShortQMEB6 (h+{off}) (h+{offset}) {i+1}^2 := by
 have he : {den}*(topShortQMEB6 (h+{off}) (h+{offset}) {i+1}^2-
   topShortQMEB6 (h+{off}) (h+{offset}) {i}*topShortQMEB6 (h+{off}) (h+{offset}) {i+2})=
   {rhs} := by
   unfold topShortQMEB6
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<{rhs} := by positivity
 linarith only [he,hp]

theorem top_second_{i}_{C}_strictMF8D (d T : ℕ) (hT : {offset} ≤ T)
 (hd : d+{C}=T) :
 topMassM55C d T {i}*topMassM55C d T {i+2} < topMassM55C d T {i+1}^2 := by
 have hT' : ({offset}:ℚ) ≤ T := by exact_mod_cast hT
 have hd' : (d:ℚ)+{C}=T := by exact_mod_cast hd
 have h := {name} ((T:ℚ)-{offset}) (by linarith)
 rw [sub_add_cancel,show (T:ℚ)-{offset}+{off}=d by linarith,
   ←top_short_castMEB6,←top_short_castMEB6,←top_short_castMEB6] at h
 exact_mod_cast h
'''
   rows.append(dict(i=i,C=C,scale=den,terms=len(g),coefficients=serial(g)))
  src+='end\nend MathGKM.Markov\n'
  (R/f'research/MarkovMiddleSecondC{i+3}MF8D.lean').write_text(src)
 (O/'second-certificates.json').write_text(json.dumps(dict(status='Exact symbolic generation; requires Lean validation.',rows=rows),indent=2))
 print(json.dumps([{k:v for k,v in row.items() if k!='coefficients'} for row in rows]))
if __name__=='__main__':run()
