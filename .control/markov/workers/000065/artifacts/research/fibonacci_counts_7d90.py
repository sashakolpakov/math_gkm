"""Machine-authored exact independent mask and formula checks; finite evidence."""
from pathlib import Path
from math import comb
from itertools import product
from aligned_probe_6d2c import transfer
import json,time
O=Path('evidence/markov-7d905904')
def choose(n,k):return comb(n,k) if 0<=k<=n else 0
def count(N,s,d):
 if s==N:return int(d==N+1)
 if s>N:return 0
 return choose(N-s-1,s-d)*choose(s+1,d) if d<=s else 0
def degree(bs):
 charge=1;total=0
 for k,b in enumerate(bs):
  letter=k==len(bs)-1
  if b:total+=charge+int(letter);charge=1
  else:charge=charge+1 if letter else 0
 return total
def main():
 start=time.monotonic();checks=0;masks=0;intervals=0;fail=[]
 for N in range(1,15):
  hist={}
  for bs in product([0,1],repeat=N):
   s=sum(bs);d=degree(bs);zero_runs=sum(b==0 and (k==0 or bs[k-1]==1) for k,b in enumerate(bs))
   if d!=s+1-zero_runs:fail.append(['zero_runs',N,bs,d,zero_runs])
   hist[s,d]=hist.get((s,d),0)+1;masks+=1
  for s in range(N+1):
   for d in range(N+2):
    if hist.get((s,d),0)!=count(N,s,d):fail.append(['count',N,s,d])
 for N in range(1,41):
  F=transfer((0,)*(N-1)+(1,),N)
  for s in range(N+1):
   for d in range(N+2):
    for j in range(N+2):
     checks+=1
     if F.get((s,d,j),0)!=count(N,s,d)*choose(d,j):fail.append(['coeff',N,s,d,j])
   for l in range(N+2):
    vals=[0]*(N+2)
    for r in range(l,N+2):
     vals=[v+count(N,s,r)*choose(r,j) for j,v in enumerate(vals)]
     for j in range(N):
      intervals+=1
      if vals[j+1]**2<vals[j]*vals[j+2]:fail.append(['interval',N,s,l,r,j,vals[j:j+3]])
  rec=dict(status='finite exact experiment, not universal proof',N_completed=N,masks=masks,coefficient_checks=checks,interval_inequalities=intervals,failures=fail,seconds=time.monotonic()-start)
  (O/'fibonacci-counts.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps(rec))
if __name__=='__main__':main()
