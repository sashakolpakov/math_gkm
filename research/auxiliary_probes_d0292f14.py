"""Machine-authored reproducible exact auxiliary tests; no proof claims."""
from correction_kernel_d0292f14 import top,differences,O
from top_rr_b3eed364 import counts
from math import factorial
import json,time,hashlib
from pathlib import Path
def run():
 t=time.monotonic();out=dict(top_newton=[],factorial=[],sturm=[],status='Finite exact experiments only.')
 for i in range(13):
  N=4*i+18
  grid=[differences([top(d,T,i+1)**2-top(d,T,i)*top(d,T,i+2) for T in range(N+1)]) for d in range(N+1)]
  co=[differences([grid[d][j] for d in range(N+1)]) for j in range(N+1)]
  bad=[(a,b,v) for b,row in enumerate(co) for a,v in enumerate(row) if v<0]
  out['top_newton'].append(dict(i=i,negative_count=len(bad),first_negative=bad[:2],nonzero=sum(v!=0 for row in co for v in row)))
 for shift,D,Tmax in [(0,16,70),(3,21,100)]:
  bad=[];n=0
  for d in range(D):
   for T in range(2,Tmax):
    vs=[top(d,T,i) for i in range(T+1)]
    for i in range(T-1):
     n+=1
     if (i+shift+1)*vs[i+1]**2<(i+shift+2)*vs[i]*vs[i+2]:bad.append((d,T,i))
  out['factorial'].append(dict(shift=shift,checks=n,failures=len(bad),first_failures=bad[:10]))
 for T in range(2,18):
  for d in [0,1,4,20]:
   row=[top(d,T,i) for i in range(T+1)]
   out['sturm'].append(dict(d=d,T=T,raw=counts(row),scaled=counts([factorial(i+3)*a for i,a in enumerate(row)])))
 out.update(seconds=time.monotonic()-t,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
 (O/'auxiliary-probes.json').write_text(json.dumps(out,indent=2))
 print(json.dumps(dict(newton_cases=len(out['top_newton']),newton_failures=sum(z['negative_count'] for z in out['top_newton']),factorial=out['factorial'],sturm_cases=len(out['sturm']),seconds=out['seconds'])))
if __name__=='__main__':run()
