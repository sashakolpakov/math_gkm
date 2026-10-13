"""Exact, source-recurrence computations; finite evidence, not a proof."""
import json
from math import factorial, gcd
from fractions import Fraction
from pathlib import Path

def add(p,q,scale=1):
    r=p.copy()
    for m,c in q.items():
        r[m]=r.get(m,0)+scale*c
    return {m:c for m,c in r.items() if c}

def mul(p,q):
    r={}
    for (i,j),c in p.items():
        for (k,l),d in q.items():
            m=(i+k,j+l)
            r[m]=r.get(m,0)+c*d
    return {m:c for m,c in r.items() if c}

S={(0,0):1,(1,0):1,(0,1):1}
initial=((0,1,{(0,0):1}),(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1}),(1,1,{(1,0):1,(0,1):1}))

def child(f,right):
    lo,mid,hi=f
    fixed,old=(hi,lo) if right else (lo,hi)
    a,b,p=fixed
    new=(a+mid[0],b+mid[1],add(mul(mul(S,p),mid[2]),mul({(a,b):1},old[2]),-1))
    return (mid,new,hi) if right else (lo,new,mid)

def generate(bound):
    stack=[('',initial)]
    while stack:
        path,f=stack.pop()
        if f[1][1]>bound: continue
        yield path,f[1]
        stack.extend([(path+'R',child(f,True)),(path+'L',child(f,False))])

def polygon(a,b,i,j):
    return i>=0 and j>=0 and b*i+a*j>=a*b and i+j<=a+b-1

def triples(a,b):
    for i in range(a+b):
        for j in range(a+b-i):
            for di,dj in [(1,0),(0,1),(1,-1)]:
                pts=[(i+k*di,j+k*dj) for k in range(3)]
                if all(polygon(a,b,*p) for p in pts):
                    yield (di,dj),pts

def main():
    bound=16
    records=[]; raw_fail=[]; normalized_fail=[]; support_fail=[]; count=0
    for path,(a,b,p) in generate(bound):
        expected={(i,j) for i in range(a+b) for j in range(a+b-i) if polygon(a,b,i,j)}
        if set(p)!=expected or min(p.values())<=0: support_fail.append([a,b])
        d=a+b-1
        norm={m:Fraction(c*factorial(m[0])*factorial(m[1])*factorial(d-sum(m)),factorial(d)) for m,c in p.items()}
        for direction,pts in triples(a,b):
            count+=1
            x,y,z=[p.get(t,0) for t in pts]
            if y*y<x*z: raw_fail.append([a,b,direction,pts,[x,y,z]])
            x,y,z=[norm.get(t,0) for t in pts]
            if y*y<x*z and len(normalized_fail)<8:
                normalized_fail.append([a,b,direction,pts,list(map(str,[x,y,z]))])
        records.append({'a':a,'b':b,'path':path,'terms':[[i,j,c] for (i,j),c in sorted(p.items())]})
    assert len(records)==sum(gcd(a,b)==1 for b in range(2,bound+1) for a in range(1,b))
    p23=next(r for r in records if (r['a'],r['b'])==(2,3))
    assert p23['terms']==[[0,3,1],[0,4,1],[1,2,4],[1,3,4],[2,0,1],[2,1,5],[2,2,6],[3,0,2],[3,1,4],[4,0,1]]
    report={'bound':bound,'fractions':len(records),'triples':count,'support_failures':support_fail,'raw_failures':raw_fail,'normalized_failures_first8':normalized_fail,'source_2_3_verified':True}
    Path('evidence/markov/coefficients.json').write_text(json.dumps(records)+'\n')
    Path('evidence/markov/scan-result.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))

if __name__=='__main__': main()
