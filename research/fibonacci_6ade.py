"""Machine-authored exact recurrence/formula check; finite evidence only."""
import sys, pathlib, json, math, time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
out=pathlib.Path('evidence/markov-6ade2697')
u={(1,0):1};v={(0,1):1};s=add(add(u,v),{(0,0):1})
p0={(0,0):1};p1=add(u,v)
counts=dict(polynomials=0,coefficients=0,triples=0)
failures=[];start=time.monotonic()
for b in range(2,71):
 p=add(mul(s,p1),mul(v,p0),-1)
 counts['polynomials']+=1
 for i in range(b+2):
  for j in range(b+2):
   expect=0
   if i==0:expect=int(j==b)
   elif i+j<=b:expect=math.comb(b-j-1,i-1)*math.comb(i+j,j)
   counts['coefficients']+=1
   if p.get((i,j),0)!=expect:failures.append(['formula',b,i,j,p.get((i,j),0),expect])
   for di,dj in [(1,0),(0,1),(1,-1)]:
    if j+2*dj<0:continue
    cs=[p.get((i+t*di,j+t*dj),0) for t in range(3)]
    counts['triples']+=1
    if cs[1]**2<cs[0]*cs[2]:failures.append(['lc',b,i,j,di,dj,cs])
 p0,p1=p1,p
result=dict(status='finite exact recurrence check, not universal proof',bound=70,
 counts=counts,failures=failures,seconds=time.monotonic()-start,
 formula='i>=1 and i+j<=b: choose(b-j-1,i-1)*choose(i+j,j); i=0: delta(j,b); otherwise zero')
(out/'fibonacci-experiment.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
