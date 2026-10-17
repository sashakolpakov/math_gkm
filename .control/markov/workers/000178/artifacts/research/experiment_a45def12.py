"""Machine-authored exact finite checks, deliberately separate from Lean proofs."""
from pathlib import Path
from math import comb
import json,time,random,hashlib
from three_probe_9e205206 import frame
from source_experiment_6576ccc5 import correction
from source_experiment_9647c1ba import L
from pf_probe_a45def12 import conv
O=Path('/Users/sasha/math_gkm/evidence/markov-a45def12')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def qp(j,s):return [(1 if i==j else 4*(j-i))*C(s+i+3,i) for i in range(j+1)]
def coefprod(j,s,t,n):
    return sum((1 if i==j else 4*(j-i))*(1 if n-i==j else 4*(j-n+i))*
               C(s+i+3,i)*C(t+n-i+3,n-i) for i in range(max(0,n-j),min(j,n)+1))
def save(name,out,start):
    out['seconds']=time.monotonic()-start
    out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    (O/name).write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
def run():
    start=time.monotonic();out=dict(status='finite exact auxiliary checks, not proof',low_formulas=0,cutoff_formulas=0,low_steps=0,cutoff_steps=0,last_steps=0,open_steps=0,bounds=0,failures=[])
    for j in range(1,81):
        for s in list(range(10))+[20,100]:
            A=conv(qp(j,s),qp(j,s+2));B=conv(qp(j,s+1),qp(j,s+1))
            for n in range(j):
                T=2*s+n+9;D=(2*s+10)*(2*s+11)
                aa=16*(j*(j-n)*C(T,n)+(s+4)*(s+6)*C(T,n-2))
                bb=16*(j*(j-n)*C(T,n)+(s+5)**2*C(T,n-2))
                out['low_formulas']+=2
                if (A[n],B[n])!=(aa,bb):out['failures'].append(['low formula',j,s,n])
                if n+1<j:
                    gap=256*C(T,n)*C(T+1,n+1)*D*j*n*(2*j-n-1)
                    if D*D*(B[n+1]*A[n]-B[n]*A[n+1])!=gap:out['failures'].append(['low gap',j,s,n])
            aa=16*(s+4)*(s+6)*C(2*s+j+9,j-2)+4*j*(C(s+j+3,j)+C(s+j+5,j))
            bb=16*(s+5)**2*C(2*s+j+9,j-2)+8*j*C(s+j+4,j)
            out['cutoff_formulas']+=2
            if (A[j],B[j])!=(aa,bb):out['failures'].append(['cutoff formula',j,s])
            if j>=2:
                out['bounds']+=1
                if j*(j-1)*C(s+j+3,j-2)>4*C(2*s+j+9,j-2):out['failures'].append(['quadratic bound',j,s])
            for n in range(2*j):
                out['low_steps' if n+1<j else 'cutoff_steps' if n+1==j else 'last_steps' if n+1==2*j else 'open_steps']+=1
                if B[n+1]*A[n]<B[n]*A[n+1]:out['failures'].append(['ratio',j,s,n])
    rng=random.Random(0xa45def12)
    for _ in range(600):
        j=rng.randrange(2,501);s=rng.randrange(301);n=rng.randrange(j,2*j-1)
        A0=coefprod(j,s,s+2,n);A1=coefprod(j,s,s+2,n+1)
        B0=coefprod(j,s+1,s+1,n);B1=coefprod(j,s+1,s+1,n+1)
        out['open_steps']+=1
        if B1*A0<B0*A1:out['failures'].append(['random upper ratio',j,s,n])
    save('convolution-experiment.json',out,start)
    start=time.monotonic();out=dict(status='finite exact actual-source experiment, not proof',fractions=0,rows=0,coefficients=0,zeros=0,raw_triples=[0,0,0],failures=[])
    for q in list(range(2,19))+[25]:
        for r in [False,True]:
            a,b,p=frame([False]*(q-1)+[True,r]);out['fractions']+=1
            for k in range((q-(2 if r else 1))//2+1):
                d=q-2*k-(2 if r else 1);j=q+k+1;out['rows']+=1
                for i in range(b+6):
                    raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
                    if raw!=L(d,j,i-3)+correction(d,k,i-2,r):out['failures'].append(['source identity',q,r,k,i])
            def inside(i,j):return a*b<=b*i+a*j and i+j<=a+b-1
            for i in range(a+b+1):
                for j in range(a+b+1-i):
                    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
                        if all(inside(*z) for z in pts):
                            vals=[p.get(z,0) for z in pts];out['raw_triples'][direction]+=1
                            if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['raw inequality',q,r,direction,pts,vals])
    save('source-experiment.json',out,start)
if __name__=='__main__':run()
