"""Machine-authored exact degree-minus-cut probes; finite evidence only."""
from pathlib import Path
from math import gcd
from random import Random
import json,time,sys
O=Path('evidence/markov-6d2c5a67')
def add(*ps):
 q={}
 for p in ps:
  for k,v in p.items():q[k]=q.get(k,0)+v
 return q
def transfer(w,limit=7):
 def sh(p,s=0,d=0,j=0):return {(a+s,b+d,k+j):v for (a,b,k),v in p.items() if a+s<=limit}
 def sm(p):return add(p,sh(p,j=1))
 W={(0,0,0):1};H={(0,1,0):1,(0,1,1):1};Z={(0,1,0):1}
 for r in w:
  if r:
   C=sh(sm(H),s=1,d=1)
   W,H,Z=add(W,C),add(sh(H,d=1,j=1),sh(sm(Z),d=1),sh(sm(C),d=1)),add(sh(Z,d=1),sh(C,d=1))
  else:
   C=sh(H,s=1)
   W,H,Z=add(W,C),add(W,sh(sm(C),d=1)),add(W,sh(C,d=1))
 return W
def main():
 start=time.monotonic();mode=sys.argv[1] if len(sys.argv)>1 else 'source';rng=Random(620);inputs=[];tests={};fail={}
 if mode=='source':
  pairs=[(b-k,b) for b in range(9,100) for k in [2,3,5,7,11] if k<b and gcd(k,b)==1]
  pairs += [(a,b) for b in range(3,40) for a in range(1,b) if gcd(a,b)==1]
  words=[(a,b,tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)) for a,b in pairs]
 else:
  words=[(None,None,tuple(int(rng.random()<p) for _ in range(n))) for n in [12,20,30,45,60] for p in [.1,.25,.5,.75,.9] for _ in range(10)]
 for a,b,w in words:
  F=transfer(w);M={(s,d-s,j):v for (s,d,j),v in F.items()};raw={}
  for (s,d,j),v in F.items():raw[s,j]=raw.get((s,j),0)+v
  for (s,e,j),v in M.items():
   if s>5:continue
   for direction in [0,1]:
    name='horizontal' if direction==0 else 'vertical'
    if name in fail:continue
    if a is not None:
     i=a+s-j
     if i<0 or any(b*(i+(t if direction==0 else 0))+a*(j+t*direction)<a*b or i+j+t>a+b-1 for t in range(3)):continue
    vals=[M.get((s+t,e,j+t*direction),0) for t in range(3)];tests[name]=tests.get(name,0)+1
    if vals[1]**2<vals[0]*vals[2]:
     rv=[raw.get((s+t,j+t*direction),0) for t in range(3)]
     fail[name]=dict(a=a,b=b,word=w,s=s,e=e,j=j,values=vals,gap=vals[1]**2-vals[0]*vals[2],raw_values=rv,raw_gap=rv[1]**2-rv[0]*rv[2])
  inputs.append([a,b,w]);rec=dict(status='finite exact experiment; layer failures are not root refutations',mode=mode,inputs=inputs,tests=tests,failures=fail,seconds=time.monotonic()-start)
  (O/f'aligned-{mode}.json').write_text(json.dumps(rec,indent=2)+'\n')
  if len(inputs)%10==0:print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=fail,seconds=rec['seconds'])),flush=True)
  if len(fail)==2 or time.monotonic()-start>135:break
 print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=fail,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
