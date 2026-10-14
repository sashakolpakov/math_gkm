"""Machine-authored exact scan testing support-constrained word enlargement."""
import json,pathlib,time,sys,math
from balanced_f80 import A,B,mm,failure
out=pathlib.Path('evidence/markov-8934af17');start=time.monotonic()
bound=int(sys.argv[1]); stack=[('A',A)];checked=0;contained=0;reduced=0;fails=[];counts={}
while stack:
 w,m=stack.pop()
 if len(w)>1 and w[-1]=='B':
  checked+=1;a=w.count('B');b=len(w);p=m[1]
  if all(a*b<=b*i+a*j and i+j<=a+b-1 for i,j in p):
   contained+=1;counts[b]=counts.get(b,0)+1
   if math.gcd(a,b)==1:reduced+=1
   f=failure(p)
   if f and len(fails)<20:fails.append(dict(word=w,a=a,b=b,coprime=math.gcd(a,b)==1,**f))
 if len(w)<bound:stack.extend([(w+'A',mm(m,A)),(w+'B',mm(m,B))])
result=dict(status='finite non-source word experiment only',bound=bound,checked=checked,
 contained=contained,reduced=reduced,counts=counts,failures=fails,seconds=time.monotonic()-start)
(out/f'polygon-words-{bound}.json').write_text(json.dumps(result,indent=2));print(json.dumps(result))
