"""Machine-authored low-index and stronger-range certificate experiments."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0b212317'
def subst(p,vals):
 out=coerce(0);powers={(i,k):vals[i]**k for i in range(8) for k in {a[i] for a in p}}
 for ks,v in p.items():
  z=coerce(v)
  for i,k in enumerate(ks):
   if k:z=z*powers[i,k]
  out=out+z
 return out
d=json.loads((O/'compact-low-candidates.json').read_text());parts=[P({tuple(k):F(v) for k,v in row}) for row in d['parts']]
coeffs=[sum((parts[k]*comb(7+j-k,7) for k in range(j+1)),coerce(0)) for j in range(7)]
rows=[]
for center in range(1,6):
 gap=coeffs[center]**2-coeffs[center-1]*coeffs[center+1]
 for offset in [2,5]:
  for delta in [0,1]:
   p=subst(gap,[N,Z,C+offset,(C+offset)*(center+delta)+Rr+1,Q,T,U,X])
   rows.append(dict(center=center,offset=offset,delta=delta,terms=len(p),negative_terms=sum(v<0 for v in p.values()),certificate=serialize(p)))
   print(center,offset,delta,len(p),sum(v<0 for v in p.values()),flush=True)
s=P({tuple(k):F(v) for k,v in d['shape']})
gap=s*s-subst(s,[N,Z,C,Rr,Q-1,T,U,X])*subst(s,[N,Z,C,Rr,Q+1,T,U,X])
for offset in [2,5]:
 p=subst(gap,[N,Z,C+offset,(C+offset)*(Q+6)+Rr+1,Q+6,T,U,X])
 rows.append(dict(center='unbounded',offset=offset,delta=0,terms=len(p),negative_terms=sum(v<0 for v in p.values()),certificate=serialize(p)))
 print('unbounded',offset,len(p),sum(v<0 for v in p.values()),flush=True)
(O/'boundary-gap-probe.json').write_text(json.dumps(dict(status='Exact symbolic candidates only',coefficients=[serialize(p) for p in coeffs],rows=rows),indent=2)+'\n')
