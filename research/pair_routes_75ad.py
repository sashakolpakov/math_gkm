"""Machine-authored 75ad68f9: exact restricted transport probes."""
from pathlib import Path
from math import gcd
import json,time
import transport_89ce as T
from aligned_probe_6d2c import transfer
O=Path('evidence/markov-75ad68f9')
def gap(F,s,j):
 ds=sorted({d for ss,d,k in F if ss==s});G={}
 for t,d in enumerate(ds):
  for e in ds[t:]:
   v=F.get((s,d,j+1),0)*F.get((s,e,j+1),0)
   if d==e:v-=F.get((s,d,j),0)*F.get((s,e,j+2),0)
   else:v=2*v-F.get((s,d,j),0)*F.get((s,e,j+2),0)-F.get((s,e,j),0)*F.get((s,d,j+2),0)
   if v:G[d,e]=v
 return G
def main():
 start=time.monotonic();modes={'sum':lambda x,y: x[0]<=y[0] and sum(x)==sum(y),'min':lambda x,y:x[0]==y[0] and sum(x)<=sum(y),'max':lambda x,y:x[0]<=y[0] and x[1]==y[1], 'coordinate':lambda x,y:x[0]<=y[0] and x[1]<=y[1]}
 failures={};checks={m:0 for m in modes};inputs=[]
 for b in range(3,40):
  for a in range(1,b):
   if gcd(a,b)>1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,min(b-1,6));inputs.append([a,b])
   for s in range(1,min(b-1,6)+1):
    J=max([j for ss,d,j in F if ss==s],default=0)
    for j in range(J-1):
     G=gap(F,s,j)
     for mode,order in modes.items():
      if mode in failures:continue
      T.dominates=order;c=T.certificate(G);checks[mode]+=1
      if not c['success']:
       failures[mode]=dict(a=a,b=b,s=s,j=j,G=[[x,v] for x,v in G.items()],certificate=c)
   if len(failures)==len(modes) or time.monotonic()-start>45:break
  if len(failures)==len(modes) or time.monotonic()-start>45:break
 rec=dict(status='finite exact experiment only',checks=checks,inputs=inputs,failures=failures,seconds=time.monotonic()-start)
 (O/'pair-routes.json').write_text(json.dumps(rec,indent=2));print(json.dumps(rec))
if __name__=='__main__':main()
