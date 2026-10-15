"""Machine-authored exact grading tests. No experimental result is a proof."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd,comb
from itertools import product
from random import Random
import time,json,sys
O=Path('evidence/markov-c4169865')
def check(w,limit,a=None,b=None):
 F=transfer(w,limit);fail={};counts={'layer':0,'tail':0,'shift':0,'raw':0};
 for s in range(limit+1):
  ds=sorted({d for ss,d,j in F if ss==s});js=sorted({j for ss,d,j in F if ss==s})
  if not ds or not js:continue
  for j in range(max(js)-1):
   if a is not None and any(b*(a+s-j-t)+a*(j+t)<a*b or a+s>b+a-1 or a+s-j-t<0 for t in range(3)):continue
   layers={d:[F.get((s,d,j+t),0) for t in range(3)] for d in ds}
   gaps=[0]*(2*max(ds)+1)
   for d,v in layers.items():
    counts['layer']+=1
    if v[1]**2<v[0]*v[2] and 'layer' not in fail:fail['layer']=dict(s=s,j=j,d=d,values=v)
    for e,u in layers.items():gaps[d+e]+=v[1]*u[1]-v[0]*u[2]
   tail=0
   for k in range(len(gaps)-1,-1,-1):
    tail+=gaps[k];counts['tail']+=1
    if tail<0 and 'tail' not in fail:fail['tail']=dict(s=s,j=j,k=k,value=tail,gaps=gaps,layers=layers)
   counts['raw']+=1
   if sum(gaps)<0 and 'raw' not in fail:fail['raw']=dict(s=s,j=j,value=sum(gaps),gaps=gaps,layers=layers)
   if 'tail' in fail:
    for k in range(len(gaps)):
     v=sum(comb(d,k)*gaps[d] for d in range(k,len(gaps)));counts['shift']+=1
     if v<0 and 'shift' not in fail:fail['shift']=dict(s=s,j=j,k=k,value=v,gaps=gaps)
 return counts,fail
def main():
 mode=sys.argv[1];rng=Random(416);start=time.monotonic();counts={};fail={};inputs=[]
 if mode=='words':words=((None,None,w) for n in range(1,13) for w in product([0,1],repeat=n))
 else:
  pairs=[(b-k,b) for b in range(25,151) for k in [2,3,5,7,11,17] if k<b and gcd(k,b)==1]
  rng.shuffle(pairs)
  words=((a,b,tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)) for a,b in pairs)
 for a,b,w in words:
  c,f=check(w,min(len(w),5 if mode=='source' else len(w)),a,b)
  for k,v in c.items():counts[k]=counts.get(k,0)+v
  for k,v in f.items():
   if k not in fail:fail[k]=dict(a=a,b=b,word=w,**v)
  inputs.append([a,b,w]);rec=dict(status='finite experiment only',mode=mode,counts=counts,failures=fail,inputs=inputs,seconds=time.monotonic()-start)
  (O/('tails-'+mode+'.json')).write_text(json.dumps(rec,indent=2)+'\n')
  if len(inputs)%50==0:print(json.dumps(dict(inputs=len(inputs),counts=counts,failures=list(fail),seconds=rec['seconds'])),flush=True)
  if len(fail)==4 or time.monotonic()-start>90:break
 print(json.dumps(dict(inputs=len(inputs),counts=counts,failures=fail,seconds=time.monotonic()-start)),flush=True)
if __name__=='__main__':main()
