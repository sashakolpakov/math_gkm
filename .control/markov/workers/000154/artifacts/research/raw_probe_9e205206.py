"""Machine-authored finite independent check of the guarded raw binomial formula."""
from three_probe_9e205206 import *
from math import comb
def raw(n,i,j):
 if i==0:return int(j==n)
 if i+j>n:return 0
 return comb(n-j-1,i-1)*comb(i+j,j)
def main():
 t=time.monotonic();F=[one,b]
 for n in range(13):F.append(add(mul(s,F[-1]),neg(mul(v,F[-2]))))
 total=zero=0
 for n in range(15):
  for i in range(n+3):
   for j in range(n+3):
    val=raw(n,i,j);assert val==F[n].get((i,j),0);total+=1;zero+=int(val==0)
 count=0
 for q in range(1,13):
  x={(i,j):raw(q+1,i,j) for i in range(q+2) for j in range(q+2-i) if raw(q+1,i,j)}
  y={(i,j):raw(q,i,j) for i in range(q+1) for j in range(q+1-i) if raw(q,i,j)}
  for r in [False,True]:assert cube(x,y,r)==frame([False]*(q-1)+[True,r])[2];count+=1
 out=dict(status='finite exact experiment only',fibonacci_coefficient_checks=total,zeros=zero,source_formula_checks=count,q_max=12,seconds=time.monotonic()-t)
 (O/'raw-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
