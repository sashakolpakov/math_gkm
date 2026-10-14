"""Machine-authored exact finite recurrence/formula check, not a proof."""
import sys,pathlib,json,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
start=time.monotonic();u={(1,0):1};v={(0,1):1};s={(0,0):1,(1,0):1,(0,1):1}
f=[{(0,0):1},add(u,v)]
for n in range(2,62):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
def B(j):return (j+1)*(j+2)*(2*j+3)//6 if j>=0 else 0
bad=[];checked=0
for q in range(1,61):
 p=add(mul(s,mul(f[q],f[q+1])),{(1,q):1},-1)
 for j in range(2*q+4):
  a=p.get((2,j),0);expected=B(j)-8*B(j-q-1) if j<=2*q else 0
  checked+=1
  if a!=expected:bad.append(['formula',q,j,a,expected])
  if a*p.get((2,j+2),0)>p.get((2,j+1),0)**2:bad.append(['lc',q,j])
out=dict(status='finite exact evidence only',q_bound=60,coefficient_checks=checked,
 failures=bad,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-3556cd95/second-column-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
