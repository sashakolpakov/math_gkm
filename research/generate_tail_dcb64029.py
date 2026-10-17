"""Machine-authored integer polynomial certificates. Lean must check identities."""
from top_symbolic_b3eed364 import add,scale,mul,one,x,n,serial
from pathlib import Path
import json,time
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-dcb64029'
def lin(i,d,c):return add(add(scale(x,i),scale(n,d)),scale(one,c))
def prod(*ps):
 a=one
 for p in ps:a=mul(a,p)
 return a
def polynomials(r):
 A={};E={};C={}
 for k in range(r+1):
  v=one
  for j in range(k):v=prod(v,lin(1,0,j+1),lin(2,1,j+9))
  for j in range(k,r):v=prod(v,lin(0,0,j+1),lin(1,1,j+6))
  w=1 if k==r else 4*(r-k)
  A=add(A,scale(v,w))
  E=add(E,scale(prod(v,lin(2,1,k+9)),w*k))
  C=add(C,scale(prod(v,lin(2,1,k+9),lin(2,1,k+10)),w*k*(k-1)))
 g=add(prod(lin(1,0,2),lin(1,0,5),E,E),scale(prod(lin(1,0,1),lin(1,0,4),A,C),-1))
 return g
def expression(p):return '+\n  '.join(str(v.numerator)+(f'*i^{j}' if j else '')+(f'*d^{k}' if k else '') for (j,k),v in sorted(p.items()))
def run():
 t=time.monotonic();out=[]
 for r in range(2,11):
  g=polynomials(r);bad=[(j,k,str(v)) for (j,k),v in g.items() if v<0]
  out.append(dict(r=r,terms=len(g),degree=max(j+k for j,k in g),negative_count=len(bad),negative_first=bad[:10]))
  if r not in [3,4]:continue
  assert all(v>0 for v in g.values())
  src='''import MarkovTopTailRepresentationMDCB
/-! Machine-authored dcb64029. Exact positive tail certificate at r=RR.
Both the column and denominator parameter are universally quantified. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 30000000
set_option maxRecDepth 30000

theorem tail_RR_positiveMDCB (i d : ℤ) (hi : 0 ≤ i) (hd : 0 ≤ d) :
 0 < tailGapMDCB i d RR := by
 have he : tailGapMDCB i d RR =
  EXPR := by
   norm_num [tailGapMDCB,tailAMDCB,tailEMDCB,tailCMDCB,tailTermMDCB,
     tailNumMDCB,tailRestMDCB,topLinearM55C,prod_Ico_eq_prod_range,prod_range_succ,sum_range_succ]
   ring
 rw [he]
 positivity

theorem top_mass_tail_RR_strictMDCB (d i : ℕ) :
 topMassM55C d (i+RR) i*topMassM55C d (i+RR) (i+2) < topMassM55C d (i+RR) (i+1)^2 := by
 exact (tail_strict_iffMDCB d i RR).mpr (tail_RR_positiveMDCB i d (by positivity) (by positivity))

end
end MathGKM.Markov
'''.replace('RR',str(r)).replace('EXPR',expression(g))
  (R/f'research/MarkovTopTail{r}MDCB.lean').write_text(src)
  (O/f'tail-{r}-certificate.json').write_text(json.dumps(dict(coefficients=serial(g),terms=len(g),all_positive=True,status='generated identity; separate Lean validation required'),indent=2)+'\n')
 (O/'tail-polynomial-probe.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-t,status='finite exact coefficient experiment; arbitrary r positivity unproved'),indent=2)+'\n')
 print(json.dumps(out),flush=True)
if __name__=='__main__':run()
