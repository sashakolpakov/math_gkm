"""Machine-authored exact finite checks for af6200bf; experiments are not proofs."""
from pathlib import Path
from math import comb
import sys,json,time
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw,sources
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def K(j,i,h):return C(2*i-2-h,i)*(C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h))
def T(j,d,i,h):return C(2*d,h)*K(j,i,h) if i>=2 and 0<=h<=i-2 else 0
def V(j,d,i):return sum(T(j,d,i,h) for h in range(2*d+1))
t=time.monotonic()
out=dict(status='exact finite experiments, not proofs',source_comparisons=0,coefficient_identities=0,
 source_triples=0,zero_triples=0,shifted_comparisons=0,shifted_zero_comparisons=0,
 horizontal_core_comparisons=0,diagonal_core_comparisons=0,failures=[])
for path,(a,b,p) in sources(28):
 assert p==raw(a,b),(a,b)
 out['source_comparisons']+=1
for q in range(1,51):
 p=raw(2,2*q+1)
 for j in range(q+1):
  d=q-j
  vs=[V(j,d,i) for i in range(2*q+6)]
  for i,v in enumerate(vs):
   assert v==p.get((i,j),0),(q,j,i)
   out['coefficient_identities']+=1
  for i in range(len(vs)-2):
   a,b,c=vs[i:i+3]
   assert a*c<=b*b,(q,j,i)
   out['source_triples']+=1;out['zero_triples']+=int(0 in [a,b,c])
for j in range(2,26):
 for d in range(11):
  ts=[[T(j,d,i,h) for h in range(2*d+3)] for i in range(j+2*d+7)]
  for i in range(len(ts)-2):
   for h in range(2*d+2):
    for k in range(2*d+2):
     a=ts[i][h]*ts[i+2][k]
     b=ts[i+1][min(h+1,k)]*ts[i+1][max(h+1,k)-1]
     assert a<=b,(j,d,i,h,k,a,b)
     out['shifted_comparisons']+=1
     out['shifted_zero_comparisons']+=int(a==0 or b==0)
for j in range(25):
 for i in range(2,30):
  for h in range(i-1):
   for k in range(i+1):
    if k<=h and i<=j+k:
     assert K(j,i,h)*K(j,i+2,k)<=K(j,i+1,h)*K(j,i+1,k)
     out['horizontal_core_comparisons']+=1
    if h+2<=k<=i and i<=j+h+2:
     assert K(j,i,h)*K(j,i+2,k)<=K(j,i+1,h+1)*K(j,i+1,k-1)
     out['diagonal_core_comparisons']+=1
out['small_j_obstruction']={'j':1,'d':1,'i':2,'h':0,'k':1,
 'lhs':T(1,1,2,0)*T(1,1,4,1),'rhs':T(1,1,3,1)*T(1,1,3,0),
 'meaning':'shifted sufficient condition fails; j=1 source LC uses an inherited theorem'}
out['seconds']=time.monotonic()-t
Path('evidence/markov-af6200bf/experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
