"""Exact finite check of proposed first-order gap identity; not a proof."""
from math import comb
from fractions import Fraction as F
import pathlib,json
def c(n,k):return comb(n,k) if 0<=k<=n else 0
count=0;boundaries=[]
for a in range(2,41):
 for k in range(a-1):
  for j in range(2*k+3):
   A0=lambda q:c(a,q)*c(2*q,j)
   A1=lambda q:c(a-1,q)*q*c(2*q,j-1)
   gap=2*A0(k+1)*A1(k+1)-A0(k)*A1(k+2)-A1(k)*A0(k+2)
   assert gap>=0,(a,k,j,gap)
   r=2*k-j
   if r>=0:
    T=2*(a-k)*(2*k+1)*(k+1)*(r+4)*(r+5)-k*(a-k)*(2*k+3)*(r+2)*(r+5)-(k+2)*(a-k-2)*(2*k+3)*(r+1)*(r+2)
    rhs=F(4*j*(a-k)*(a-k-1)*(2*k+1)*T,a*(r+1)**2*(r+2)**2*(r+3)*(r+4)*(r+5))
    assert F(gap,A0(k)**2)==rhs
   count+=1
out={'checks':count,'a_max':40,'r_negative_boundaries_included':True,'failures':[],'status':'finite exact validation of symbolic candidate, not universal theorem'}
pathlib.Path('evidence/markov-80b7912a/linear-check.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
