"""Machine-authored 8f77f493. Exact finite checks; independent of proof admission."""
from pathlib import Path
import sys,json,time,hashlib
from functools import lru_cache
from math import comb
sys.path.insert(0,'evidence/markov')
from experiment_interior_f1e4fe3b import raw
from scan import initial,child
O=Path('evidence/markov-8f77f493')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
@lru_cache(None)
def K(a,b,j,r):
 return sum((1 if k==0 else 2)*C(a+j-k,a)*C(b+r-k,b) for k in range(min(j,r)+1))
def main():
 t=time.monotonic();out={'status':'finite exact checks, not proof','source_crosschecks':0,
 'coefficient_identities':0,'coefficient_zeros':0,'diagonal_triples':0,'zero_triples':0,
 'small_column_triples':0,'parameter_comparisons':0,'rectangular_identities':0,'failures':[]}
 for q in range(1,61):
  p=raw(2,2*q+1)
  if q<=20:
   f=initial
   for _ in range(q-1):f=child(f,False)
   f=child(f,True)
   assert f[1][:2]==(2,2*q+1) and f[1][2]==p
   out['source_crosschecks']+=1
  for i in range(2*q+5):
   for j in range(2*q+5):
    if i>=2:
     m=2*q-j-(i-2)
     predicted=K(i,i-2,j,m) if m>=0 else 0
     actual=p.get((i,j),0)
     out['coefficient_identities']+=1;out['coefficient_zeros']+=int(actual==0)
     if predicted!=actual:out['failures'].append(['coefficient',q,i,j,actual,predicted])
    v=[p.get((i,j+2),0),p.get((i+1,j+1),0),p.get((i+2,j),0)]
    out['diagonal_triples']+=1;out['zero_triples']+=int(0 in v)
    out['small_column_triples']+=int(i<=2)
    if v[1]**2<v[0]*v[2]:out['failures'].append(['diagonal',q,i,j,v])
  K.cache_clear()
 for a in range(13):
  for b in range(13):
   for j in range(15):
    for r in range(15):
     gaps=[K(a+1,b+1,j,r)**2-K(a,b,j,r)*K(a+2,b+2,j,r),
       K(a,b,j,r)*K(a+1,b+1,j+1,r)-K(a+1,b+1,j,r)*K(a,b,j+1,r)]
     out['parameter_comparisons']+=2
     if min(gaps)<0:out['failures'].append(['parameter',a,b,j,r,gaps])
     if a<3 and b<3 and j<6 and r<6:
      rhs=sum(K(a,b,x,y) for x in range(j+1) for y in range(r+1))
      out['rectangular_identities']+=1
      if rhs!=K(a+1,b+1,j,r):out['failures'].append(['rectangle',a,b,j,r])
   K.cache_clear()
 out['bounds']={'source_q':[1,60],'source_i_j':'0..2*q+4, no zero positions removed',
   'kernel_a_b':[0,12],'kernel_j_r':[0,14]}
 out['seconds']=time.monotonic()-t
 out['hashes']={p:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in
  ['research/experiments_8f77f493.py','research/experiment_interior_f1e4fe3b.py','evidence/markov/scan.py']}
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
