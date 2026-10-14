"""Machine-authored exact experiment; never a universal proof."""
import sys,pathlib,json,time,math,shutil,importlib.util
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
out=pathlib.Path('evidence/markov-3556cd95');out.mkdir(exist_ok=True)
u={(1,0):1};v={(0,1):1};s={(0,0):1,(1,0):1,(0,1):1}
f=[{(0,0):1},add(u,v)]
for n in range(2,35):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
start=time.monotonic();rows=[];bad=[];strong=[]
for q in range(1,26):
 p=add(mul(f[q+1],f[q+1]),mul(v,mul(f[q],f[q])))
 alt=add(mul(s,mul(f[q],f[q+1])),{(1,q):1},-1)
 if p!=alt:bad.append(['identity',q])
 d=2*q+2
 for r in range(d+1):
  n=d-r;a=[p.get((i,n-i),0) for i in range(n+1)]
  # Newton normalized LC is necessary for real-rootedness.
  for i in range(1,n):
   if a[i]**2*i*(n-i)<a[i-1]*a[i+1]*(i+1)*(n-i+1):
    strong.append(dict(q=q,r=r,i=i,coefficients=a[i-1:i+2],degree=n));break
 rows.append(dict(q=q,terms=len(p)))
result=dict(status='finite exact evidence only',bound=25,identity_failures=bad,
 normalized_diagonal_failures=strong,rows=rows,seconds=time.monotonic()-start,
 capabilities={k:shutil.which(k) for k in ['sage','gap']},
 sympy_available=importlib.util.find_spec('sympy') is not None)
(out/'squares-experiment.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
