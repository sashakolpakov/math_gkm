"""Machine-authored exact checks, retained as finite evidence only."""
import itertools,json,pathlib,time,sys
from collections import defaultdict
sys.path.insert(0,'evidence/markov')
from scan import initial,child,polygon
start=time.monotonic();out=pathlib.Path('evidence/markov-4f8ceeeb')
def shift(p,a,b):return {(i+a,j+b):v for (i,j),v in p.items() if i+j+a+b<=4}
def add(*ps):
 d=defaultdict(int)
 for p in ps:
  for k,v in p.items():d[k]+=v
 return dict(d)
def quotient(w):
 p=q={(0,0):1}
 for r in w:
  h=add(p,shift(q,1,0));p,q=(add(h,shift(p,0,1)),h) if r else (h,add(h,shift(q,0,1)))
 return add(p,shift(q,1,0))
def formula(w):
 n=len(w);m=sum(w);s=sum(w[i]!=w[i+1] for i in range(n-1));t=sum(w[i]==w[i+2] and not w[i+1] for i in range(n-2))
 return [m*(m-1)*(m-2)*(m-3),4*((n-8)*m**3+18*m*m+(5*n-22)*m-6*n+12)+48*(1-m)*s+48*t,6*(n*n*(m*m+3*m+6)+n*(-11*m*m-9*m-18)+26*m*m-10*m+12)+(144-48*n)*s,4*(n-1)*(n-2)*(3*n+m*(n-6)),(n+1)*n*(n-1)*(n-2)]
words=0;formula_fail=[];lc_fail=[]
for n in range(2,15):
 for w in itertools.product([False,True],repeat=n):
  q=quotient(w);cs=[q.get((i,4-i),0) for i in range(5)];words+=1
  if [24*c for c in cs]!=formula(w):formula_fail.append([w,cs])
  if any(cs[i]*cs[i+2]>cs[i+1]**2 for i in range(3)):lc_fail.append([w,cs])
stack=[('',initial)];fractions=triples=0;raw_fail=[];outside_new_scope=0
while stack:
 path,f=stack.pop();a,b,p=f[1];fractions+=1;d=a+b-1
 for i in range(max(d-5,0)):
  j=d-6-i
  if j<0:continue
  pts=[(i,j+2),(i+1,j+1),(i+2,j)]
  if all(polygon(a,b,*pt) for pt in pts):
   cs=[p.get(pt,0) for pt in pts];triples+=1;outside_new_scope+=a<7
   if cs[0]*cs[2]>cs[1]**2:raw_fail.append([path,a,b,pts,cs])
 for r in [False,True]:
  fixed=f[2] if r else f[0]
  if b+fixed[1]<=32:stack.append((path+('R' if r else 'L'),child(f,r)))
res=dict(status='finite exact computation only, not proof',word_max_length=14,words=words,formula_failures=formula_fail,quartic_lc_failures=lc_fail,source_denominator_bound=32,source_fractions=fractions,raw_fifth_triples=triples,triples_with_a_less_than_7=outside_new_scope,raw_failures=raw_fail,seconds=time.monotonic()-start)
(out/'quartic-check.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res))
