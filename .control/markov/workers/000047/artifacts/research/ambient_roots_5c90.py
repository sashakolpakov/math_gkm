"""Machine-authored exact Sturm probe of sheared total-degree polynomials.
This tests evaluation in y, not extraction of an individual y coefficient.
"""
import json,pathlib,time,itertools
from aggregate_a3c5 import poly
from pell_roots_9a72 import sturm
out=pathlib.Path('evidence/markov-5c90b506')
def main():
 t=time.monotonic();ct=0;fail={}
 for n in range(11):
  for w in itertools.product([False,True],repeat=n):
   core=(False,)+tuple(x for r in w for x in ((False,True) if r else (False,)))
   # Core obtained from original A--w--B: expand(w) followed by A.
   core=tuple(x for r in w for x in ((False,True) if r else (False,)))+(False,)
   p=poly(core);a=sum(w)+1;N=n+1
   for y in [1,2,5]:
    f=[sum(c*y**j for (i,j),c in p.items() if i+j==a+s) for s in range(N+1)]
    result=sturm(f);ct+=1
    if not result['real']:
     fail=dict(word=list(w),y=y,coefficients=f,**result);break
   if fail:break
  rec=dict(status='finite exact Sturm experiments only',max_original_core_length=n,tests=ct,first_failure=fail,seconds=time.monotonic()-t)
  (out/'ambient-roots.json').write_text(json.dumps(rec,indent=2)+'\n')
  print(json.dumps(rec),flush=True)
  if fail:break
if __name__=='__main__':main()
