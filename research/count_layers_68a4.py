"""Machine-authored exact y=0 projection of degree-marked cut counts."""
from pathlib import Path
from math import gcd
import json,time,sys
O=Path('evidence/markov-68a44d34')
def add(*ps):
 q={}
 for p in ps:
  for k,v in p.items():q[k]=q.get(k,0)+v
 return q
def shift(p,s=0,d=0,limit=12):return {(a+s,b+d):v for (a,b),v in p.items() if a+s<=limit}
def count(w,limit=12):
 W={(0,0):1};H={(0,1):1}
 for b in w:
  C=shift(H,1,int(b),limit)
  W,H=add(W,C),add(shift(H,d=1,limit=limit),shift(C,d=1,limit=limit)) if b else add(W,shift(C,d=1,limit=limit))
 return W
def main():
 t=time.monotonic();inputs=[];tests=0;fail=None
 pairs=[(b-k,b) for b in range(31,181) for k in [1,2,3,4,5,7,11,17] if gcd(b,k)==1 and k<b]
 pairs += [(a,b) for b in range(31,81) for a in range(1,b) if gcd(a,b)==1]
 for a,b in pairs:
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
  F=count(w)
  for (s,d),v in F.items():
   if s+2>min(12,b-1):continue
   vals=[F.get((s+k,d),0) for k in range(3)];tests+=1
   if vals[1]**2<vals[0]*vals[2]:fail=dict(a=a,b=b,word=w,s=s,d=d,coefficients=vals,gap=vals[1]**2-vals[0]*vals[2]);break
  inputs.append([a,b])
  if len(inputs)%100==0 or fail:
   rec=dict(status='finite exact experiment',inputs=inputs,tests=tests,failure=fail,seconds=time.monotonic()-t)
   (O/'count-source.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(inputs=len(inputs),tests=tests,failure=fail,seconds=rec['seconds'])),flush=True)
  if fail or time.monotonic()-t>100:break
 rec=dict(status='finite exact experiment, cut counts <=12',inputs=inputs,tests=tests,failure=fail,seconds=time.monotonic()-t)
 (O/'count-source.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(inputs=len(inputs),tests=tests,failure=fail,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
