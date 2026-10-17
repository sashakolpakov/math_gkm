"""Machine-authored exact rational conditional-variance experiment. Not a proof."""
from fractions import Fraction as F
from math import comb
from pathlib import Path
import json,time,hashlib
O=Path('/Users/sasha/math_gkm/evidence/markov-1c65a306')
def kernel(j,s):
 return [F((1 if r==0 else 4*r)*comb(j,r),comb(s+j+3,r)) for r in range(j+1)]
def moments(f,h):
 p=[f[r]*f[h-r] for r in range(h+1)]
 S=sum(p); M=sum(r*(h-r)*p[r] for r in range(h+1))
 return S,M,F(h*h,4)-M/S
def run():
 start=time.monotonic();out=dict(status='finite exact experiment only',checks=0,failures=[],samples=[])
 smallest=None
 for j in range(1,71):
  for s in [0,1,2,3,5,10,30,100,1000]:
   f=kernel(j,s);prev=moments(f,0)[2]
   for h in range(1,j+1):
    S,M,v=moments(f,h);dv=v-prev;out['checks']+=1
    if dv<0:out['failures'].append([j,s,h,str(prev),str(v)])
    if smallest is None or dv<smallest[0]:smallest=(dv,j,s,h)
    if s==0 and h==j and j<=10:out['samples'].append([j,s,h,str(v),str(dv)])
    prev=v
 out['minimum_increment']=[str(x) for x in smallest];out['seconds']=time.monotonic()-start
 out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'moment-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out),flush=True)
if __name__=='__main__':run()
