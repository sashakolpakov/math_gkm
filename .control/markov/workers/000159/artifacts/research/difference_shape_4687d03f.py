"""Machine-authored tests of a possible parameter-induction invariant."""
from pathlib import Path
import json,time
from lower_rows_1bb0aa1e import Hrows
O=Path('/Users/sasha/math_gkm/evidence/markov-4687d03f')
def main():
 t=time.monotonic();out={'status':'finite tests of an auxiliary induction invariant only',
 'differences':0,'difference_lc_checks':0,'synchronization_checks':0,
 'negative':[],'difference_lc_failures':[],'synchronization_failures':[],
 'sum_gap_failures':[]}
 for n in range(3,101):
  J=min((n-1)//2,30);h=Hrows(n,J);hp=Hrows(n+1,J)
  for j in range(1,J+1):
   a=h[j];b=hp[j];d=[y-x for x,y in zip(a,b)];out['differences']+=1
   if min(d)<0 and len(out['negative'])<5:out['negative'].append([n,j,d])
   for k in range(j-1):
    out['difference_lc_checks']+=1
    if d[k]*d[k+2]>d[k+1]**2 and len(out['difference_lc_failures'])<5:
     out['difference_lc_failures'].append([n,j,k,d[k:k+3]])
    out['synchronization_checks']+=2
    if (a[k]*d[k+2]>a[k+1]*d[k+1] or d[k]*a[k+2]>a[k+1]*d[k+1]) and len(out['synchronization_failures'])<5:
     out['synchronization_failures'].append([n,j,k,a[k:k+3],d[k:k+3]])
    if a[k]*d[k+2]+d[k]*a[k+2]>2*a[k+1]*d[k+1] and len(out['sum_gap_failures'])<5:
     out['sum_gap_failures'].append([n,j,k,a[k:k+3],d[k:k+3]])
 out['seconds']=time.monotonic()-t
 (O/'difference-shape.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
