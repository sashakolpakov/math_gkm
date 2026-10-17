"""Machine-authored exact lower-kernel shape probe, not a universal proof."""
from pathlib import Path
from functools import lru_cache
from math import comb
import json,time
t0=time.monotonic()
def C(n,k):return comb(n,k) if 0<=k<=n else 0
@lru_cache(None)
def K(i,j,k):
 # Candidate lowerKernelME9C on the wedge; its unrestricted identity is not assumed.
 t=i-3;d=i+k-j-3
 return sum(C(d,t-m)*C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5)) for m in range(t+1))
out=dict(bounds=dict(i=[3,40],j=[0,24],k=[0,85]),counts=dict(positive=0,j_lc=0,k_lc=0,minor=0,antidiagonal=0),failures={k:[] for k in ['positive','j_lc','k_lc','minor','antidiagonal']})
def check(name,cond,args,values):
 out['counts'][name]+=1
 if not cond and len(out['failures'][name])<12:out['failures'][name].append(dict(parameters=args,values=values))
for i in range(3,41):
 for j in range(25):
  for k in range(86):
   if 2*j+3<=i+k:
    a,b,c=K(i,j,k),K(i,j,k+1),K(i,j,k+2)
    check('positive',a>0,[i,j,k],[a]);check('k_lc',a*c<=b*b,[i,j,k],[a,b,c])
   if 2*j+5<=i+k:
    a,b,c,d=K(i,j,k),K(i,j+1,k),K(i,j,k+1),K(i,j+1,k+1)
    check('minor',b*c<=a*d,[i,j,k],[a,b,c,d])
   if 2*j+7<=i+k:
    a,b,c=K(i,j,k),K(i,j+1,k),K(i,j+2,k)
    check('j_lc',a*c<=b*b,[i,j,k],[a,b,c])
    a,b,c=K(i,j,k+2),K(i,j+1,k+1),K(i,j+2,k)
    check('antidiagonal',a*c<=b*b,[i,j,k],[a,b,c])
out.update(seconds=time.monotonic()-t0,cache=K.cache_info()._asdict(),status='Exact finite sign experiment for a binomial candidate; no uniform shape theorem or unrestricted lowerKernel bridge claimed.')
Path('evidence/markov-f88f6a75/lower-shape-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
