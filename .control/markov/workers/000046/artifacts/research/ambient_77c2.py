"""Exact source-word ambient-degree experiments. Machine-authored 77c26ca3.
No experiment is a universal proof. Imported modules have guarded main().
"""
import math,json,time,pathlib,random
from aggregate_a3c5 import core,poly
from type_refinement_a3c5 import refined,conv
out=pathlib.Path('evidence/markov-77c26ca3')
def main():
 t=time.monotonic();count=0;fails={};sources=[];refcount=0
 for b in range(2,51):
  for a in range(1,b):
   if math.gcd(a,b)!=1:continue
   w=core(a,b);p=poly(w);sources.append([a,b])
   for (i,j),v in p.items():
    if (i+2,j) not in p:continue
    s=i+j-a;N=b-1
    assert 0<=s and s+2<=N
    L,M,R=v,p.get((i+1,j),0),p[i+2,j]
    gap=(s+1)*(N-s-1)*M*M-(s+2)*(N-s)*L*R
    count+=1
    if gap<0:fails.setdefault('raw_ambient',dict(a=a,b=b,i=i,j=j,s=s,N=N,coefficients=[L,M,R],gap=gap))
   if b>24:continue
   pp=refined(w);rows={}
   for (i,j,k),v in pp.items():rows.setdefault((i,j),{})[k]=v
   for i,j in rows:
    if (i+2,j) not in rows:continue
    s=i+j-a;N=b-1
    L,M,R=[rows.get((i+h,j),{}) for h in range(3)]
    mm=conv(M,M);lr=conv(L,R)
    for k in mm.keys()|lr.keys():
     gap=(s+1)*(N-s-1)*mm[k]-(s+2)*(N-s)*lr[k];refcount+=1
     if gap<0:fails.setdefault('type_ambient',dict(a=a,b=b,i=i,j=j,s=s,N=N,k=k,coefficients=[L,M,R],gap=gap))
 rec=dict(status='finite exact experiment only',sources=sources,raw_tests=count,refined_tests=refcount,failures=fails,seconds=time.monotonic()-t)
 (out/'ambient-source.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
