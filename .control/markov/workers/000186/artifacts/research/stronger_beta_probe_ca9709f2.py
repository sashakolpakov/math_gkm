"""Machine-authored ca9709f2: distinguish stronger comparison shortcuts."""
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ca9709f2')
def scalar(a,H,k,l):
 return 2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*(k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
def w(r,k):return 1 if k==r else 4*(r-k) if k<r else 0
def run():
 t=time.monotonic();out=dict(checks=0,failures=[],failures_by_type={},min_sign=1)
 for i in range(31):
  a=i+1
  for r in range(2,101):
   H=3*a+r+4
   for m in range(2,2*r+1):
    s=sum(comb(i+k,i)*comb(i+m-k,i)*w(r,k)*w(r,m-k)*scalar(a,H,k,m-k) for k in range(m+1))
    out['checks']+=1
    if s<=0:
     tag='m<=r' if m<=r else 'm>r'
     out['failures_by_type'][tag]=out['failures_by_type'].get(tag,0)+1
     if len(out['failures'])<30:out['failures'].append([i,r,m,s])
 out.update(seconds=time.monotonic()-t,status='finite exact experiment; no theorem')
 (O/'stronger-base-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
if __name__=='__main__':run()
