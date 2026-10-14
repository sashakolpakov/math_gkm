"""Machine-authored independent subset-cut expansion and interval tests."""
from transfer_states_b5db import states
import itertools,json,pathlib,time,math
out=pathlib.Path('evidence/markov-a27f6d42');start=time.monotonic()
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def gap(w):
 q=0
 for r in reversed(w):
  if not r:break
  q+=1
 return [1]+[2]*q+([1] if q==len(w) else [])
def cuts(w):
 z=w+(True,);F={};count=0
 for s in range(len(z)+1):
  for picks in itertools.combinations(range(len(z)),s):
   p=[1];prev=-1
   for k in picks:
    p=mul(p,gap(z[prev+1:k]));p=mul(p,[1,1] if z[k] else [1]);prev=k
   for j,c in enumerate(p):
    if c:F[s,j]=F.get((s,j),0)+c
   count+=1
 return F,count
counts=dict(words=0,subsets=0,identities=0,column_triples=0);fail={}
for n in range(9):
 for w in itertools.product([False,True],repeat=n):
  F,c=cuts(w);expected=states(w)[2]
  assert F==expected,(w,F,expected)
  counts['words']+=1;counts['subsets']+=c;counts['identities']+=1
  for s in range(n+2):
   for j in range(n+sum(w)+1):
    a,b,c=[F.get((s,j+k),0) for k in range(3)]
    counts['column_triples']+=1
    if b*b<a*c and 'column' not in fail:fail['column']=dict(word=list(w),s=s,j=j,coefficients=[a,b,c])
rec=dict(status='finite exact independent subset expansion; no universal LC inference',counts=counts,failures=fail,seconds=time.monotonic()-start)
(out/'cut-probe.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
