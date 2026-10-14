"""Machine-authored discrete midpoint tests for degree-group arrays."""
from pathlib import Path
from math import gcd
import json,time
from degree_groups_07a7 import grouped
from cuts_fe01 import value
O=Path('evidence/markov-07a7e5b7')
def main():
 t=time.monotonic();fails={};tests={};sources=0
 for b in range(2,25):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);G=grouped(w);sources+=1
   for s in range(b):
    gg={(d,j):c for (ss,d),p in G.items() if ss==s for j,c in enumerate(p)}
    for (d,j),c in gg.items():
     for dd,dj in [(1,0),(0,1),(1,1)]:
      name=str((dd,dj));l=gg.get((d-dd,j-dj),0);r=gg.get((d+dd,j+dj),0);tests[name]=tests.get(name,0)+1
      if c*c<l*r:fails.setdefault(name,dict(a=a,b=b,s=s,d=d,j=j,coefficients=[l,c,r]))
    for p,l in gg.items():
     for q,r in gg.items():
      if p>=q:continue
      for basis in ['dj','defect_j']:
       if basis in fails:continue
       u=p if basis=='dj' else (p[0]-p[1],p[1]);v=q if basis=='dj' else (q[0]-q[1],q[1])
       lo=((u[0]+v[0])//2,(u[1]+v[1])//2);hi=((u[0]+v[0]+1)//2,(u[1]+v[1]+1)//2)
       if basis=='defect_j':lo=(lo[0]+lo[1],lo[1]);hi=(hi[0]+hi[1],hi[1])
       L=gg.get(lo,0);H=gg.get(hi,0);tests[basis]=tests.get(basis,0)+1
       if l*r>L*H:fails[basis]=dict(a=a,b=b,s=s,p=p,q=q,lo=lo,hi=hi,coefficients=[l,r,L,H])
 rec=dict(status='finite exact tests of stronger discrete midpoint assertions only',sources=sources,tests=tests,failures=fails,seconds=time.monotonic()-t)
 (O/'joint-groups.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
