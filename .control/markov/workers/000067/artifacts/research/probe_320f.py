"""Machine-authored exact experiments; no finite scan is a universal proof."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd,comb
from random import Random
import json,time,sys
O=Path('evidence/markov-320fe46f')
def main():
 mode=sys.argv[1];start=time.monotonic();rng=Random(320);inputs=[];counts={};fails={}
 pairs=[(a,b) for b in range(3,65) for a in range(1,b) if gcd(a,b)==1]
 rng.shuffle(pairs)
 for a,b in pairs:
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);limit=min(b-1,8)
  F=transfer(w,limit)
  if mode=='cross':
   P={}
   for (s,d,j),v in F.items():P.setdefault((s,j),{})[d-s]=v
   for s in range(limit-1):
    for j in range(a+s+1):
     for direction in [0,1]:
      name=['horizontal','vertical'][direction];i=a+s-j
      if any(b*(i+(1-direction)*t)+a*(j+direction*t)<a*b or i+j+t>a+b-1 for t in range(3)):continue
      ps=[P.get((s+t,j+direction*t),{}) for t in range(3)];G={}
      for d,v in ps[1].items():
       for e,u in ps[1].items():G[d+e]=G.get(d+e,0)+v*u
      for d,v in ps[0].items():
       for e,u in ps[2].items():G[d+e]=G.get(d+e,0)-v*u
      if not G:continue
      tail=0
      for k in range(max(G),min(G)-1,-1):
       tail+=G.get(k,0);counts[name]=counts.get(name,0)+1
       if tail<0 and name not in fails:
        rv=[sum(p.values()) for p in ps]
        fails[name]=dict(a=a,b=b,s=s,j=j,k=k,tail=tail,gaps=sorted(G.items()),raw=rv,raw_gap=rv[1]**2-rv[0]*rv[2])
  else:
   for s in range(1,min(limit,5)+1):
    ds=sorted({d for ss,d,j in F if ss==s})
    if not ds:continue
    for _ in range(15):
     l=rng.choice(ds);u=rng.choice([d for d in ds if d>=l]);m=u-l
     # Arbitrary nondecreasing weights, including separated jumps; no LC assumption.
     weights=[];v=1
     for d in range(m+1):
      if rng.randrange(3)==0:v*=rng.choice([2,10,1000])
      weights.append(v)
     vals=[sum(weights[d-l]*F.get((s,d,j),0) for d in range(l,u+1)) for j in range(a+s+1)]
     for j in range(a+s-1):
      if any(b*(a+s-j-t)+a*(j+t)<a*b for t in range(3)):continue
      name='onecut' if s==1 else 'highercut';counts[name]=counts.get(name,0)+1
      if vals[j+1]**2<vals[j]*vals[j+2] and name not in fails:
       fails[name]=dict(a=a,b=b,s=s,j=j,interval=[l,u],weights=weights,values=vals[j:j+3],gap=vals[j+1]**2-vals[j]*vals[j+2])
  inputs.append([a,b]);rec=dict(status='finite exact experiment only',mode=mode,inputs=inputs,checks=counts,failures=fails,seconds=time.monotonic()-start)
  (O/(mode+'.json')).write_text(json.dumps(rec,indent=2)+'\n')
  if len(inputs)%50==0:print(json.dumps(dict(inputs=len(inputs),checks=counts,failures=fails,seconds=rec['seconds'])),flush=True)
  if len(fails)==2 or time.monotonic()-start>75:break
 print(json.dumps(dict(inputs=len(inputs),checks=counts,failures=fails,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
