"""Machine-authored exact aggregation probes, request 6d34. Experiments only."""
from pathlib import Path
from random import Random
from math import gcd,comb
import json,time,sys
from degree_limited_9c20 import limited
O=Path('evidence/markov-6d34d54a')
def main():
 mode=sys.argv[1];rng=Random(634);start=time.monotonic();tests=0;inputs=[];failure=None
 if mode=='source':
  pairs=[(b-k,b) for b in range(42,101) for k in [1,2,3,5,8,13] if b>k and gcd(b,k)==1]
  pairs += [(a,b) for b in range(41,76) for a in range(1,b) if gcd(a,b)==1]
  words=[(a,b,tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)) for a,b in pairs]
 else:
  words=[]
  for n in [25,40,60,80,120]:
   for p in [.05,.1,.25,.5,.75,.9,.95]:
    for _ in range(6):words.append((0,0,tuple(int(rng.random()<p) for _ in range(n))))
  words += [(0,0,(1,)*a+(0,)*b+(1,)*c) for a in [1,3,8,16] for b in [1,2,5,20] for c in [1,3,8,16]]
 for a,b,w in words:
  F=limited(w);G={}
  for (s,d,j),v in F.items():G.setdefault(s,{}).setdefault(d,{})[j]=v
  for s,gs in G.items():
   ds=sorted(gs)
   for u,lo in enumerate(ds):
    acc={}
    for hi in (ds[u:] if mode=='source' else [lo]):
     for j,c in gs[hi].items():acc[j]=acc.get(j,0)+c
     for j in range(1,max(acc,default=0)):
      tests+=1;gap=acc.get(j,0)**2-acc.get(j-1,0)*acc.get(j+1,0)
      if gap<0:
       failure=dict(a=a,b=b,word=w,s=s,lo=lo,hi=hi,j=j,coefficients=[acc.get(k,0) for k in range(max(acc)+1)],gap=gap);break
     if failure:break
    if failure:break
   if failure:break
  inputs.append(dict(a=a,b=b,word=w))
  rec=dict(status='finite exact computation, cuts <=5; not proof',mode=mode,seed=634,inputs=inputs,tests=tests,failure=failure,seconds=time.monotonic()-start)
  if len(inputs)%10==0 or failure:
   (O/f'aggregation-{mode}.json').write_text(json.dumps(rec,indent=2)+'\n')
   print(json.dumps(dict(mode=mode,words=len(inputs),tests=tests,failure=failure,seconds=rec['seconds'])),flush=True)
  if failure or time.monotonic()-start>140:break
 (O/f'aggregation-{mode}.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps(dict(mode=mode,words=len(inputs),tests=tests,failure=failure,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
