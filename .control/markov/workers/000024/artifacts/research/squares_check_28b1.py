"""Machine-authored exact cross-check of canonical half-word square forms."""
import pathlib,json,time,sys
from balanced_f80 import A,B,mm,I,failure
from scan import add,mul,generate
o=pathlib.Path('evidence/markov-28b112de');t=time.monotonic()
u={(1,0):1};v={(0,1):1};one={(0,0):1}
checks=0;failures=[];half_failures=[];sync=[];examples=[]
for path,(a,b,p) in generate(45):
 lo,hi='A','B'
 for c in path:
  if c=='L':hi=lo+hi
  else:lo=lo+hi
 word=lo+hi
 w=''.join('AC' if c=='B' else 'A' for c in word)[1:-1]
 assert w==w[::-1]
 x=y=one
 # Peel symmetric endpoints from outside in, updating the boundary vector.
 for c in w[:len(w)//2]:
  h=add(mul(v,x),mul(u,y))
  x,y=(add(h,x),h) if c=='C' else (h,add(h,y))
 if len(w)%2==0:
  f,g=x,y;pieces=[mul(v,mul(f,f)),mul(u,mul(g,g))];kind='v*f^2+u*g^2'
 else:
  f=add(mul(v,x),mul(u,y))
  if w[len(w)//2]=='C':g=x;pieces=[mul(f,f),mul(v,mul(g,g))];kind='f^2+v*g^2'
  else:g=y;pieces=[mul(f,f),mul(u,mul(g,g))];kind='f^2+u*g^2'
 q=add(*pieces);checks+=1
 if q!=p:failures.append(dict(a=a,b=b,kind=kind))
 for name,z in [('f',f),('g',g)]:
  bad=failure(z)
  if bad and len(half_failures)<8:half_failures.append(dict(a=a,b=b,half=name,**bad))
 if len(examples)<8:examples.append(dict(a=a,b=b,path=path,word=word,gas_core=w,kind=kind,
   f=sorted((i,j,c) for (i,j),c in f.items()),g=sorted((i,j,c) for (i,j),c in g.items())))
result=dict(status='finite exact check, not a proof',bound=45,checks=checks,identity_failures=failures,
 half_lc_failures=half_failures,examples=examples,seconds=time.monotonic()-t)
(o/'square-check.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k!='examples'}))
