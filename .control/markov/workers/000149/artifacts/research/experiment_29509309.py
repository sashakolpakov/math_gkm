"""Machine-authored finite exact validations; never a universal proof."""
from pathlib import Path
import sys,json,time,hashlib
sys.path.insert(0,'research');sys.path.insert(0,'evidence/markov')
from experiment_interior_f1e4fe3b import raw
from scan import initial,child,polygon
from newton_probe_0d346fa7 import lower,upper,C
O=Path('evidence/markov-29509309')
def main():
 start=time.monotonic()
 out={'status':'finite exact computation only','q_values':list(range(1,61))+[75,100],
      'source_comparisons':0,'coefficients':0,'triples':0,'zero_triples':0,'region_checks':0,'newton_checks':0,'failures':[],'examples':[]}
 for q in out['q_values']:
  p=raw(2,2*q+1)
  if q<=16:
   f=initial
   for _ in range(q-1):f=child(f,False)
   f=child(f,True)
   assert f[1][0:2]==(2,2*q+1) and f[1][2]==p
   out['source_comparisons']+=1
  for j in range(2*q+5):
   v=[p.get((8,j+t),0) for t in range(3)]
   out['triples']+=1;out['zero_triples']+=int(0 in v)
   assert v[1]**2>=v[0]*v[2],(q,j,v)
   if j<=q:
    assert lower(j,q-j,8)==v[0];out['coefficients']+=1
   elif j<2*q:
    assert upper(2*q-j,j-q,8)==v[0];out['coefficients']+=1
  if q in [10,11,25,60,100]:
   v=[p.get((8,q+t),0) for t in range(3)]
   assert all(polygon(2,2*q+1,8,q+t) for t in range(3))
   out['examples'].append({'q':q,'i':8,'j':q,'values':v,'gap':v[1]**2-v[0]*v[2]})
  (O/'source-experiments-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 for name in ['lower','upper','cross_one','cross_two']:
  data=json.loads((O/f'basis-{name}-i8.json').read_text())
  table=[(a,b,int(v)) for a,b,v in data['newton']]
  for x in range(41):
   for y in (range(31) if name in ['lower','upper'] else [0]):
    if name=='lower':g=lower(x+1,y+1,8)**2-lower(x,y+2,8)*lower(x+2,y,8)
    if name=='upper':g=upper(x+7,y+2,8)**2-upper(x+8,y+1,8)*upper(x+6,y+3,8)
    if name=='cross_one':g=lower(x+7,0,8)**2-lower(x+6,1,8)*upper(x+6,1,8)
    if name=='cross_two':g=upper(x+7,1,8)**2-lower(x+8,0,8)*upper(x+6,2,8)
    assert g>=0;out['region_checks']+=1
    assert g==sum(c*C(x,a)*C(y,b) for a,b,c in table)
    out['newton_checks']+=1
 out['seconds']=time.monotonic()-start
 out['hashes']={p:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in ['research/experiment_29509309.py','research/experiment_interior_f1e4fe3b.py','evidence/markov/scan.py','research/newton_probe_0d346fa7.py']}
 (O/'source-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out,indent=2))
if __name__=='__main__':main()
