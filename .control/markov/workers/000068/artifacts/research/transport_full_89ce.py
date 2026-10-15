"""Machine-authored exact full-cut transport and independent raw validation."""
from transport_89ce import certificate,transfer
from pathlib import Path
from math import gcd
import json,time,hashlib,sys
O=Path('evidence/markov-89ce11ad')
def mul(p,q):
 r={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():r[i+k,j+l]=r.get((i+k,j+l),0)+a*b
 return r
def sub(p,q):
 r=dict(p)
 for k,c in q.items():r[k]=r.get(k,0)-c
 return {k:c for k,c in r.items() if c}
def source(a,b):
 S={(0,0):1,(1,0):1,(0,1):1}
 lo=(0,1,{(0,0):1});mid=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1});path=[]
 while mid[:2]!=(a,b):
  right=a*mid[1]>b*mid[0];path.append(right)
  if right:
   nxt=(mid[0]+hi[0],mid[1]+hi[1],sub(mul(mul(S,hi[2]),mid[2]),mul({(hi[0],hi[1]):1},lo[2])))
   lo,mid=mid,nxt
  else:
   nxt=(lo[0]+mid[0],lo[1]+mid[1],sub(mul(mul(S,lo[2]),mid[2]),mul({(lo[0],lo[1]):1},hi[2])))
   hi,mid=mid,nxt
 return path,mid[2]
def main():
 mode=sys.argv[1] if len(sys.argv)>1 else 'full';start=time.monotonic();inputs=[];checks=0;rawchecks=0;nontrivial=0;fail=[];digests=[]
 if mode=='full':pairs=[(a,b) for b in range(3,29) for a in range(1,b) if gcd(a,b)==1]
 else:pairs=[(a,b) for b in [31,37,41,47,53,61,71] for a in [2,3,5,b//2-1,b//2,b-3,b-2,b-1] if gcd(a,b)==1]
 for a,b in pairs:
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,b-1 if mode=='full' else 6)
  if mode=='full':
   path,P=source(a,b);raw={}
   for (s,d,j),v in F.items():raw[a+s-j,j]=raw.get((a+s-j,j),0)+v
   for pt in set(P)|set(raw):assert P.get(pt,0)==raw.get(pt,0);rawchecks+=1
  for s in range(1,(b-1 if mode=='full' else 6)+1):
   ds=sorted({d for ss,d,j in F if ss==s});J=max([j for ss,d,j in F if ss==s],default=0)
   for j in range(J-1):
    G={}
    for t,d in enumerate(ds):
     for e in ds[t:]:
      if d==e:v=F.get((s,d,j+1),0)**2-F.get((s,d,j),0)*F.get((s,d,j+2),0)
      else:v=2*F.get((s,d,j+1),0)*F.get((s,e,j+1),0)-F.get((s,d,j),0)*F.get((s,e,j+2),0)-F.get((s,e,j),0)*F.get((s,d,j+2),0)
      if v:G[d,e]=v
    c=certificate(G);checks+=1;nontrivial+=c['negative_mass']>0
    data=dict(a=a,b=b,s=s,j=j,coefficients=[[x,v] for x,v in G.items()],certificate=c)
    digests.append([a,b,s,j,hashlib.sha256(json.dumps(data,sort_keys=True).encode()).hexdigest()])
    if not c['success']:fail.append(data);break
   if fail:break
  inputs.append([a,b]);rec=dict(status='finite exact transport checks, no universal theorem',mode=mode,inputs=inputs,checks=checks,raw_positions=rawchecks,nontrivial=nontrivial,failures=fail,certificate_hashes=digests,seconds=time.monotonic()-start)
  (O/('transport-'+mode+'.json')).write_text(json.dumps(rec,indent=2)+'\n')
  if len(inputs)%20==0:print(json.dumps(dict(inputs=len(inputs),checks=checks,raw_positions=rawchecks,nontrivial=nontrivial,failures=len(fail),seconds=rec['seconds'])),flush=True)
  if fail or time.monotonic()-start>100:break
 print(json.dumps(dict(inputs=len(inputs),checks=checks,raw_positions=rawchecks,nontrivial=nontrivial,failures=fail,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
