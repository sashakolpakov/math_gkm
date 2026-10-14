"""Machine-authored exact tests of the new positive column recurrence.
All finite observations; arbitrary-kernel closure must not be presumed.
"""
import sys,pathlib,json,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
out=pathlib.Path('evidence/markov-3af43e69')
u={(1,0):1};v={(0,1):1};s={(1,0):1,(0,1):1,(0,0):1}
f=[{(0,0):1},add(u,v)]
for n in range(2,34):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
p=[add(mul(f[q+1],f[q+1]),mul(v,mul(f[q],f[q]))) for q in range(32)]
get=lambda p,i,j:p.get((i,j),0)
bad={};checks=0
for q in range(30):
 for i in range(2,2*q+7):
  c=lambda j:get(p[q],i,j)
  d=lambda j:get(p[q+1],i,j)-get(p[q],i,j)
  for j in range(-1,2*q+7):
   checks+=1
   tests=dict(monotonicity=d(j)>=0,increment_lc=d(j)**2>=d(j-1)*d(j+1),
    increment_source_sync=2*c(j)*d(j)>=c(j-1)*d(j+1)+c(j+1)*d(j-1))
   for k,ok in tests.items():
    if not ok and k not in bad:bad[k]=dict(q=q,i=i,j=j,c=[c(j+t) for t in [-1,0,1]],d=[d(j+t) for t in [-1,0,1]])
 # summands of increment recurrence: shifted old increment, 2(1+v)C_(i-1), C_(i-2)
 for i in range(2,2*q+7):
  terms=[lambda j:get(p[q+1],i,j-2)-get(p[q],i,j-2),
   lambda j:2*(get(p[q+1],i-1,j)+get(p[q+1],i-1,j-1)),
   lambda j:get(p[q+1],i-2,j)]
  for a in range(3):
   for b in range(a+1,3):
    for j in range(2*q+7):
     A,B=terms[a],terms[b]
     if 2*A(j)*B(j)<A(j-1)*B(j+1)+A(j+1)*B(j-1) and 'increment_term_sync' not in bad:
      bad['increment_term_sync']=dict(q=q,i=i,j=j,terms=[a,b],A=[A(j+t) for t in [-1,0,1]],B=[B(j+t) for t in [-1,0,1]])
res=dict(status='finite exact evidence only',q_bound=30,checks=checks,failures=bad,
 kernel_obstruction=[1,0,1])
(out/'column-strategies.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res))
