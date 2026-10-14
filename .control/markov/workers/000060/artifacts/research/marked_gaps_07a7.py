"""Machine-authored exact gap polynomials after z=1+t, all raw directions."""
from pathlib import Path
from math import gcd,comb
import json,time
from degree_transfer_07a7 import transfer
from cuts_fe01 import mul,value
O=Path('evidence/markov-07a7e5b7')
def main():
 t=time.monotonic();tests=0;sources=0;fails={};counts={}
 for b in range(2,19):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);T=transfer(w);sources+=1
   G={}
   for (s,d,j),v in T.items():
    p=G.setdefault((s,j),[])
    if len(p)<=d:p.extend([0]*(d+1-len(p)))
    p[d]=v
   def ing(s,j):return 0<=s<=b-1 and 0<=j<=a+s and (b-a)*j<=b*s
   for (s,j),l in G.items():
    for ds,dj in [(1,0),(1,1),(0,1)]:
     if not all(ing(s+h*ds,j+h*dj) for h in range(3)):continue
     m=G.get((s+ds,j+dj),[]);r=G.get((s+2*ds,j+2*dj),[])
     mm=mul(m,m);lr=mul(l,r);n=max(len(mm),len(lr));p=[value(mm,k)-value(lr,k) for k in range(n)]
     q=[sum(comb(k,h)*p[k] for k in range(h,n)) for h in range(n)]
     tests+=1;name=str((ds,dj));counts[name]=counts.get(name,0)+1
     if any(c<0 for c in q):fails.setdefault(name,dict(a=a,b=b,s=s,j=j,direction=[ds,dj],L=l,M=m,R=r,gap=p,shifted_gap=q,raw_gap=sum(p)))
 rec=dict(status='finite exact stronger marked-gap coefficient test only',bound=18,sources=sources,tests=tests,counts=counts,failures=fails,seconds=time.monotonic()-t)
 (O/'marked-gaps.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
