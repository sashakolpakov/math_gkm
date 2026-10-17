"""Machine-authored second exact diagnostic using determinant evaluations."""
from schur_probe_a45def12 import gap,O
from itertools import permutations
from math import comb
from functools import lru_cache
import json,time,hashlib
from pathlib import Path
def w(k):return 0 if k<0 else 1 if k==0 else 4*k
@lru_cache(None)
def jt(lam):
    n=len(lam);total=0
    for p in permutations(range(n)):
        sign=(-1)**sum(p[i]>p[j] for i in range(n) for j in range(i+1,n));v=sign
        for i in range(n):v*=w(lam[i]-i+p[i])
        total+=v
    return total
def prod(j,s,t,n):
    return sum(w(j-i)*w(j-n+i)*comb(s+i+3,i)*comb(t+n-i+3,n-i)
               for i in range(max(0,n-j),min(j,n)+1))
def run():
    start=time.monotonic();out=dict(status='finite exact experimental Schur expansion; no universal or formal Schur certificate',cases=0,coefficients=0,negative_coefficients=0,negative_hook_coefficients=0,nonzero_forbidden_shapes=0,identity_failures=[],examples=[])
    for h in range(1,13):
        for j in [h,h+1,2*h]:
            for s in [0,3,10]:
                n=2*j-h;g=gap(j,s,h);out['cases']+=1;out['coefficients']+=len(g)
                for lam,c in g.items():
                    forbidden=len(lam)>=3 and lam[2]>=3
                    out['negative_coefficients']+=c<0
                    out['negative_hook_coefficients']+=c<0 and not forbidden
                    out['nonzero_forbidden_shapes']+=forbidden and jt(lam)!=0
                value=sum(c*jt(lam) for lam,c in g.items())
                raw=prod(j,s+1,s+1,n+1)*prod(j,s,s+2,n)-prod(j,s+1,s+1,n)*prod(j,s,s+2,n+1)
                if value!=raw:out['identity_failures'].append([j,s,h,value,raw])
                if j==5 and s==0:out['examples'].append(dict(j=j,s=s,n=n,gap=raw,negative=[[list(l),c,jt(l)] for l,c in g.items() if c<0]))
    out['seconds']=time.monotonic()-start
    out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    (O/'schur-validation.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
if __name__=='__main__':run()
