"""Machine-authored proposed Euler-transformed residual formula; finite test only."""
from pathlib import Path
from math import comb
import json,time
from lower_rows_1bb0aa1e import Hrows
O=Path('/Users/sasha/math_gkm/evidence/markov-ffd747f5')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def alt(n,j,k):
 N=n-j-1
 return sum(c*(-1)**s*(s+1)*C(N+3+k-h-s,k-h-s)*C(j+3,j-k+h-s-m)
   for h,m,c in [(0,0,1),(0,1,4),(0,2,4),(1,2,-2),(1,3,-4),(2,4,1)]
   for s in range(max(0,k-h+1)))
def main():
 t=time.monotonic();out={'status':'proposed universal identity; finite exact checks only',
   'domain':'j+1<=n<=90; j<=25; k<=j+3','coefficients':0,'failures':[],
   'outside_shape_negative_examples':[]}
 for n in range(1,91):
  h=Hrows(n,min(n-1,25))
  for j in range(min(n-1,25)+1):
   for k in range(j+4):
    v=alt(n,j,k);w=h[j][k] if k<len(h[j]) else 0
    out['coefficients']+=1
    if v!=w:out['failures'].append([n,j,k,v,w])
    if v<0 and len(out['outside_shape_negative_examples'])<5:out['outside_shape_negative_examples'].append([n,j,k,v])
 out['seconds']=time.monotonic()-t
 (O/'resolvent-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
