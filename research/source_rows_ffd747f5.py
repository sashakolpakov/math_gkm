"""Machine-authored direct source-recurrence checks. Experiments are not proofs."""
from pathlib import Path
from math import comb
import json,time
from three_probe_9e205206 import frame
from lower_rows_1bb0aa1e import Hrows,mul
O=Path('/Users/sasha/math_gkm/evidence/markov-ffd747f5')
def main():
 t=time.monotonic();out={'status':'finite exact source recurrence experiments only','q_max':20,
 'sources':0,'rows':0,'coefficient_checks':0,'zero_coefficients':0,'horizontal_triples':0,
 'zero_triples':0,'failures':[],'small_fifth_rows':[]}
 for q in range(1,21):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert a==3 and n==3*q+(1 if r else 2)
   h=Hrows(n,q);out['sources']+=1
   for j in range(q+1):
    row=[0]*3+mul([comb(n-2*j-1,k) for k in range(n-2*j)],h[j]);out['rows']+=1
    for i in range(n+6):
     c=row[i] if i<len(row) else 0;v=p.get((i,j),0)
     out['coefficient_checks']+=1;out['zero_coefficients']+=int(v==0)
     if c!=v:out['failures'].append(['identity',q,r,i,j,c,v])
   for i in range(n+6):
    vals=[p.get((i+k,5),0) for k in range(3)];out['horizontal_triples']+=1
    out['zero_triples']+=int(0 in vals)
    if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['fifth_lc',q,r,i,vals])
   if q<=4:out['small_fifth_rows'].append({'q':q,'r':r,'n':n,'coefficients':[p.get((i,5),0) for i in range(12)]})
 out['seconds']=time.monotonic()-t
 (O/'source-row-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
