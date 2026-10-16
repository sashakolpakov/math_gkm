"""Machine-authored exact experiments; none of these tests is a proof."""
from pathlib import Path
from math import comb
import json,time
from lower_rows_1bb0aa1e import Hrows,J,add,scale,mul
O=Path('/Users/sasha/math_gkm/evidence/markov-daba8bcf')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def base(j,k):
 return C(2*k+3,k)*(C(j+k+3,2*k+3)+4*C(j+k+4,2*k+5))
def positive(n,j,k):
 return C(j+3,k+3)*C(n-j+k+2,k)+4*sum((j-s)*C(s+3,k+3)*C(n-2*j+s+k+2,k) for s in range(j))
def main():
 start=time.monotonic();o={'status':'finite exact experiments only','positive_formula_checks':0,'minimal_formula_checks':0,'minimal_cross_checks':0,'failures':[]}
 for j in range(41):
  for d in [0,1,2,3,5,10,25,100]:
   n=2*j+1+d;a=Hrows(n,j)[j]
   for k in range(j+3):
    x=a[k] if k<len(a) else 0;y=positive(n,j,k);o['positive_formula_checks']+=1
    if x!=y:o['failures'].append(['positive',n,j,k,x,y])
    if d==0:
     o['minimal_formula_checks']+=1
     if x!=base(j,k):o['failures'].append(['base',j,k,x,base(j,k)])
 for j in range(101):
  a=[base(j,k) for k in range(j+2)]
  for i in range(j+1):
   for k in range(i,j+1):
    o['minimal_cross_checks']+=1
    if a[i]*a[k+1]>a[i+1]*a[k]:o['failures'].append(['base_cross',j,i,k])
 o['seconds']=time.monotonic()-start
 (O/'positive-rows.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
