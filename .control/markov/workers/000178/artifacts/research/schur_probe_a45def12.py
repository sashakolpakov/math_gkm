"""Machine-authored exact Schur-basis diagnostic, experimental only."""
from pathlib import Path
from math import comb
from functools import lru_cache
from collections import defaultdict
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-a45def12')
@lru_cache(None)
def partitions(n,cap=None):
    if n==0:return ((),)
    cap=n if cap is None else min(cap,n)
    return tuple((a,)+p for a in range(cap,0,-1) for p in partitions(n-a,a))
@lru_cache(None)
def pieri(lam,k):
    return tuple(mu for mu in partitions(sum(lam)+k) if
      all((mu[i] if i<len(mu) else 0)>=(lam[i] if i<len(lam) else 0)>=
          (mu[i+1] if i+1<len(mu) else 0) for i in range(max(len(mu),len(lam)))))
@lru_cache(None)
def h_to_s(parts):
    out={():1}
    for k in parts:
        nxt=defaultdict(int)
        for lam,c in out.items():
            for mu in pieri(lam,k):nxt[mu]+=c
        out=dict(nxt)
    return out
def coeff(j,s,h,b):
    out=defaultdict(int)
    for a in range(max(0,h-j),min(h,j)+1):
        c=h-a
        parts=tuple(sorted([i for i in [a,c] if i],reverse=True))
        out[parts]+=comb(s+(1 if b else 0)+j-a+3,j-a)*comb(s+(1 if b else 2)+j-c+3,j-c)
    return out
def gap(j,s,h):
    A=coeff(j,s,h,False);B=coeff(j,s,h,True)
    A1=coeff(j,s,h-1,False);B1=coeff(j,s,h-1,True)
    out=defaultdict(int)
    for p,a in A.items():
        for q,b in B1.items():out[tuple(sorted(p+q,reverse=True))]+=a*b
    for p,a in A1.items():
        for q,b in B.items():out[tuple(sorted(p+q,reverse=True))]-=a*b
    schur=defaultdict(int)
    for p,a in out.items():
        if a:
            for lam,b in h_to_s(p).items():schur[lam]+=a*b
    return dict(schur)
def run():
    start=time.monotonic();out=dict(status='finite exact symbolic-basis experiment; Pieri implementation unverified in Lean',cases=0,coefficients=0,negative=[],negative_on_22_hook=[],samples=[])
    for h in range(1,8):
        for j in range(h,h+6):
            for s in [0,1,3,10]:
                g=gap(j,s,h);out['cases']+=1;out['coefficients']+=len(g)
                for lam,c in g.items():
                    if c<0:
                        if len(out['negative'])<12:out['negative'].append([j,s,h,lam,c])
                        if (len(lam)<3 or lam[2]<=2) and len(out['negative_on_22_hook'])<12:
                            out['negative_on_22_hook'].append([j,s,h,lam,c])
                if j==h and s==0:out['samples'].append(dict(j=j,s=s,h=h,expansion=[[list(l),c] for l,c in g.items() if c]))
    out['seconds']=time.monotonic()-start
    (O/'schur-probe.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:v for k,v in out.items() if k!='samples'}),flush=True)
if __name__=='__main__':run()
