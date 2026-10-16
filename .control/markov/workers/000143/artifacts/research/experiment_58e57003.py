"""Machine-authored exact finite checks. No experiment is proof evidence."""
from pathlib import Path
from math import comb
import sys,json,time
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw,sources
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def core(j,i,h):return C(2*i-2-h,i)*(C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h))
def term(j,d,i,h):return C(2*d,h)*core(j,i,h) if i>=2 and 0<=h<=i-2 else 0
def val(j,d,i):return sum(term(j,d,i,h) for h in range(i-1))
t=time.monotonic();out={'status':'finite exact computation only; no root resolution',
 'source_comparisons':0,'coefficient_identities':0,'support_checks':0,'source_triples':0,'zero_triples':0,
 'scaled_identities':0,'local_mixed_checks':0,'midpoint_checks_j_ge_2':0,'failures':[]}
for path,(a,b,p) in sources(28):
 assert p==raw(a,b),(a,b)
 out['source_comparisons']+=1
for q in range(1,41):
 p=raw(2,2*q+1)
 for j in range(q+1):
  d=q-j
  vs=[val(j,d,i) for i in range(2*q+6)]
  for i,v in enumerate(vs):
   assert p.get((i,j),0)==v,(q,j,i)
   assert (v>0)==(2<=i<=j+2*d+2),(q,j,i)
   out['coefficient_identities']+=1;out['support_checks']+=1
  for i in range(len(vs)-2):
   a,b,c=vs[i:i+3]
   assert a*c<=b*b,(q,j,i)
   out['source_triples']+=1;out['zero_triples']+=int(0 in [a,b,c])
for j in range(31):
 for i in range(2,42):
  for h in range(i-1):
   if i<=j+h+2:
    assert (2*i-1-h)*core(j,i,h)==(2*j+3+h)*C(j+i,i)*C(j,i-2-h)
    out['scaled_identities']+=1
   if j>=2 and i<=j+h+1:
    assert core(j,i,h)*core(j,i+2,h+1)<=core(j,i+1,h)*core(j,i+1,h+1)
    out['local_mixed_checks']+=1
for j in range(2,26):
 for d in range(11):
  ts=[[term(j,d,i,h) for h in range(2*d+1)] for i in range(j+2*d+6)]
  for i in range(2,len(ts)-2):
   for h in range(2*d+1):
    for k in range(2*d+1):
     m=(h+k)//2
     assert ts[i][h]*ts[i+2][k]<=ts[i+1][m]*ts[i+1][h+k-m],(j,d,i,h,k)
     out['midpoint_checks_j_ge_2']+=1
out['midpoint_j1_obstruction']={'j':1,'d':1,'i':2,'h':0,'k':1,'lhs':50,'rhs':48,
 'source':'2/5','source_row':[0,0,5,16,17,6],
 'meaning':'The sufficient summand condition fails; source row LC does not fail.'}
out['seconds']=time.monotonic()-t
Path('evidence/markov-58e57003/experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
