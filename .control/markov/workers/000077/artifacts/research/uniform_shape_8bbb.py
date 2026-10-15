"""Machine-authored candidate extraction and exact ring certificate generation.
Finite interpolation is NOT a proof of source identification.
"""
from pathlib import Path
from fractions import Fraction as F
from math import factorial,lcm
import json
import uniform_probe_8bbb as e
class Q(dict):
 def __add__(a,b):
  b=b if isinstance(b,Q) else Q({(0,0,0,0):b});d=Q(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return Q({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return Q({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,Q) else Q({(0,0,0,0):b});d=Q()
  for k,v in a.items():
   for l,w in b.items():
    z=tuple(i+j for i,j in zip(k,l));d[z]=d.get(z,0)+v*w
  return Q({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  z=Q({(0,0,0,0):1})
  for _ in range(n):z=z*a
  return z
def var(i):return Q({tuple(int(k==i) for k in range(4)):1})
def choose(z,k):
 p=Q({(0,0,0,0):F(1,factorial(k))})
 for i in range(k):p=p*(z-i)
 return p
def subst(p,vs):
 out=Q()
 for ks,v in p.items():
  t=Q({(0,0,0,0):v})
  for a,k in zip(vs,ks):t=t*a**k
  out=out+t
 return out
def horner(p,names):
 if not p:return '0'
 def rec(d,idx):
  if idx==4:return str(int(sum(d.values())))
  groups={}
  for k,v in d.items():groups.setdefault(k[idx],{})[k]=v
  m=max(groups);z=rec(groups[m],idx+1)
  for j in range(m-1,-1,-1):z='('+z+'*'+names[idx]+'+'+rec(groups[j],idx+1)+')' if j in groups else '('+z+'*'+names[idx]+')'
  return z
 return rec(p,0)
def main():
 c=e.P({(1,0):1});r=e.P({(0,1):1});cache={}
 def value(s,t):
  j=t+4;n=j+s+1
  if n not in cache:cache[n]=e.base.candidate(n,c,r,0,0,0)
  return cache[n][j]
 grid=e.newton_grid([[value(s,t) for t in range(7)] for s in range(5)])
 assert all(not p for i,row in enumerate(grid) for j,p in enumerate(row) if i==4 or j==6)
 n,c,r,j=map(var,range(4));poly=Q()
 for si,row in enumerate(grid):
  for ti,p in enumerate(row):
   a=Q({(0,ci,ri,0):v for (ci,ri),v in p.items()})
   poly=poly+a*choose(n-j-1,si)*choose(j-4,ti)
 scale=lcm(*(F(v).denominator for v in poly.values()))
 poly=Q({k:int(v*scale) for k,v in poly.items()})
 t,s,u,v=map(var,range(4));vs=[t+s+6,u+v+2,u+1,t+5]
 center=subst(poly,vs);left=subst(poly,[*vs[:3],vs[3]-1]);right=subst(poly,[*vs[:3],vs[3]+1]);gap=center**2-left*right
 negatives={k:v for k,v in gap.items() if v<0}
 checks=[]
 for nn,jj,cc,rr in [(12,4,7,3),(25,19,8,5),(41,27,19,7),(30,29,3,1),(30,12,2,1)]:
  g=e.base.candidate(nn,cc,rr,max(2*rr-cc,0),min(cc-rr,max(3*rr-cc,0)),max(3*rr-2*cc,0))[jj]
  val=sum(v*nn**ks[0]*cc**ks[1]*rr**ks[2]*jj**ks[3] for ks,v in poly.items())
  assert val==scale*g,(nn,jj,cc,rr,val,scale*g)
  checks.append([nn,jj,cc,rr,val])
 expr=horner(poly,['n','c','r','j']);gexpr=horner(gap,['t','s','u','v'])
 rec=dict(status='Candidate coefficient identity is finite interpolation only; abstract polynomial inequality generated for Lean',
   scale=scale,coefficient_terms=[[list(k),v] for k,v in sorted(poly.items())],coefficient_expression=expr,
   gap_terms=len(gap),negative_terms=[[list(k),v] for k,v in negatives.items()],checks=checks,
   intended_bridge='shape(n,c,r,j) = scale * thirdRunPolyADB2(n,c,r).coeff j for 4<=j<=n-1; NOT proved')
 Path('evidence/markov-8bbb934e/uniform-shape.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k not in ['coefficient_terms','coefficient_expression','checks']}),flush=True)
 if negatives:return
 lean='''import MathGKM.Markov
/-! Machine-authored request 8bbb934e. Abstract uniform-run interior candidate.
The source coefficient identity remains UNPROVED. This is not a source inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
def thirdInteriorShape8BBB (n c r j : ℤ) : ℤ :=
 EXPR
theorem thirdInteriorShape_lc8BBB (n c r j : ℤ)
 (hr : 1≤r) (hc : r+1≤c) (hj : 5≤j) (hn : j+1≤n) :
 thirdInteriorShape8BBB n c r (j-1)*thirdInteriorShape8BBB n c r (j+1)≤
   (thirdInteriorShape8BBB n c r j)^2 := by
 let t := j-5
 let s := n-j-1
 let u := r-1
 let v := c-r-1
 have ht : 0≤t := by dsimp [t]; omega
 have hs : 0≤s := by dsimp [s]; omega
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have he : (thirdInteriorShape8BBB n c r j)^2-
     thirdInteriorShape8BBB n c r (j-1)*thirdInteriorShape8BBB n c r (j+1)=
     GEXPR := by dsimp [thirdInteriorShape8BBB,t,s,u,v]; ring
 have hp : 0≤GEXPR := by positivity
 omega
#print axioms thirdInteriorShape_lc8BBB
end
end MathGKM.Markov
'''.replace('GEXPR',gexpr).replace('EXPR',expr)
 Path('research/MarkovThirdInteriorShape8BBB.lean').write_text(lean)
if __name__=='__main__':main()
