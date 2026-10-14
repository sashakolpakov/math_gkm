"""Machine-authored exact probes of candidate summation mechanisms; not proofs."""
import math,json,pathlib,time,random
from collections import defaultdict
out=pathlib.Path('evidence/markov-00b360ee')
def c(n,k):return math.comb(n,k) if 0<=k<=n else 0
def conv(a,b):
 d=defaultdict(int)
 for k,v in a.items():
  for l,w in b.items():d[k+l]+=v*w
 return d
def terms(a,j,s):
 return {q:v for q in range(a+1) if (v:=c(a-q,s)*c(s+q-1,q)*c(2*s,j-q))}
def base(a,s):return {q:v for q in range(a+1) if (v:=c(a-q,s)*c(s+q-1,q))}
def lower(s,i,j):return sum(c(2*s,k)*c(i+k-s,s)*c(s-1+j-k,s-1) for k in range(min(2*s,j)+1))
def main():
 start=time.monotonic();counts=defaultdict(int);fail={};rng=random.Random(360)
 for a in range(3,45):
  for s in range(2,a):
   for gap in range(1,min(s,a-s)+1):
    lo=conv(base(a,s-gap),base(a,s+gap));mid=conv(base(a,s),base(a,s))
    for k,v in lo.items():
     counts['base_strong']+=1
     if v>mid[k] and 'base_strong' not in fail:fail['base_strong']=[a,s,gap,k,v,mid[k]]
  for j in range(2*a+1):
   for s in range(2,a):
    rows=[terms(a,j,z) for z in [s-1,s,s+1]]
    lo=conv(rows[0],rows[2]);mid=conv(rows[1],rows[1])
    for k in lo:
     # Cumulative symmetric pair differences from the outside inward.
     accum=0
     for q in range(k//2+1):
      r=k-q
      v=rows[1].get(q,0)*rows[1].get(r,0)*(1 if q==r else 2)
      v-=rows[0].get(q,0)*rows[2].get(r,0)
      if q!=r:v-=rows[0].get(r,0)*rows[2].get(q,0)
      accum+=v;counts['fiber_partial']+=1
      if accum<0 and 'fiber_partial' not in fail:fail['fiber_partial']=[a,j,s,k,q,accum]
     counts['fiber_total']+=1
     if accum<0 and 'fiber_total' not in fail:fail['fiber_total']=[a,j,s,k,accum]
  result=dict(status='finite exact experiments only',a_max=a,counts=dict(counts),failures=fail,seconds=time.monotonic()-start)
  (out/'refinement-probe.json').write_text(json.dumps(result,indent=2)+'\n')
  if a%5==0:print(json.dumps(result),flush=True)
  if time.monotonic()-start>65:break
if __name__=='__main__':main()
