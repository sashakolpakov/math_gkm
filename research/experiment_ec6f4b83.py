"""Machine-authored ec6f4b83. Exact finite checks, never universal proofs."""
from pathlib import Path
from math import comb
from functools import cache
import json,time,sys
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw,sources
from upper_probe_v2_2b34268b import S
O=Path('evidence/markov-ec6f4b83')
def main():
 start=time.monotonic()
 out={'status':'finite integer checks only','source_comparisons':0,'horizontal_triples':0,
      'zero_triples':0,'upper_formula_checks':0,'failures':[],'new_residual_examples':[]}
 for path,(a,b,p) in sources(30):
  assert raw(a,b)==p,(a,b)
  out['source_comparisons']+=1
 for q in range(1,81):
  p=raw(2,2*q+1)
  for j in range(2*q+5):
   for i in range(2*q+5-j):
    v=[p.get((i+r,j),0) for r in range(3)]
    out['horizontal_triples']+=1;out['zero_triples']+=int(0 in v)
    if v[0]*v[2]>v[1]**2:out['failures'].append(['horizontal',q,i,j,v])
    if q<j<2*q:
     a=sum(S(2*q-j,j-q,i,h) for h in range(i+1))
     out['upper_formula_checks']+=1
     if a!=v[0]:out['failures'].append(['formula',q,i,j,a,v[0]])
  if 6<=q<=12:out['new_residual_examples'].append({'a':2,'b':2*q+1,'i':3,'j':q+1,'values':[p.get((i,q+1),0) for i in [3,4,5]]})
  if q%10==0:(O/'experiment-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
