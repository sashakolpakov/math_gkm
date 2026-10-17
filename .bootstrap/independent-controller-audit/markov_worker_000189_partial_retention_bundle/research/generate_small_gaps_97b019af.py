"""Machine-authored exact fixed-column gap certificates, unbounded depth and d."""
from top_symbolic_b3eed364 import add,scale,mul,one,x,n,F,serial
from math import comb,lcm
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-97b019af'
def cp(p,k):
 a=one
 for z in range(k):a=scale(mul(a,add(p,scale(one,-z))),F(1,z+1))
 return a
def lin(s,d,c):return add(add(scale(x,s),scale(n,d)),scale(one,c))
def masspoly(i,offset):
 a={}
 for k in range(i+4):
  a=add(a,scale(mul(cp(lin(0,1,2*i+8),i+3-k),add(cp(lin(1,0,offset),i+k),scale(cp(lin(1,0,offset+1),i+k+2),4))),comb(i+k,i)))
 return a
def expr(p):return '+\n  '.join(str(v.numerator)+(f'*h^{a}' if a else '')+(f'*d^{b}' if b else '') for (a,b),v in sorted(p.items())) or '0'
def divexact(f,g):
 out={};rem=f.copy();kg=max(g);vg=g[kg]
 while rem:
  k=max(rem);v=rem[k];z=tuple(a-b for a,b in zip(k,kg));assert min(z)>=0
  q={z:v/vg};out=add(out,q);rem=add(rem,scale(mul(q,g),-1))
 return out
rows=[]
for i in range(2,6):
 offset=i+2;a,b,c=[masspoly(k,offset) for k in [i,i+1,i+2]]
 gap=add(mul(b,b),scale(mul(a,c),-1))
 factor=one
 for j in range(i):factor=mul(factor,mul(lin(1,0,offset-j),lin(1,0,offset-j)))
 factor=mul(factor,lin(1,0,2))
 reduced=divexact(gap,factor);den=lcm(*(v.denominator for v in reduced.values()));g=scale(reduced,den)
 assert all(v>0 for v in g.values()),i
 fs='*'.join([f'(h+{offset-j})^2' for j in range(i)]+['(h+2)'])
 src=f'''import MarkovTopThirdGapMEB6
/-! Machine-authored 97b019af. Exact raw template column {i+3} gap. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 22000000
set_option maxRecDepth 40000
attribute [local irreducible] topShortQMEB6
theorem top_small_{i}_gapM97B (h d : ℚ) (hh : 0 ≤ h) (hd : 0 ≤ d) :
 topShortQMEB6 d (h+{offset}) {i}*topShortQMEB6 d (h+{offset}) {i+2} <
 topShortQMEB6 d (h+{offset}) {i+1}^2 := by
 have he : {den}*(topShortQMEB6 d (h+{offset}) {i+1}^2-
   topShortQMEB6 d (h+{offset}) {i}*topShortQMEB6 d (h+{offset}) {i+2})=
   ({fs})*({expr(g)}) := by
   unfold topShortQMEB6
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<({fs})*({expr(g)}) := by positivity
 linarith only [he,hp]

theorem top_mass_small_{i}_strictM97B (d T : ℕ) (hT : {offset} ≤ T) :
 topMassM55C d T {i}*topMassM55C d T {i+2} < topMassM55C d T {i+1}^2 := by
 have hT' : ({offset}:ℚ) ≤ T := by exact_mod_cast hT
 have h := top_small_{i}_gapM97B ((T:ℚ)-{offset}) d (by linarith) (by positivity)
 rw [sub_add_cancel,←top_short_castMEB6,←top_short_castMEB6,←top_short_castMEB6] at h
 exact_mod_cast h
end
end MathGKM.Markov
'''
 (R/f'research/MarkovTopSmall{i}GapM97B.lean').write_text(src)
 rows.append(dict(i=i,offset=offset,scale=den,terms=len(g),coefficients=serial(g)))
(O/'small-gap-certificates.json').write_text(json.dumps(dict(status='symbolic identities, pending Lean validation',rows=rows),indent=2))
print(json.dumps([{k:v for k,v in row.items() if k!='coefficients'} for row in rows]))
