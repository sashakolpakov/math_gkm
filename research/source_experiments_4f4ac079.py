"""Machine-authored exact finite source checks, not a universal proof."""
from pathlib import Path
import sys,json,time,hashlib
sys.path.insert(0,'evidence/markov')
from experiment_interior_f1e4fe3b import raw
from scan import initial,child
from kernel_experiments_4f4ac079 import K
O=Path('evidence/markov-4f4ac079')
def main():
 t=time.monotonic();out={'status':'finite exact computation only','source_comparisons':0,
 'coefficients':0,'zeros':0,'triples':0,'zero_triples':0,'failures':[],'examples':[]}
 for q in range(1,41):
  p=raw(2,2*q+1)
  if q<=16:
   f=initial
   for _ in range(q-1):f=child(f,False)
   f=child(f,True)
   assert f[1][0:2]==(2,2*q+1) and f[1][2]==p
   out['source_comparisons']+=1
  for i in range(3,25):
   for j in range(2*q+5):
    actual=p.get((i,j),0);val=K(i,j,2*q-j) if j<=2*q else 0
    out['coefficients']+=1;out['zeros']+=int(actual==0)
    if val!=actual:out['failures'].append(['coefficient',q,i,j,actual,val])
    v=[p.get((i,j+t),0) for t in range(3)]
    out['triples']+=1;out['zero_triples']+=int(0 in v)
    if v[1]**2<v[0]*v[2]:out['failures'].append(['triple',q,i,j,v])
  if q in [3,8,20,40]:out['examples'].append({'q':q,'i':5,'j':q,'values':[p.get((5,q+t),0) for t in range(3)]})
 out['bounds']={'q':[1,40],'i':[3,24],'j':'0..2*q+4, zero tails retained'}
 out['seconds']=time.monotonic()-t
 out['hashes']={p:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in
 ['research/source_experiments_4f4ac079.py','research/kernel_experiments_4f4ac079.py',
 'research/experiment_interior_f1e4fe3b.py','evidence/markov/scan.py']}
 (O/'source-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
