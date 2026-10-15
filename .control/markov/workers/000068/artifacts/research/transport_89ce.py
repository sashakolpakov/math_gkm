"""Machine-authored exact pair-mass transport certificates; no universal proof."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd
from collections import deque
import json,time,sys
O=Path('evidence/markov-89ce11ad')
def dominates(x,y):
 return x[0]<=y[0] and sum(x)<=sum(y)
def certificate(G):
 neg=[(x,-v) for x,v in G.items() if v<0];pos=[(x,v) for x,v in G.items() if v>0]
 n=len(neg);m=len(pos);sink=n+m+1;adj=[[] for _ in range(sink+1)];edges=[]
 def edge(a,b,c):
  adj[a].append(len(edges));edges.append([a,b,c,0]);adj[b].append(len(edges));edges.append([b,a,0,0])
 total=sum(v for x,v in neg)
 for i,(x,v) in enumerate(neg):edge(0,1+i,v)
 for k,(y,v) in enumerate(pos):edge(1+n+k,sink,v)
 for i,(x,v) in enumerate(neg):
  for k,(y,u) in enumerate(pos):
   if dominates(x,y):edge(1+i,1+n+k,total)
 flow=0
 while True:
  prev=[None]*len(adj);prev[0]=-1;q=deque([0])
  while q and prev[sink] is None:
   a=q.popleft()
   for e in adj[a]:
    _,b,c,f=edges[e]
    if c>f and prev[b] is None:prev[b]=e;q.append(b)
  if prev[sink] is None:break
  inc=total;v=sink
  while v:
   e=prev[v];inc=min(inc,edges[e][2]-edges[e][3]);v=edges[e][0]
  v=sink
  while v:
   e=prev[v];edges[e][3]+=inc;edges[e^1][3]-=inc;v=edges[e][0]
  flow+=inc
 moves=[[neg[a-1][0],pos[b-1-n][0],f] for a,b,c,f in edges if 1<=a<=n and n+1<=b<sink and f>0]
 # Independent exact check of certificate equations and order.
 if flow==total:
  residual=dict(G)
  for x,y,v in moves:
   assert dominates(x,y) and v>0
   residual[x]+=v;residual[y]-=v
  assert all(v>=0 for v in residual.values())
 return dict(success=flow==total,negative_mass=total,flow=flow,moves=moves,unmatched=total-flow)
def main():
 start=time.monotonic();inputs=[];checks=0;nontrivial=0;fail=[];example=None
 pairs=[(a,b) for b in range(3,45) for a in range(1,b) if gcd(a,b)==1]
 for a,b in pairs:
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,min(b-1,7))
  for s in range(1,min(b-1,7)+1):
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
    if c['success'] and c['negative_mass'] and example is None:example=data
    if not c['success']:fail.append(data);break
   if fail:break
  inputs.append([a,b]);rec=dict(status='exact finite certificates only',inputs=inputs,checks=checks,nontrivial=nontrivial,failures=fail,example=example,seconds=time.monotonic()-start)
  (O/'transport.json').write_text(json.dumps(rec,indent=2)+'\n')
  if len(inputs)%50==0:print(json.dumps(dict(inputs=len(inputs),checks=checks,nontrivial=nontrivial,failures=len(fail),seconds=rec['seconds'])),flush=True)
  if fail or time.monotonic()-start>100:break
 print(json.dumps(dict(inputs=len(inputs),checks=checks,nontrivial=nontrivial,failures=fail,example=example,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
