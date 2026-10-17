"""Machine-authored exact recurrence experiments. Finite evidence, not proofs."""
import sys
sys.dont_write_bytecode = True
from math import comb
from pathlib import Path
import json, time, hashlib
from three_probe_9e205206 import frame

def C(n,k): return comb(n,k) if 0 <= k <= n else 0
def L(d,j,t):
    return sum(C(d,t-m)*C(t+m+3,m)*(C(j+t+3,t+m+3)+4*C(j+t+4,t+m+5)) for m in range(t+1))
def A(e,a,b,J,H):
    return sum(C(a+l,a)*C(H,b-l)*(e*C(J+a+1,a+l+1)+3*C(J+a+1,a+l+2)) for l in range(b+1))
def S(H,T,t):
    return sum(C(t+l,t)*C(H,t+3-l)*(C(T,t+l)+4*C(T+1,t+l+2)) for l in range(t+4))
def diagonal(c,q,j,r):
    e=2 if r else 1; delta=3-e; K=3*q+delta-q-c-j-5; J=j-q-1
    if K<0 or j+2<=q: return None,None
    if j<q+1:
        s=j==q; n=K
        def f(t):
            d=c+n+(0 if s else 1)+2*t
            E=(4*A(e,c+2,c+1,1,n+c) if t==0 else 4*A(e,c+3,c+2,0,n+c+2) if t==1 else 0) if s else (4*e*C(n+c+1,c+1) if t==0 else 0)
            return L(d,j+2-t,c+t)+E
        return [f(t) for t in range(3)],'entry'+str(int(s))
    if J<K:
        h=K-J-1
        return [L(c+h+2*t,j+2-t,c+t)+4*A(e,c+t+2,c+t+1,J+2-t,c+h+2*t) for t in range(3)],'low'
    h=J-K; k=3*q+delta-c-j-3
    return [S(c+h+4,k+c+t,c+t)+4*A(e,c+t+1,c+t+2,K,c+h+4) for t in range(3)],'upper'

def vertical(c,q,j,r):
    e=2 if r else 1;delta=3-e;N=3*q+delta; i=c+4;K=N-q-i-j;J=j-q-1
    if K<0 or j+2<=q:return None,None
    if J<0:
        if K<2:return None,'center_only'
        n=K-2;s=j==q
        def f(t):
            E=(4*e*C(n+c+3,c+2) if t==1 else 4*A(e,c+3,c+2,1,n+c+1) if t==2 else 0) if s else (4*e*C(n+c+2,c+2) if t==2 else 0)
            return L(c+n+(5 if s else 6)-2*t,j+t,c+1)+E
        return [f(t) for t in range(3)],'entry'+str(int(s))
    if K<2:
        n=J;s=K==1
        def f(t):
            E=(4*A(e,c+2,c+3,1,n+c+2) if t==0 else 4*e*C(n+c+4,c+3) if t==1 else 0) if s else (4*e*C(n+c+3,c+3) if t==0 else 0)
            return S(n+c+(2 if s else 3)+2*t,q+c+(4 if s else 3)-t,c+1)+E
        return [f(t) for t in range(3)],'exit'+str(int(s))
    if J+2<=K:
        h=K-J-2
        return [L(c+h+4-2*t,j+t,c+1)+4*A(e,c+3,c+2,J+t,c+h+4-2*t) for t in range(3)],'low'
    x=K-2;h=J+1-K;k=3*x+h+c+12-delta
    return [S(c+h+2+2*t,k+c+1-t,c+1)+4*A(e,c+2,c+3,x+2-t,c+h+2+2*t) for t in range(3)],'upper'

def main():
    start=time.monotonic()
    out=dict(status='Exact finite experiments; not universal proof',q_max=40,c_max=12,coefficient_comparisons=0,raw_triples=0,polygon_triples=0,zero_triples=0,regions={},failures=[])
    for q in range(1,41):
        for r in (False,True):
            a,b,p=frame([False]*(q-1)+[True,r]);assert a==3 and b==3*q+(1 if r else 2)
            for c in range(13):
                for j in range(b+7):
                    for name,fn,pts in [('d',diagonal,[(c+3,j+2),(c+4,j+1),(c+5,j)]),('v',vertical,[(c+4,j),(c+4,j+1),(c+4,j+2)])]:
                        vals=[p.get(z,0) for z in pts]
                        out['raw_triples']+=1;out['zero_triples']+=int(0 in vals)
                        out['polygon_triples']+=int(all(3*b<=b*i+3*k and i+k<=b+2 for i,k in pts))
                        if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['raw',q,r,c,j,name,vals])
                        got,region=fn(c,q,j,r)
                        if got is not None:
                            out['coefficient_comparisons']+=3
                            key=name+'_'+region;out['regions'][key]=out['regions'].get(key,0)+1
                            if got!=vals:out['failures'].append(['identity',q,r,c,j,name,got,vals])
        if q%10==0:print('q',q,'failures',len(out['failures']),flush=True)
    out['seconds']=time.monotonic()-start
    out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    Path('evidence/markov-9c28b628/source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out))
if __name__=='__main__':main()
