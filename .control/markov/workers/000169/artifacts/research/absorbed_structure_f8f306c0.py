"""Machine-authored f8f306c0. Exact rational tests of possible reductions.
Finite experiments only; no universal conclusion or imported theorem.
"""
from math import comb
from fractions import Fraction as F
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-f8f306c0')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def conv(a,b,k):return sum(a[i]*b[k-i] for i in range(len(a)) if 0<=k-i<len(b))
def main():
 start=time.monotonic();o={'status':'finite exact experiment only','d_bound':40,'full_extended_checks':0,'full_extended_failures':[], 'border_ratios':0,'border_failures':[],'normalized_steps':0,'normalized_failures':[]}
 for d in range(5,41):
  for j,c in [(d+2,4),(d+3,8)]:
   for t in range(4,d):
    ls=[[F(L(j,t+r,m)) for m in range(j+1)] for r in range(3)]
    es=[a[:] for a in ls]
    for r,a in enumerate(es):a[0]+=F(c*max(d-t-r,0),t+r+1)
    for m in range(2*j+1):
     gap=conv(es[1],es[1],m)-conv(es[0],es[2],m)
     o['full_extended_checks']+=1
     if gap<0 and len(o['full_extended_failures'])<12:o['full_extended_failures'].append([d,j,c,t,m,str(gap)])
    a,b,e=ls
    old=None
    for m in range(2,t+3):
     gap=sum(b[n]*b[m-n] for n in range(1,m))-sum(a[n]*e[m-n] for n in range(m-1))
     ratio=gap/e[m];o['border_ratios']+=1
     if old is not None and ratio<old and len(o['border_failures'])<12:o['border_failures'].append([d,j,c,t,m,str(old),str(ratio)])
     old=ratio
    # Pair-cost monotonicity for the perturbed complete reversed kernel.
    aa=[F(0)]+[es[0][m-1]/es[1][m] for m in range(1,j+1)]
    bb=[es[2][m+1]/es[1][m] for m in range(j)]+[F(0)]
    for m in range(2,j+1):
     for n in range(m-1):
      diff=aa[m]*bb[n]+aa[n]*bb[m]-aa[m-1]*bb[n+1]-aa[n+1]*bb[m-1]
      o['normalized_steps']+=1
      if diff<0 and len(o['normalized_failures'])<12:o['normalized_failures'].append([d,j,c,t,m,n,str(diff)])
  print('d',d,flush=True)
 o['seconds']=time.monotonic()-start
 (O/'absorbed-structure.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
