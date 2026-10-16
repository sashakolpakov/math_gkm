"""Machine-authored source-range kernel test with complete failure counts."""
from pathlib import Path
import json,time
from kernel_probe_daba8bcf import K
from lower_rows_1bb0aa1e import mul
O=Path('/Users/sasha/math_gkm/evidence/markov-daba8bcf')
def main():
 start=time.monotonic();out={'status':'finite auxiliary criterion tests only','by_slack':{}}
 for mode in ['zero','half','source','double']:
  a={'checks':0,'negative_count':0,'examples':[]}
  for j in range(2,51):
   d={'zero':0,'half':j//2,'source':j,'double':2*j}[mode]
   for l in range(1,j):
    for r0 in range(l+1):
     ps=[[K(j,d,t,r) if r>=r0 else 0 for r in range(l+2)] for t in [l-1,l,l+1]]
     ga=mul(ps[1],ps[1]);gb=mul(ps[0],ps[2])
     for k,(x,y) in enumerate(zip(ga,gb)):
      a['checks']+=1
      if x<y:
       a['negative_count']+=1
       if len(a['examples'])<3:a['examples'].append([j,d,l,r0,k,x-y])
  out['by_slack'][mode]=a
 out['seconds']=time.monotonic()-start
 (O/'kernel-source.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
