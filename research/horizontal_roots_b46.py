"""Exact rational Sturm exploration; mathematical conclusions remain finite."""
import json,pathlib,sys,time
from fractions import Fraction as F
from balanced_f80 import A,B,mm
def trim(p):
 while p and not p[-1]:p.pop()
 return p
def rem(a,b):
 a=a.copy()
 while len(a)>=len(b):
  c=a[-1]/b[-1];d=len(a)-len(b)
  for k,x in enumerate(b):a[k+d]-=c*x
  trim(a)
 return a
def realrooted(p):
 p=trim(list(map(F,p)))
 while p and not p[0]:p=p[1:]
 if len(p)<=2:return True,None
 seq=[p,[k*p[k] for k in range(1,len(p))]]
 while seq[-1]:
  q=rem(seq[-2],seq[-1])
  if not q:break
  seq.append([-x for x in q])
 gcddeg=len(seq[-1])-1
 def variation(negative):
  signs=[(1 if q[-1]>0 else -1)*(-1 if negative and (len(q)-1)%2 else 1) for q in seq]
  return sum(x!=y for x,y in zip(signs,signs[1:]))
 distinct=variation(True)-variation(False)
 return distinct==len(p)-1-gcddeg,dict(degree=len(p)-1,gcd_degree=gcddeg,distinct_real=distinct)
start=time.monotonic();bound=int(sys.argv[1]);stack=[('A',A)];tested=0;first=None
source_mode=len(sys.argv)>2 and sys.argv[2]=='source'
if source_mode:
 from scan import generate
 candidates=((path,p) for path,(a,b,p) in generate(bound))
else:
 def allwords():
  while stack:
   w,m=stack.pop()
   if len(w)>=2 and w[-1]=='B':yield w,m[1]
   if len(w)<bound:stack.extend([(w+'B',mm(m,B)),(w+'A',mm(m,A))])
 candidates=allwords()
for w,p in candidates:
  for j in range(max(k[1] for k in p)+1):
   row=[p.get((i,j),0) for i in range(max(k[0] for k in p)+1)]
   ok,detail=realrooted(row);tested+=1
   if not ok:
    first=dict(word=w,j=j,coefficients=row,sturm=detail);break
  if first:break
res=dict(bound=bound,source_mode=source_mode,rows=tested,first_failure=first,seconds=time.monotonic()-start,status='finite exact Sturm computation, not a universal proof')
pathlib.Path(f'evidence/markov-b46c0efc/horizontal-roots-{bound}-{source_mode}.json').write_text(json.dumps(res,indent=2));print(json.dumps(res))
