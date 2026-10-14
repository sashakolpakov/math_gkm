"""Machine-authored independent literal numerator recurrence checks."""
from pathlib import Path
import json
def mul(p,q):
 r={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():r[i+k,j+l]=r.get((i+k,j+l),0)+a*b
 return r
def sub(p,q):
 r=dict(p)
 for k,c in q.items():r[k]=r.get(k,0)-c
 return {k:c for k,c in r.items() if c}
hi={(1,0):1,(0,1):1};S={(0,0):1,**hi};prod=mul(S,hi)
lo={(0,0):1};mid={(2,0):1,(1,1):2,(0,2):1,(1,0):1}
a,b=1,2;records=[]
for n in range(21):
 if n in [16,20]:
  js=[5,6,7] if n==16 else [6,7,8];pts=[[a+3-j,j] for j in js]
  vals=[mid.get(tuple(p),0) for p in pts]
  guards=[a*b<=b*i+a*j and i+j<=a+b-1 for i,j in pts]
  expected=json.loads(Path('evidence/markov-9c20fccd/'+('same-degree-witness.json' if n==16 else 'weighted-degree-witness.json')).read_text())
  assert vals==expected['raw_triple'] and all(guards)
  records.append(dict(path=[True]*n,a=a,b=b,points=pts,coefficients=vals,polygon_guards=guards,gap=vals[1]**2-vals[0]*vals[2],matches_cut_representation=True))
 lo,mid=mid,sub(mul(prod,mid),mul({(1,1):1},lo));a+=1;b+=1
rec=dict(status='finite exact independent literal recurrence; not universal proof',records=records)
Path('evidence/markov-9c20fccd/raw-witness-check.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
