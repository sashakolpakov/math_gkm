"""Machine-authored exact experiments; finite evidence, never a proof."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
from sparse_probe_96ada19b import frame,solve,force,fr
O=Path('/Users/sasha/math_gkm/evidence/markov-e9cdd527')
def l3(j):return F((j+1)*(j+2)*(j+3)*(j*j+4*j+5),30)
def l4(n,j):return F((j+1)*(j+2)*(j+3)*(j+4)*(7*(n-1)*(2*j*j+10*j+15)-j*(18*j*j+100*j+155)),2520)
def main():
 t=time.monotonic();out={'status':'finite exact experiment only','source_comparisons':0,'lower_comparisons':0,'lower_triples':0,'all_column4_triples':0,'zero_column4_triples':0,'outside_region_mismatches':[], 'failures':[]}
 for q in range(1,101):
  for r in [False,True]:
   n=3*q+(1 if r else 2);a=solve(q,r,4,n+4)
   if q<=16:
    aa,bb,p=frame([False]*(q-1)+[True,r]);assert (aa,bb)==(3,n)
    for (i,j),v in a.items():
     out['source_comparisons']+=1
     if v!=p.get((i,j),0):out['failures'].append(['source',q,r,i,j])
   for j in range(q+1):
    for i,f in [(3,l3(j)),(4,l4(n,j))]:
     out['lower_comparisons']+=1
     if a[i,j]!=f:out['failures'].append(['lower',q,r,i,j,a[i,j],str(f)])
    if j+2<=q:
     out['lower_triples']+=1
     if a[4,j]*a[4,j+2]>a[4,j+1]**2:out['failures'].append(['lower_lc',q,r,j])
   for j in range(n+3):
    z=[a[4,j+k] for k in range(3)];out['all_column4_triples']+=1
    out['zero_column4_triples']+=int(0 in z)
    if z[0]*z[2]>z[1]**2:out['failures'].append(['full_lc',q,r,j,z])
   for j in range(q+1,min(q+5,n+3)):
    if a[4,j]!=l4(n,j) and len(out['outside_region_mismatches'])<12:
     out['outside_region_mismatches'].append({'q':q,'r':r,'j':j,'raw':a[4,j],'candidate':str(l4(n,j)),'gap':str(a[4,j]-l4(n,j))})
 out['seconds']=time.monotonic()-t
 (O/'low-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
