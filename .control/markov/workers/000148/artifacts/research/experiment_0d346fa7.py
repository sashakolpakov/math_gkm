"""Machine-authored finite source validation; not a proof of universal scope."""
from pathlib import Path
from math import comb
import sys,json,time,hashlib
sys.path.insert(0,'research')
sys.path.insert(0,'evidence/markov')
from experiment_interior_f1e4fe3b import raw
from scan import initial,child,polygon
from newton_probe_0d346fa7 import lower,upper
O=Path('evidence/markov-0d346fa7')
def main():
 start=time.monotonic()
 out={'status':'finite exact computation only','q_values':list(range(1,51))+[75,100],
 'source_recurrence_comparisons':0,'coefficient_checks':0,'zero_coefficients':0,
 'four_vertical_triples':0,'zero_four_triples':0,'all_direction_triples':0,
 'all_direction_zero_triples':0,'failures':[],'examples':[]}
 for q in out['q_values']:
  p=raw(2,2*q+1)
  if q<=16:
   f=initial
   for _ in range(q-1):f=child(f,False)
   f=child(f,True)
   assert f[1][0]==2 and f[1][1]==2*q+1 and f[1][2]==p
   out['source_recurrence_comparisons']+=1
  for i in range(2,min(20,2*q+4)):
   for j in range(2*q+4):
    if j<=q:c=lower(j,q-j,i)
    elif j<2*q:c=upper(2*q-j,j-q,i)
    else:continue
    a=p.get((i,j),0);out['coefficient_checks']+=1;out['zero_coefficients']+=int(a==0)
    assert a==c,(q,i,j,a,c)
  for j in range(2*q+5):
   v=[p.get((4,j+t),0) for t in range(3)]
   out['four_vertical_triples']+=1;out['zero_four_triples']+=int(0 in v)
   assert v[1]**2>=v[0]*v[2]
  if q<=30:
   for i in range(2*q+4):
    for j in range(2*q+4):
     for pts in [[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]:
      v=[p.get(k,0) for k in pts]
      out['all_direction_triples']+=1;out['all_direction_zero_triples']+=int(0 in v)
      assert v[1]**2>=v[0]*v[2]
  if q in [6,7,10,50,100]:
   v=[p.get((4,q+t),0) for t in range(3)]
   assert all(polygon(2,2*q+1,4,q+t) for t in range(3))
   out['examples'].append({'q':q,'i':4,'j':q,'values':v,'gap':v[1]**2-v[0]*v[2]})
  (O/'source-experiments-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 out['input_hashes']={n:hashlib.sha256(Path(n).read_bytes()).hexdigest() for n in ['research/experiment_0d346fa7.py','research/newton_probe_0d346fa7.py','research/experiment_interior_f1e4fe3b.py','evidence/markov/scan.py']}
 (O/'source-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
