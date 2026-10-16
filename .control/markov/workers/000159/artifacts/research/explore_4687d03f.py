"""Machine-authored exact experiments. No tested identity is a universal theorem."""
from pathlib import Path
from math import comb
from fractions import Fraction as F
import json,time
from lower_rows_1bb0aa1e import Hrows,add,mul,scale
O=Path('/Users/sasha/math_gkm/evidence/markov-4687d03f')
def C(n,k): return comb(n,k) if 0<=k<=n else 0
def alt(n,j,k):
 return sum(c*(-1)**s*(s+1)*C(n-j+2+k-h-s,k-h-s)*C(j+3,j-k+h-s-m)
   for h,m,c in [(0,0,1),(0,1,4),(0,2,4),(1,2,-2),(1,3,-4),(2,4,1)]
   for s in range(max(0,k-h+1)))
def main():
 t=time.monotonic();out={'status':'finite experiments only','positivity_checks':0,'lc_checks':0,'failures':[],'parameter_difference_checks':0}
 for j in range(1,151):
  for d in [0,1,2,j,2*j,5*j,10*j]:
   n=2*j+1+d; a=[alt(n,j,k) for k in range(j+1)]
   out['positivity_checks']+=len(a);out['lc_checks']+=len(a)-2
   if min(a)<0:out['failures'].append(['negative',n,j,a])
   for k in range(j-1):
    if a[k]*a[k+2]>a[k+1]**2:out['failures'].append(['lc',n,j,k,a[k:k+3]])
 # Find whether increasing n is an LC-preserving convolution in u.
 for n in range(4,45):
  h0=Hrows(n,(n-1)//2);h1=Hrows(n+1,(n-1)//2);hm=Hrows(n-1,(n-1)//2)
  for j in range(1,(n-1)//2+1):
   rhs=add(h0[j],mul([1,1],h0[j-1]),scale(hm[j-1],-1))
   assert all((h1[j][k] if k<len(h1[j]) else 0)==(rhs[k] if k<len(rhs) else 0) for k in range(max(len(rhs),len(h1[j]))))
   out['parameter_difference_checks']+=1
 out['seconds']=time.monotonic()-t
 (O/'shape-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
