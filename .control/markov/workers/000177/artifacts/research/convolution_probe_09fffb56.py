"""Machine-authored next-step probe. No theorem follows from this scan."""
from math import comb
from fractions import Fraction as F
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-09fffb56')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(j,s,m):return C(s+m+3,m)*(C(s+j+3,s+m+3)+4*C(s+j+4,s+m+5))
def conv(a,b):return [sum(a[i]*b[n-i] for i in range(len(a)) if 0<=n-i<len(b)) for n in range(len(a)+len(b)-1)]
def run():
 out=dict(status='finite exact auxiliary probe, not a proof',margin_checks=0,ratio_steps=0,ratio_failures=[],margin_failures=[],individual_concavity_failures=[],positive_pair_sum_checks=0,pair_sum_failures=[]);start=time.monotonic()
 for j in list(range(1,71))+[100,150]:
  for s in list(range(16))+[20,50,100]:
   A,B,D=[[L(j,s+t,m) for m in range(j+1)] for t in range(3)];ac=conv(A,D);bb=conv(B,B)
   for n in range(2*j+1):
    out['margin_checks']+=1
    if A[0]*D[0]*bb[n]<B[0]**2*ac[n]:out['margin_failures'].append([j,s,n])
    if n<2*j:
     out['ratio_steps']+=1
     if bb[n+1]*ac[n]<bb[n]*ac[n+1] and len(out['ratio_failures'])<12:out['ratio_failures'].append([j,s,n])
    # Balanced-to-unbalanced partial sums of symmetrized pairs.
    total=0
    for i in reversed(range(max(0,n-j),n//2+1)):
     k=n-i
     if i==k:term=A[0]*D[0]*B[i]*B[k]-B[0]**2*A[i]*D[k]
     else:term=2*A[0]*D[0]*B[i]*B[k]-B[0]**2*(A[i]*D[k]+A[k]*D[i])
     total+=term;out['positive_pair_sum_checks']+=1
     if total<0 and len(out['pair_sum_failures'])<12:out['pair_sum_failures'].append([j,s,n,i])
   for m in range(j+1):
    gap=2*F(B[m],B[0])-F(A[m],A[0])-F(D[m],D[0])
    if gap<0 and len(out['individual_concavity_failures'])<12:out['individual_concavity_failures'].append([j,s,m,str(gap)])
 out['seconds']=time.monotonic()-start
 (O/'convolution-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
