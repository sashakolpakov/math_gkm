"""Machine-authored probe of stronger arbitrary-direction raw concavity.
Only source recurrence polynomials, exact integers, polygon-guarded triples.
"""
import sys,pathlib,json,time,math
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import generate
t=time.monotonic();bound=int(sys.argv[1]);checks=0;fail=[];fractions=0
dirs=[(di,dj) for di in range(0,5) for dj in range(-4,5)
 if math.gcd(di,dj)==1 and (di>0 or dj>0)]
bydir={str(d):0 for d in dirs}
for path,(a,b,p) in generate(bound):
 fractions+=1
 for di,dj in dirs:
  for i,j in p:
   if not all(x>=0 and y>=0 and a*b<=b*x+a*y and x+y<=a+b-1
     for x,y in [(i,j),(i+di,j+dj),(i+2*di,j+2*dj)]):continue
   cs=[p.get((i+k*di,j+k*dj),0) for k in range(3)];checks+=1
   if cs[1]**2<cs[0]*cs[2]:
    bydir[str((di,dj))]+=1
    if len(fail)<20:fail.append(dict(a=a,b=b,path=path,direction=[di,dj],start=[i,j],coefficients=cs))
 result=dict(status='finite exact experiment, not proof',bound=bound,fractions=fractions,checks=checks,failures=fail,failures_by_direction=bydir,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-3edac4bf/directions-probe.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
