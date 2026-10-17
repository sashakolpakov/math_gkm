"""Machine-authored auxiliary experiment; no universal assertion follows."""
from pathlib import Path
from math import comb
import random,json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-a45def12')
def conv(a,b,n=None):
    n=len(a)+len(b)-1 if n is None else n
    return [sum(a[i]*b[k-i] for i in range(max(0,k-len(b)+1),min(k+1,len(a)))) for k in range(n)]
def check(w,j,s):
    a,b,c=[[w[j-i]*comb(s+t+i+3,i) for i in range(j+1)] for t in range(3)]
    A=conv(a,c);B=conv(b,b)
    for n in range(2*j):
        gap=B[n+1]*A[n]-B[n]*A[n+1]
        if gap<0:return dict(j=j,s=s,n=n,w=w[:j+1],gap=gap,A=A[n:n+2],B=B[n:n+2])
def run():
    start=time.monotonic();rng=random.Random(0xa45def12)
    out=dict(status='finite exact auxiliary experiment, not a proof or a source-family refutation',families=0,parameter_cases=0,failures=[])
    for trial in range(400):
        N=25;w=[1]+[0]*N
        factors=[]
        for _ in range(rng.randrange(1,8)):
            a=rng.randrange(1,7);kind=rng.choice(['bernoulli','geometric'])
            factors.append([kind,a]);v=[1,a] if kind=='bernoulli' else [a**i for i in range(N+1)]
            w=conv(w,v,N+1)
        out['families']+=1
        for j in [2,3,4,5,8,12,18,25]:
            for s in [0,1,3,10]:
                out['parameter_cases']+=1
                bad=check(w,j,s)
                if bad:
                    bad['factors']=factors;out['failures'].append(bad)
                    break
            if out['failures']:break
        if out['failures']:break
    out['seconds']=time.monotonic()-start
    (O/'pf-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
if __name__=='__main__':run()
