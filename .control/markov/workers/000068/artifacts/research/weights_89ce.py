"""Machine-authored exact increasing/log-concave degree-weight probes. Finite only."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd
from random import Random
import json,time,sys
O=Path('evidence/markov-89ce11ad')
def main():
 start=time.monotonic();rng=Random(890);inputs=[];checks=0;fail=[]
 mode=sys.argv[1] if len(sys.argv)>1 else 'source'
 pairs=[(a,b) for b in range(3,65) for a in range(1,b) if gcd(a,b)==1]
 rng.shuffle(pairs)
 for a,b in pairs:
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
  if mode=='arbitrary':w=tuple(rng.randrange(2) for _ in w)
  F=transfer(w,min(b-1,9))
  for s in range(2,min(b-1,9)+1):
   ds=sorted({d for ss,d,j in F if ss==s})
   if not ds:continue
   D=max(ds);J=max(j for ss,d,j in F if ss==s)
   tests=[]
   for _ in range(25):
    ratios=sorted([rng.choice([1,1,1,2,3,10,100]) for d in range(D)],reverse=True)
    weights=[1]
    for r in ratios:weights.append(weights[-1]*r)
    tests.append(weights)
   for z in [1,2,10]:tests.append([z**d for d in range(D+1)])
   for weights in tests:
    assert all(weights[d]<=weights[d+1] for d in range(D))
    assert all(weights[d+1]**2>=weights[d]*weights[d+2] for d in range(D-1))
    vals=[sum(weights[d]*F.get((s,d,j),0) for d in ds) for j in range(J+1)]
    for j in range(J-1):
     checks+=1
     if vals[j+1]**2<vals[j]*vals[j+2]:
      raw=[sum(F.get((s,d,j+t),0) for d in ds) for t in range(3)]
      fail.append(dict(a=a,b=b,word=w,s=s,j=j,weights=weights,values=vals[j:j+3],gap=vals[j+1]**2-vals[j]*vals[j+2],raw=raw,raw_gap=raw[1]**2-raw[0]*raw[2],layers={str(d):[F.get((s,d,j+t),0) for t in range(3)] for d in ds}))
      break
    if fail:break
   if fail:break
  inputs.append([a,b,w]);rec=dict(mode=mode,status='finite experiment, not proof',inputs=inputs,checks=checks,failures=fail,seconds=time.monotonic()-start)
  (O/('weights-'+mode+'.json')).write_text(json.dumps(rec,indent=2)+'\n')
  if len(inputs)%50==0:print(json.dumps(dict(inputs=len(inputs),checks=checks,failures=fail,seconds=rec['seconds'])),flush=True)
  if fail or time.monotonic()-start>70:break
 print(json.dumps(dict(inputs=len(inputs),checks=checks,failures=fail,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
