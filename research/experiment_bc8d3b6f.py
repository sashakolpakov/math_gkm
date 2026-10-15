"""Machine-authored exact checks; finite experiments, not proofs."""
from pathlib import Path
from fractions import Fraction as F
from math import comb,gcd
import json,time,random
from experiment_8833 import backward
from fourth_probe_01f51d63 import BOUNDS
from generate_bc8d3b6f import z,local4
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bc8d3b6f'
def main():
 start=time.monotonic();rows=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
 cases=[];checks=triples=0;random.seed(9036)
 inputs=[(n,c,r) for c in range(5,19) for r in range(1,c) if gcd(c,r)==1 for n in [0,1,4,8,17]]
 inputs += [(n,c,r) for n,c,r in [(32,7,2),(64,5,3),(100,7,5),(127,11,7)]]
 for n,c,r in inputs:
  ch=next(k for k in range(6) if BOUNDS[k][0]*c<r*BOUNDS[k][1] and r*BOUNDS[k+1][1]<BOUNDS[k+1][0]*c)
  coeffs=rows[ch]['numerator'];a=c*n+r;b=c*(n+1)+r
  word=[(k+1)*a//b-k*a//b for k in range(1,b)]
  raw=backward(word,4)
  at=set([0,1,2,3,4,5,6,n,n+1,n+2,2*n,3*n,4*n+4,a+4])
  at.update(range(4*n+7) if n<20 else [random.randrange(4*n+8) for _ in range(80)])
  for j in sorted(at):
   v=F(0)
   for ks,cv in coeffs:
    nn,zz,cc,rr,qq,tt,uu,xx=ks;assert not (qq or tt or uu)
    sh=zz*n+xx
    if j>=sh:v+=F(cv)*n**nn*c**cc*r**rr*comb(7+j-sh,7)
   assert v==24*raw.get(j,0),(n,c,r,j,v,raw.get(j,0))
   checks+=1
  for j in range(a+3):
   i=a+2-j
   if all(a*b<=b*u+a*v and u+v<=a+b-1 for u,v in [(i,j+2),(i+1,j+1),(i+2,j)]):
    assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2
    triples+=1
  cases.append([n,c,r,len(at)])
  if len(cases)%50==0:print('cases',len(cases),flush=True)
 out=dict(status='Finite exact checks only; no universal inequality follows',cases=cases,coefficient_checks=checks,polygon_valid_triples=triples,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print({k:v for k,v in out.items() if k!='cases'},flush=True)
if __name__=='__main__':main()
