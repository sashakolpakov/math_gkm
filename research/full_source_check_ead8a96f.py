"""Machine-authored finite validation of truncated literal source recurrence.
This checks an experiment implementation, not the universal conjecture.
"""
from experiment_8833 import source,path_for
from third_seed_ead8a96f import source3,O
from vertical_second_9e104e0c import source2
from math import gcd
import json,time
def main():
 start=time.monotonic();fractions=positions=0
 for b in range(2,29):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   path=path_for(a,b)
   aa,bb,P=source(path);a3,b3,Q=source3(path);a2,b2,T=source2(path)
   assert (aa,bb)==(a3,b3)==(a2,b2)==(a,b)
   assert Q=={k:v for k,v in P.items() if k[0]<=3}
   assert T=={k:v for k,v in P.items() if k[0]<=2}
   for i in range(4):
    for j in range(a+b+3):
     assert P.get((i,j),0)==Q.get((i,j),0)
     positions+=1
   fractions+=1
 out=dict(status='Finite validation of experimental coefficient truncation only',fractions=fractions,coefficient_positions=positions,failures=[],seconds=time.monotonic()-start)
 (O/'full-source-comparison.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
