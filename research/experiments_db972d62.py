"""Machine-authored db972d62. Finite exact tests, separate from Lean proofs."""
from pathlib import Path
import sys,json,time,hashlib
from functools import lru_cache
sys.path.insert(0,'evidence/markov')
from experiment_interior_f1e4fe3b import raw
from scan import initial,child
from probe_db972d62 import C,T
O=Path('evidence/markov-db972d62')
@lru_cache(None)
def K(i,j,m): return sum(T(i,j,m,k) for k in range(min(j,m)+1))
def main():
 start=time.monotonic();out={'status':'finite exact computation only','source_comparisons':0,
 'coefficients':0,'zeros':0,'vertical_triples':0,'vertical_zero_triples':0,
 'diagonal_triples':0,'diagonal_zero_triples':0,'failures':[],'examples':[]}
 for q in range(1,61):
  p=raw(2,2*q+1)
  if q<=20:
   f=initial
   for _ in range(q-1): f=child(f,False)
   f=child(f,True)
   assert f[1][:2]==(2,2*q+1) and f[1][2]==p
   out['source_comparisons']+=1
  for i in range(33):
   for j in range(2*q+5):
    actual=p.get((i,j),0)
    if i>=3:
     val=K(i,j,2*q-j) if j<=2*q else 0
     out['coefficients']+=1;out['zeros']+=int(actual==0)
     if val!=actual:out['failures'].append(['coefficient',q,i,j,actual,val])
    v=[p.get((i,j+t),0) for t in range(3)]
    out['vertical_triples']+=1;out['vertical_zero_triples']+=int(0 in v)
    if v[1]**2<v[0]*v[2]:out['failures'].append(['vertical',q,i,j,v])
    v=[p.get((i,j+2),0),p.get((i+1,j+1),0),p.get((i+2,j),0)]
    out['diagonal_triples']+=1;out['diagonal_zero_triples']+=int(0 in v)
    if v[1]**2<v[0]*v[2]:out['failures'].append(['diagonal',q,i,j,v])
  if q in [2,10,30,60]:out['examples'].append({'q':q,'i':9,'j':q,'values':[p.get((9,q+t),0) for t in range(3)]})
  K.cache_clear()
 out['source_bounds']={'q':[1,60],'i':[0,32],'j':'0..2*q+4; zero tails retained'}
 out['shape_tests']=0;out['kernel_diagonal_tests']=0
 for i in range(3,33):
  for j in range(38):
   for m in range(38):
    gaps=[K(i,j+1,m)**2-K(i,j,m)*K(i,j+2,m),
     K(i,j,m+1)**2-K(i,j,m)*K(i,j,m+2),
     K(i,j,m)*K(i,j+1,m+1)-K(i,j+1,m)*K(i,j,m+1)]
    out['shape_tests']+=3
    if min(gaps)<0:out['failures'].append(['shape',i,j,m,gaps])
    gap=K(i+1,j+1,m+1)**2-K(i,j+2,m)*K(i+2,j,m+2)
    out['kernel_diagonal_tests']+=1
    if gap<0:out['failures'].append(['kernel-diagonal',i,j,m,gap])
  K.cache_clear()
 out['kernel_bounds']={'i':[3,32],'j_m':[0,37],'diagonal_parity':'both parities checked; only even j+m+2 is source-linked'}
 out['seconds']=time.monotonic()-start
 out['hashes']={p:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in
 ['research/experiments_db972d62.py','research/probe_db972d62.py','research/experiment_interior_f1e4fe3b.py','evidence/markov/scan.py']}
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
