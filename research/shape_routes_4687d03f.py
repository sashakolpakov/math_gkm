"""Machine-authored exact probes of stronger possible LC mechanisms."""
from pathlib import Path
import json,time
from math import comb
from lower_rows_1bb0aa1e import Hrows
O=Path('/Users/sasha/math_gkm/evidence/markov-4687d03f')
def main():
 t=time.monotonic();out={'status':'finite exact tests of auxiliary hypotheses, not a source refutation',
 'ulc_failures':[],'synchronized_failures':[],'interlacing_ratio_failures':[],
 'ulc_checks':0,'synchronized_checks':0,'interlacing_ratio_checks':0}
 for n in range(3,91):
  h=Hrows(n,min((n-1)//2,25));hp=Hrows(n+1,min((n-1)//2,25))
  for j in range(2,min((n-1)//2,25)+1):
   a=h[j];b=hp[j]
   for k in range(j-1):
    out['ulc_checks']+=1
    # LC of coefficient divided by C(j,k), stronger than raw LC.
    if a[k+1]**2*comb(j,k)*comb(j,k+2)<a[k]*a[k+2]*comb(j,k+1)**2 and len(out['ulc_failures'])<5:
     out['ulc_failures'].append([n,j,k,a[k:k+3]])
    out['synchronized_checks']+=2
    if (a[k]*b[k+2]>a[k+1]*b[k+1] or b[k]*a[k+2]>a[k+1]*b[k+1]) and len(out['synchronized_failures'])<5:
     out['synchronized_failures'].append([n,j,k,a[k:k+3],b[k:k+3]])
   for k in range(j):
    out['interlacing_ratio_checks']+=1
    if a[k]*b[k+1]<a[k+1]*b[k] and len(out['interlacing_ratio_failures'])<5:
     out['interlacing_ratio_failures'].append([n,j,k,a[k:k+2],b[k:k+2]])
 out['seconds']=time.monotonic()-t
 (O/'shape-routes.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
