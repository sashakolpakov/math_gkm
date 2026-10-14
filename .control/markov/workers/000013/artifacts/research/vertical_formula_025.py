"""Machine-authored exact candidate check, request 02592c7b. Not a proof."""
import json, pathlib, sys, time, math
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import generate
start=time.monotonic(); bound=int(sys.argv[1]); checks=0; failures=[]; examples=[]
for path,(a,b,p) in generate(bound):
    if a<3: continue
    q,r=divmod(b,a)
    residual=[4*(a*k+r) for k in range(q)]+[3*b-1,a+b-1]
    expected={}
    for k,c in enumerate(residual):
        for t in range(a-2):
            j=b-q+k+t
            expected[j]=expected.get(j,0)+c*math.comb(a-3,t)
    actual={j:c for (i,j),c in p.items() if i==1}
    expected={j:c for j,c in expected.items() if c}
    checks+=1
    if actual!=expected: failures.append(dict(path=path,a=a,b=b,actual=actual,expected=expected))
    if len(examples)<12: examples.append(dict(path=path,a=a,b=b,q=q,r=r,residual=residual))
out=dict(status='finite exact candidate verification, not universal source bridge',bound=bound,
    checks=checks,failures=failures,examples=examples,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-02592c7b/vertical-formula.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
