from scan import add,mul
import json
from math import comb
from pathlib import Path

one={(0,0):1}; t={(1,0):1}; s={(0,1):1}
a=add(t,one,3); b=add(add(t,s),one,4)
A=mul(add(a,one,-1),add(a,one,-2))
B=add(add(mul(a,b),a,-4),one,2)
C=mul(add(b,one,-1),add(b,one,-2))
gap=add(mul(B,B),mul(A,C),-1)
# B above is unscaled; desired certificate is 4 B² - A C.
gap=add({m:4*c for m,c in mul(B,B).items()},mul(A,C),-1)
assert min(gap.values())>0
records=json.loads(Path('evidence/markov/coefficients.json').read_text())
checks=[]; failures=[]
for r in records:
    a,b=r['a'],r['b']
    if a<3: continue
    n=a+b-5
    A=(a-1)*(a-2)//2; B=a*b-4*a+2; C=(b-1)*(b-2)//2
    p={(i,j):v for i,j,v in r['terms']}
    def choose(n,k): return comb(n,k) if 0<=k<=n else 0
    actual=[p.get((k,a+b-3-k),0) for k in range(a+b-2)]
    formula=[A*choose(n,k)+B*choose(n,k-1)+C*choose(n,k-2) for k in range(a+b-2)]
    checks.append([a,b])
    if actual!=formula: failures.append([a,b,actual,formula])
report={'identity_checked_fractions':checks,'identity_failures':failures,'gap_certificate_terms':[[i,j,c] for (i,j),c in sorted(gap.items())],'certificate_meaning':'4 B² - (a-1)(a-2)(b-1)(b-2) after a=t+3,b=t+s+4; all coefficients positive','example_3_4':{'quadratic':[1,2,3],'discriminant':-8,'smoothed_twice':[1,4,8,8,3]}}
Path('evidence/markov/diagonal-result.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
