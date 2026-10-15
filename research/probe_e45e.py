"""Machine-authored e45ef6ac. Exact finite transport tests; not proofs."""
from transport_89ce import certificate, transfer
import transport_89ce as T
from pathlib import Path
from random import Random
import json, time, sys, hashlib
O=Path('evidence/markov-e45ef6ac')
def gaps(F,s,j):
 ds=sorted({d for ss,d,k in F if ss==s});G={}
 for t,d in enumerate(ds):
  for e in ds[t:]:
   a,b,c=(F.get((s,d,j+k),0) for k in range(3))
   x,y,z=(F.get((s,e,j+k),0) for k in range(3))
   v=b*b-a*c if d==e else 2*b*y-a*z-x*c
   if v:G[d,e]=v
 return G
def main():
 mode=sys.argv[1];rng=Random(45069);start=time.monotonic();records=[];checks=0;nontrivial=0;failure=None
 if mode=='equal':
  T.dominates=lambda x,y: x[0]<=y[0] and sum(x)==sum(y)
  inputs=[(n,None,(1,)*n) for n in range(2,45)]
 else:
  inputs=[]
  for n in range(0,6):
   for length in [2,3,5,8,13,21]:
    for _ in range(10):
     v=tuple(rng.randrange(2) for _ in range(length))
     w=(1,)*n+(0,)+sum(((1,)*(n+r)+(0,) for r in v),())+(1,)*(n+1)
     inputs.append((n,v,w))
  rng.shuffle(inputs)
 for n,v,w in inputs:
  F=transfer(w,min(len(w),7));digest=hashlib.sha256()
  for s in range(1,min(len(w),7)+1):
   J=max((j for ss,d,j in F if ss==s),default=0)
   for j in range(J-1):
    G=gaps(F,s,j);c=certificate(G);checks+=1;nontrivial+=bool(c['negative_mass'])
    digest.update(json.dumps([s,j,list(G.items()),c],sort_keys=True).encode())
    if not c['success']:
     raw=[sum(v for (ss,d,k),v in F.items() if ss==s and k==j+t) for t in range(3)]
     failure=dict(n=n,interior=v,word=w,s=s,j=j,gap_array=list(G.items()),certificate=c,raw=raw,raw_gap=raw[1]**2-raw[0]*raw[2]);break
   if failure:break
  records.append(dict(n=n,interior=v,word=w,certificate_digest=digest.hexdigest()))
  rec=dict(mode=mode,status='finite exact computation only; arbitrary run words are not asserted to be source words',inputs=records,checks=checks,nontrivial=nontrivial,failure=failure,seconds=time.monotonic()-start)
  (O/f'probe-{mode}.json').write_text(json.dumps(rec,indent=2)+'\n')
  if failure or time.monotonic()-start>90:break
 print(json.dumps(dict(inputs=len(records),checks=checks,nontrivial=nontrivial,failure=failure,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
