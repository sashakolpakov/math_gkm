"""Machine-authored finite checks of new formulas against exact inherited sum."""
from lower_symbolic_26ca import formula
from pell_sum_probe_9a72 import f
import pathlib,json,time
t=time.monotonic();fail=[];formulas=0;triples=0
ps=[formula(s) for s in [1,2,3]]
def ev(p,i,j):return sum(v*i**k*j**l for (k,l),v in p.items())
for a in range(3,151):
 for s in [1,2,3]:
  for j in range(2*s,a+1):
   i=a+s-j
   if i<s:continue
   actual=sum(f(a,j,s,q) for q in range(a+1))
   predicted=ev(ps[s-1],i,j);formulas+=1
   if actual!=predicted:fail.append(['formula',a,s,i,j,actual,str(predicted)])
 for i in range(1,a):
  j=a+1-i
  for direction,di,dj,valid in [('horizontal',1,0,j>=6),('vertical',0,1,i>=3 and j>=4)]:
   if not valid:continue
   cs=[sum(f(a,j+k*dj,1+k,q) for q in range(a+1)) for k in range(3)]
   triples+=1
   if cs[0]*cs[2]>cs[1]**2:fail.append([direction,a,i,j,cs])
out=dict(status='finite exact experiment, not a universal proof',a_max=150,formula_checks=formulas,raw_triples=triples,failures=fail,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-26ca8e85/lower-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
