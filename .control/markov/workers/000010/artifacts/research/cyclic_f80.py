"""Machine-authored circularly balanced raw products, exact finite evidence."""
import json,pathlib,time,sys
from balanced_f80 import A,B,I,mm,failure
from math import gcd
start=time.monotonic(); bound=int(sys.argv[1]) if len(sys.argv)>1 else 25
fails={};counts=0;canonical=[];first={}
for n in range(1,bound+1):
 for a in range(n+1):
  w=''.join('B' if ((k+1)*a)//n>(k*a)//n else 'A' for k in range(n))
  for shift in range(n):
   z=w[shift:]+w[:shift]
   m=I
   for c in z:m=mm(m,B if c=='B' else A)
   counts+=1
   for k,p in enumerate(m):
    f=failure(p)
    if f:
     fails[k]=fails.get(k,0)+1
     if k not in first:first[k]=dict(word=z,a=a,n=n,rotation=shift,entry=k,**f)
     if shift==0 and len(canonical)<10:canonical.append(dict(word=z,a=a,n=n,entry=k,**f))
 result=dict(bound=n,count=counts,failures=fails,first=first,canonical_failures=canonical,seconds=time.monotonic()-start,status='finite experiment; circular balance does not establish source membership')
 pathlib.Path('evidence/markov-f80fb8bc/cyclic-progress.json').write_text(json.dumps(result,indent=2)+'\n')
pathlib.Path(f'evidence/markov-f80fb8bc/cyclic-{bound}.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
