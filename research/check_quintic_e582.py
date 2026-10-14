"""Machine-authored finite exact cross-check, not a proof premise."""
import itertools,json,pathlib,time,sys
from quintic_bounds_e582 import vals
from next_slice_26dd import step,terminal,R
sys.path.insert(0,'evidence/markov')
from scan import initial,child,polygon
start=time.monotonic();out=pathlib.Path('evidence/markov-e5822cfc')
patterns={'0000','0001','0011','1000','1001','1011','1100','1101'}
def stats(w):
 n=len(w);m=w.count('1');s=sum(a!=b for a,b in zip(w,w[1:]));t=sum(w[i]==w[i+2] and w[i+1]=='0' for i in range(n-2))
 h=sum(w[i:i+4] in ['0000','1001'] for i in range(n-3));k=sum(w[i:i+4] in patterns for i in range(n-3))
 e=int(w[0]=='0')+int(w[-1]=='0');f=int(w[:3]=='010')+int(w[-3:]=='010')
 return (n,m,s,t,h,k,e,f)
words=0;bad=[];boundbad=[];qbad=[]
z=[[0]*(r+1) for r in range(R+1)];z[0][0]=1
def visit(w,p,q):
 global words
 if len(w)>=3:
  st=stats(w);v=vals(*st);actual=terminal(p,q,5);words+=1
  if v!=[120*a for a in actual]:bad.append([w,v,actual])
  n,m,s,t,h,k,e,f=st
  if not (s<=2*min(m,n-m) and t<=n-m and h<=n-m and k<=2*(n-m) and n<=t+3*m+2 and n<=h+4*m+3):boundbad.append([w,st])
  if any(actual[i]*actual[i+2]>actual[i+1]**2 for i in range(4)):qbad.append([w,actual])
 if len(w)<13:
  for b in [False,True]:visit(w+str(int(b)),*step(p,q,b))
visit('',z,z)
stack=[('',initial)];fractions=triples=small=0;rawbad=[]
while stack:
 path,f=stack.pop();a,b,p=f[1];fractions+=1;d=a+b-1
 for i in range(max(d-6,0)):
  j=d-7-i
  if j<0:continue
  pts=[(i,j+2),(i+1,j+1),(i+2,j)]
  if all(polygon(a,b,*pt) for pt in pts):
   cs=[p.get(pt,0) for pt in pts];triples+=1;small+=b<20
   if cs[0]*cs[2]>cs[1]**2:rawbad.append([path,a,b,pts,cs])
 for r in [False,True]:
  fixed=f[2] if r else f[0]
  if b+fixed[1]<=35:stack.append((path+('R' if r else 'L'),child(f,r)))
res=dict(status='finite exact evidence only, not proof',words=words,max_core_length=13,formula_failures=bad,
 bound_failures=boundbad,quintic_inequality_failures=qbad,source_denominator_bound=35,
 source_fractions=fractions,raw_sixth_triples=triples,triples_below_new_denominator_range=small,raw_failures=rawbad,
 rejected_bound=dict(core='11011',k=2,false_count=1,claim='k <= false_count',status='false for enlarged words; corrected to twice false_count'),seconds=time.monotonic()-start)
(out/'quintic-check.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res))
