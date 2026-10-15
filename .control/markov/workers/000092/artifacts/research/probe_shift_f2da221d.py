"""Machine-authored exact first-shift exploration, not a theorem."""
from pathlib import Path
from fractions import Fraction as F
import json,time
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f2da221d'
def subst(p,vals):
 out=coerce(0); powers={(i,k):vals[i]**k for i in range(8) for k in {a[i] for a in p}}
 for ks,v in p.items():
  z=coerce(v)
  for i,k in enumerate(ks):
   if k:z=z*powers[i,k]
  out=out+z
 return out
def load(s):return P({tuple(k):F(v) for k,v in s})
def main():
 start=time.monotonic()
 rows=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
 delta=16*(C-Rr)*(N*C+Rr+C-2*N-5)*(N*C+Rr+C-2*N-6)*(N*C+Rr+C-2*N-7)
 assert all(P({k:v for k,v in load(row['numerator']).items() if k[1]>0 and k[-1]<=2})==Z*X**2*delta for row in rows)
 shape=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
 vals=[subst(shape,[N,Z,C,N*C+Rr,N+k,T,U,X]) for k in range(3)]
 gap=vals[1]**2-vals[0]*(vals[2]+315*delta)
 result=dict(status='Exact symbolic experiments only; no formal coefficient bridge or inequality follows',delta=serialize(delta),delta_factored='16*(c-r)*(n*c+r+c-2*n-5)*(n*c+r+c-2*n-6)*(n*c+r+c-2*n-7)',chambers_agree=True,gap_terms=len(gap),certificates=[])
 # c=r+d with positive r,d. Split c>=5 into r>=4, r=3,d>=2, r=2,d>=3, r=1,d>=4.
 for nbase in [4,5]:
  for rv,dv,label in [(Rr+4,C+1,'r>=4'),(coerce(3),C+2,'r=3'),(coerce(2),C+3,'r=2'),(coerce(1),C+4,'r=1')]:
   p=subst(gap,[N+nbase,Z,rv+dv,rv,Q,T,U,X])
   result['certificates'].append(dict(nbase=nbase,case=label,terms=len(p),negative_terms=sum(v<0 for v in p.values()),polynomial=serialize(p)))
   print(nbase,label,len(p),sum(v<0 for v in p.values()),flush=True)
 result['seconds']=time.monotonic()-start
 (O/'first-shift-probe.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
