"""Independent mathematical checks of the copied finite Markov scan."""
from collections import Counter
from fractions import Fraction
from hashlib import sha256
from math import factorial, gcd
from pathlib import Path
import importlib.util
import json

ROOT = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('audited_scan', ROOT/'evidence/markov/scan.py')
scan = importlib.util.module_from_spec(spec)
spec.loader.exec_module(scan)
records = json.loads((ROOT/'evidence/markov/coefficients.json').read_text())
labels = [(r['a'],r['b']) for r in records]
expected_labels = {(a,b) for b in range(2,17) for a in range(1,b) if gcd(a,b)==1}
assert len(labels)==len(set(labels))==79
assert set(labels)==expected_labels
assert len({r['path'] for r in records})==79

# Check all finite local obligations by centers, independently of scan.triples.
directions=[(1,0),(0,1),(1,-1)]
counts=Counter(); raw_fail=[]; norm_fail=[]
for r in records:
    a,b=r['a'],r['b']; degree=a+b-1
    p={(i,j):c for i,j,c in r['terms']}
    lattice={(i,j) for i in range(degree+1) for j in range(degree+1)
             if i+j<=degree and b*i+a*j>=a*b}
    assert set(p)==lattice and all(c>0 for c in p.values())
    center_obligations=set()
    for i,j in sorted(lattice):
        for di,dj in directions:
            pts=((i-di,j-dj),(i,j),(i+di,j+dj))
            if all(q in lattice for q in pts):
                center_obligations.add(((di,dj),pts)); counts[(di,dj)]+=1
                raw=[p.get(q,0) for q in pts]
                normalized=[Fraction(p.get((k,l),0)*factorial(k)*factorial(l)*factorial(degree-k-l),factorial(degree)) for k,l in pts]
                if raw[1]**2<raw[0]*raw[2]:raw_fail.append([a,b,pts,raw])
                if normalized[1]**2<normalized[0]*normalized[2]:norm_fail.append([a,b,pts,raw,list(map(str,normalized))])
    scan_obligations={(tuple(v),tuple(map(tuple,qs))) for v,qs in scan.triples(a,b)}
    assert center_obligations==scan_obligations
assert sum(counts.values())==22339 and not raw_fail

# Exact Laurent-polynomial verification of the original nonlinear mutation.
# Triple exponents retain z; hence this is not merely a numerical specialization.
def laurent(record):
    a,b,p=record; degree=a+b-1
    return {(2*i-a+1,2*j-b+1,degree-2*i-2*j):c for (i,j),c in p.items()}
def plus(p,q):
    r=p.copy()
    for m,c in q.items():r[m]=r.get(m,0)+c
    return {m:c for m,c in r.items() if c}
def times(p,q):
    r={}
    for m,c in p.items():
        for n,d in q.items():
            k=tuple(x+y for x,y in zip(m,n));r[k]=r.get(k,0)+c*d
    return {m:c for m,c in r.items() if c}
mutation_checks=0
label_by_path={r['path']:(r['a'],r['b'],{(i,j):c for i,j,c in r['terms']}) for r in records}
stack=[('',scan.initial)]
while stack:
    path,frame=stack.pop();lo,mid,hi=frame
    assert label_by_path[path]==mid
    assert Fraction(lo[0],lo[1])<Fraction(mid[0],mid[1])<Fraction(hi[0],hi[1])
    assert lo[0]+hi[0]==mid[0] and lo[1]+hi[1]==mid[1]
    assert hi[0]*lo[1]-lo[0]*hi[1]==1
    for right,letter in [(False,'L'),(True,'R')]:
        child=scan.child(frame,right)
        if child[1][1]>16:continue
        fixed,old=(hi,lo) if right else (lo,hi)
        qnew,qold,qfixed,qmid=map(laurent,[child[1],old,fixed,mid])
        assert times(qold,qnew)==plus(times(qfixed,qfixed),times(qmid,qmid))
        mutation_checks+=1
        stack.append((path+letter,child))
assert mutation_checks==78
sample=next(r for r in records if (r['a'],r['b'])==(1,3))
p={(i,j):c for i,j,c in sample['terms']}
assert [p[(1,j)] for j in range(3)]==[1,2,3]
summary=dict(
    denominator_bound=16, distinct_proper_reduced_fractions=len(labels),
    all_labels_equal_direct_gcd_enumeration=True, unique_paths=True,
    checked_original_laurent_mutations=mutation_checks,
    checked_total_triples=sum(counts.values()),
    triples_by_direction={str(k):v for k,v in counts.items()},
    raw_failures=len(raw_fail), normalized_failures=len(norm_fail),
    first_normalized_failure=norm_fail[0],
    source_sample_2_3_terms=next(r['terms'] for r in records if (r['a'],r['b'])==(2,3)),
    source_scan_sha256=sha256((ROOT/'evidence/markov/scan.py').read_bytes()).hexdigest(),
)
(ROOT/'independent-checks.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2))
