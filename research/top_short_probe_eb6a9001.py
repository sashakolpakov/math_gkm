"""Machine-authored exact short-sum and two-variable Newton-basis probes."""
from top_gap_probe_eb6a9001 import add,mul,scale,mass,ev
from math import comb,factorial
from fractions import Fraction as F
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-eb6a9001')
def bc(n,k):return comb(n,k) if 0<=k<=n else 0
def choosepoly(a,k):
 p=[F(1)]
 for j in range(k):p=scale(mul(p,[a-j,1]),F(1,j+1))
 return p
def shortpoly(T,i,shift=0):
 p=[F(0)]
 for k in range(i+4):
  p=add(p,scale(choosepoly(2*i+8+shift,i+3-k),comb(i+k,i)*(bc(T,i+k)+4*bc(T+1,i+k+2))))
 return p
def run():
 start=time.monotonic();out=dict(status='finite exact experiment, not universal coefficient positivity',identity_checks=0,identity_failures=[],cases=[])
 for T in range(2,25):
  for i in range(T+1):
   a=scale(shortpoly(T,i),factorial(i+3));b=mass(T,i)
   out['identity_checks']+=1
   if add(a,scale(b,-1))!=[0]*max(len(a),len(b)):out['identity_failures'].append([T,i])
 for sector in [False,True]:
  for i in range(13):
   degree=4*i+14;vals=[]
   for h in range(degree+1):
    T=i+2+h;shift=T-2 if sector else 0
    a=[shortpoly(T,k,shift) for k in [i,i+1,i+2]]
    vals.append(add(mul(a[1],a[1]),scale(mul(a[0],a[2]),-1)))
   neg=[];nonzero=0;layers=[]
   for j in range(degree+1):
    p=vals[0]
    nonzero+=sum(v!=0 for v in p)
    neg.extend([j,k,str(v)] for k,v in enumerate(p) if v<0)
    if i<=2:layers.append([str(v) for v in p])
    vals=[add(b,scale(a,-1)) for a,b in zip(vals,vals[1:])]
   out['cases'].append(dict(i=i,sector=sector,basis='choose(h,j) e^k; T=i+2+h; d=e+T-2 if sector else e',nonzero=nonzero,negative_count=len(neg),negative_first=neg[:8],layers=layers))
 out['seconds']=time.monotonic()-start
 (O/'top-short-newton-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(dict(identity_checks=out['identity_checks'],identity_failures=out['identity_failures'],cases=len(out['cases']),negative_cases=[(x['i'],x['sector'],x['negative_count']) for x in out['cases'] if x['negative_count']],seconds=out['seconds'])))
if __name__=='__main__':run()
