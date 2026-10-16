"""Machine-authored exact finite probes. None is a universal proof."""
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ae9e841e')
def C(n,k): return comb(n,k) if 0<=k<=n else 0
def H(n,j,k):
 return C(j+3,k+3)*C(n-j+k+2,k)+4*sum((j-s)*C(s+3,k+3)*C(n-2*j+s+k+2,k) for s in range(j))
def test():
 out={'status':'finite auxiliary probes only','mixed_summand_failures':[],'shifted_pair_failures':[], 'raw_summand_failures':[]}
 for j in range(2,20):
  for d in [0,j,2*j]:
   n=2*j+1+d
   for s in range(j):
    for k in range(j):
     a=[H(n,j,k+i) for i in range(3)]
     b=[H(n-j+s+1,s,k+i-1) if k+i>=1 else 0 for i in range(3)]
     gap=2*a[1]*b[1]-a[0]*b[2]-b[0]*a[2]
     if gap<0 and len(out['mixed_summand_failures'])<5:out['mixed_summand_failures'].append([n,j,s,k,a,b,gap])
     aa=[C(d+j,k+i)*C(k+i+j+3,j) for i in range(3)]
     bb=[C(d+s,k+i)*C(k+i+s+3,s) for i in range(3)]
     gg=2*aa[1]*bb[1]-aa[0]*bb[2]-bb[0]*aa[2]
     if gg<0 and len(out['raw_summand_failures'])<5:out['raw_summand_failures'].append([j,d,s,k,aa,bb,gg])
 out['completed']=True
 (O/'shape-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':test()
