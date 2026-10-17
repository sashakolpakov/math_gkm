"""Machine-authored c9f23b44. Independent finite raw-recurrence checks, not proof."""
from pathlib import Path
from math import comb
from fractions import Fraction
import json,time,random
from three_probe_9e205206 import frame
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c9f23b44'
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def candidate(n,i,j):
 if i<3:return 0
 t=i-3
 return C(n-j-1,t)*C(t+j+3,j)+4*sum((j-s)*C(n-2*j+s-1,t)*C(t+s+3,s) for s in range(j))
def rat(j,t,m):
 w=(t+m+4)*(t+m+5)+4*(j-m)*(t+j+4)
 return (Fraction(m*(t+m+4)*(t+m+5)*(w-2),(j-m+1)*(t+m+2)*(t+m+3)*w),Fraction((j-m)*(t+m+4)*(t+m+5)*(w+2),(m+1)*(t+m+6)*(t+m+7)*w))
def main():
 start=time.monotonic();o=dict(status='finite exact experiment only; no proof inference',q_max=45,sources=0,coefficients=0,zeros=0,horizontal_triples=0,polygon_triples=0,ratio_pairs=0,ratio_endpoint_pairs=0,failures=[])
 for q in range(1,46):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert a==3 and n==3*q+(1 if r else 2)
   o['sources']+=1
   for j in range(q+1):
    for i in range(n+6):
     v=p.get((i,j),0);w=candidate(n,i,j);o['coefficients']+=1;o['zeros']+=v==0
     if v!=w:o['failures'].append(['coefficient',q,r,i,j,v,w])
     abc=[p.get((i+s,j),0) for s in range(3)];o['horizontal_triples']+=1
     o['polygon_triples']+=3*n<=n*i+3*j and i+2+j<=n+2
     if abc[0]*abc[2]>abc[1]**2:o['failures'].append(['raw_lc',q,r,i,j,abc])
 rng=random.Random(0xc9f23b44)
 for _ in range(10000):
  j=rng.randrange(2,1001);t=rng.randrange(1,1001);n=rng.randrange(j-1);m=rng.randrange(n+2,j+1)
  if _%4==0:n=0
  if _%4==1:m=j
  a,b=rat(j,t,m);c,d=rat(j,t,n);e,f=rat(j,t,m-1);g,h=rat(j,t,n+1)
  o['ratio_pairs']+=1;o['ratio_endpoint_pairs']+=n==0 or m==j
  if a*d+c*b<e*h+g*f:o['failures'].append(['rational_pair',j,t,m,n])
 o['seconds']=time.monotonic()-start
 (O/'source-experiments.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
