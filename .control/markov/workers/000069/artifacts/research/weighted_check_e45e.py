"""Machine-authored e45ef6ac. Exact formula and source checks; not a proof."""
from aligned_probe_6d2c import transfer
from transport_full_89ce import source
from pathlib import Path
from math import comb
import json,time
O=Path('evidence/markov-e45ef6ac')
def choose(n,k):return comb(n,k) if 0<=k<=n else 0
def conv(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def main():
 start=time.monotonic();inputs=[];formula_checks=0;inequalities=0;raw_checks=0
 for n in range(0,25):
  a,b=n+1,n+2;path,P=source(a,b);F=transfer((1,)*(n+1),n+1);raw={}
  for (ss,d,j),v in F.items():raw[a+ss-j,j]=raw.get((a+ss-j,j),0)+v
  for pt in set(P)|set(raw):assert P.get(pt,0)==raw.get(pt,0);raw_checks+=1
  tested=[]
  for s in range(n+1):
   N=n-s
   tests=[[choose(N,r) for r in range(N+1)],
     [2**r for r in range(N+1)],[2**(N-r) for r in range(N+1)],
     [(r+1)*(N-r+1) for r in range(N+1)],
     [int(N//3<=r<=2*N//3) for r in range(N+1)],
     [1]*(N+1)]
   for weights in tests:
    assert all(weights[r+1]**2>=weights[r]*weights[r+2] for r in range(N-1))
    active=[r for r,x in enumerate(weights) if x]
    assert not active or active==list(range(min(active),max(active)+1))
    vals=[sum(weights[r]*F.get((s+1,2*s+2+r,j),0) for r in range(N+1)) for j in range(n+s+5)]
    W=weights[::-1];nb=[choose(r+s,s) for r in range(N+1)];c=conv(nb,W)
    residual=[nb[q]*c[N-q] for q in range(N+1)]
    predicted=conv([choose(2*s+2,j) for j in range(2*s+3)],residual)
    for j in range(len(vals)):
     assert vals[j]==(predicted[j] if j<len(predicted) else 0);formula_checks+=1
    for j in range(len(vals)-2):assert vals[j+1]**2>=vals[j]*vals[j+2];inequalities+=1
    tested.append(dict(s=s,N=N,weights=weights))
  inputs.append(dict(a=a,b=b,path=path,tests=tested))
  rec=dict(status='exact finite check, not proof',inputs=inputs,formula_positions=formula_checks,weighted_inequalities=inequalities,raw_recurrence_positions=raw_checks,failures=[],seconds=time.monotonic()-start)
  (O/'weighted-formula.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
if __name__=='__main__':main()
