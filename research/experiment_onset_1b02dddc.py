"""Machine-authored finite exact experiments. These are not universal proofs."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd,comb
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1b02dddc'
backs=json.loads((R/'evidence/markov-94b1de05/backward-candidates.json').read_text())
hs=json.loads((R/'evidence/markov-fa9eb434/universal-numerator-candidates.json').read_text())['coefficients']
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
def evaluate(poly,values):
 ans=F(0)
 for ks,v in poly:
  term=F(v)
  for x,k in zip(values,ks):term*=x**k
  ans+=term
 return ans
def h3parts(n,c,r):
 q=max(2*r-c,0);t=min(c-r,max(3*r-c,0));u=max(3*r-2*c,0)
 vals=[n,0,c,r,q,t,u,1];parts={}
 for ks,v in hs[3]:
  val=F(v)
  for x,k in zip(vals,ks):val*=x**k
  parts[14-ks[7]]=parts.get(14-ks[7],0)+val
 return parts
inputs=[(n,c,r) for c in range(5,22) for r in range(1,c) if gcd(c,r)==1 for n in [7,8,12,24]]
counts=dict(cases=0,two_block_coefficients=0,onset_coefficients=0,valid_onset_triples=0,literal_coefficients=0,zeros=0)
start=time.monotonic()
for n,c,r in inputs:
 ch=next(i for i,((p,q),(s,t)) in enumerate(zip(bounds,bounds[1:])) if p*c<q*r and t*r<s*c)
 a=n*c+r;b=a+c;word=[(k+1)*a//b-k*a//b for k in range(1,b)]
 cut=backward(word,4)
 h3=h3parts(n,c,r)
 top={int(k):evaluate(v,[n,0,c,r,0,0,0,1]) for k,v in backs[ch]['parts'].items()}
 for j in range(2*n+6,4*n+8):
  t=4*n+7-j;u=3*n+6-j
  v=sum(z*comb(7+t-d,7) for d,z in top.items() if d<=t)
  v+=sum(z*comb(7+u-d,7) for d,z in h3.items() if d<=u)
  assert v==24*cut.get(j,0),(n,c,r,j,v,cut.get(j,0))
  counts['two_block_coefficients']+=1;counts['zeros']+=int(v==0)
 vals={}
 for k in range(1,9):
  v=evaluate(backs[ch]['shape'],[n,0,c,r,0,n-k,0,1])
  v+=315*sum(z*comb(13-k-d,7) for d,z in h3.items() if d<=6-k)
  assert v==7560*cut.get(3*n+k,0),(n,c,r,k)
  vals[k]=v;counts['onset_coefficients']+=1
 for k in range(1,7):
  j=3*n+k;i=a+2-j
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert vals[k]*vals[k+2]<=vals[k+1]**2
   counts['valid_onset_triples']+=1
 if b<=70:
  aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j in range(2*n+6,4*n+8):
   assert raw.get((a+4-j,j),0)==cut.get(j,0)
   counts['literal_coefficients']+=1
 counts['cases']+=1
 if counts['cases']%40==0:
  (O/'experiment-progress.json').write_text(json.dumps(dict(counts=counts,seconds=time.monotonic()-start)))
result=dict(status='Finite exact experiments only; not proof',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(counts)
