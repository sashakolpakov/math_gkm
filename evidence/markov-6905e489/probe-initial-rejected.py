"""Machine-authored exact finite checks; no mathematical proof claims.
Random integer jets independently check the cubic cyclic formula, including
small cycles. Source pattern counts and literal numerator recurrence are checked
separately. No prior evidence files are written.
"""
from pathlib import Path
from itertools import combinations
from random import Random
from math import gcd
import json,time
from verify_third_75ad import source,path_for,backward
from third_cert_75ad import coefficients
O=Path('evidence/markov-6905e489')
def pmul(p,q):return [sum(p[i]*q[k-i] for i in range(k+1)) for k in range(4)]
def add(p,q):return [a+b for a,b in zip(p,q)]
def mm(A,B):return [[add(pmul(A[i][0],B[0][j]),pmul(A[i][1],B[1][j])) for j in range(2)]
def cyclic(M):
 n=len(M)
 if n==1:return M[0][0][0][3]+M[0][1][1][3]
 a=[m[0][0][1] for m in M];b=[m[0][1][1] for m in M]
 c=[m[1][0][1] for m in M];d=[m[1][1][1] for m in M]
 a2=[m[0][0][2] for m in M];b2=[m[0][1][2] for m in M]
 c2=[m[1][0][2] for m in M];d2=[m[1][1][2] for m in M]
 D=sum(d)
 out=sum(d[i]*d[j]*d[k] for i,j,k in combinations(range(n),3))
 out+=sum(d2[i]*(D-d[i])+M[i][1][1][3] for i in range(n))
 out+=sum(c[i]*b2[(i+1)%n]+c2[i]*b[(i+1)%n] for i in range(n))
 out+=sum(c[i]*b[(i+1)%n]*(D-d[i]-d[(i+1)%n]) for i in range(n))
 if n>=3:out+=sum(c[i]*a[(i+1)%n]*b[(i+2)%n] for i in range(n))
 if n==3:out+=a[0]*a[1]*a[2]
 if n==2:out+=a[0]*a2[1]+a2[0]*a[1]
 return out
def main():
 t=time.monotonic();rng=Random(6905);tests=0;examples=[]
 for n in range(1,41):
  for rep in range(25):
   M=[[[[int(i==j==1)]+[rng.randrange(-4,5) for _ in range(3)] for j in range(2)] for i in range(2)] for _ in range(n)]
   P=[[[int(i==j),0,0,0] for j in range(2)] for i in range(2)]
   for m in M:P=mm(P,m)
   actual=P[0][0][3]+P[1][1][3];expected=cyclic(M)
   assert actual==expected,(n,actual,expected);tests+=1
   if rep==0 and n<=4:examples.append(dict(n=n,matrices=M,cubic=actual))
 counts=0;raw=0;records=[]
 for b in range(2,81):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=[(k+1)*a//b-k*a//b for k in range(b)]
   u=sum(w[i]*w[(i+1)%b]*w[(i+2)%b] for i in range(b))
   sep=sum(w[i]*(1-w[(i+1)%b])*w[(i+2)%b] for i in range(b))
   assert (u,sep)==(max(3*a-2*b,0),min(b-a,max(3*a-b,0)))
   counts+=1
   if a*2<b and b-a>=4 and b<=35:
    c=b-a;r=a;C=coefficients(c,r,max(2*r-c,0),min(c-r,max(3*r-c,0)),max(3*r-2*c,0))
    aa,bb,P=source(path_for(a,b));assert (aa,bb)==(a,b)
    V=backward(tuple(w[1:]),3)
    for j in range(a+4):
     i=a+3-j;v=P.get((i,j),0)
     assert v==V.get(j,0) and 6*v==(C[j] if j<6 else 0)
     raw+=1
    records.append([a,b])
 rec=dict(status='finite exact experiments only',random_seed=6905,
  generic_cubic_checks=tests,lengths=[1,40],small_examples=examples,
  source_pattern_checks=counts,source_denominator_bound=80,
  raw_coefficient_checks=raw,raw_sources=records,failures=[],seconds=time.monotonic()-t)
 (O/'experiments.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k not in ['small_examples','raw_sources']}))
if __name__=='__main__':main()
