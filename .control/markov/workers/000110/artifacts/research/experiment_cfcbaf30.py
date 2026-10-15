"""Machine-authored exact finite validation of corrected chart formulas. Not proof."""
from small_cycle_cfcbaf30 import *
from experiment_8833 import backward,source,path_for,polyguard
import time
start=time.monotonic();data=json.loads((O/'all-small-chart-candidates.json').read_text())['families']
counts=dict(cases=0,coefficients=0,chart_identities=0,triples=0,literal_coefficients=0,zeros=0);failures=[]
def ev(rows,n,j=0):return sum(F(v)*n**k[0]*j**k[2] for k,v in rows)
for row in data:
 c,r=row['c'],row['r'];p=numerator(c,r)
 for n in range(51):
  a=c*n+r;b=a+c;actual=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
  num={}
  for (k,z,l),v in p.items():num[z*n+l]=num.get(z*n+l,0)+v*n**k
  for j in range(a+12):
   v=sum(v*comb(7+j-k,7) for k,v in num.items() if k<=j)
   assert v==24*actual.get(j,0),(n,c,r,j,v,actual.get(j,0))
   counts['coefficients']+=1;counts['zeros']+=actual.get(j,0)==0
  if n>=7:
   covered=set()
   for z in row['intervals']:
    bb,L,U=z['b'],z['L'],z['U']
    for j in range(bb*n+L,(bb+1)*n+U+3):
     assert ev(z['formula'],n,j)==120960*actual.get(j,0),(n,c,r,'interval',bb,j)
     counts['chart_identities']+=1
    covered.update(range(bb*n+L,(bb+1)*n+U+1))
   for z in row['windows']:
    for t,q in enumerate(z['values'],z['start']):
     j=z['b']*n+t
     assert ev(q,n)==120960*actual.get(j,0),(n,c,r,'window',z['b'],j)
     counts['chart_identities']+=1
    covered.update(z['b']*n+t for t in range(z['start'],z['end']+1))
   assert set(range(a+3))<=covered,(n,c,r,'coverage')
  for j in range(a+3):
   i=a+2-j
   if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
    assert actual.get(j,0)*actual.get(j+2,0)<=actual.get(j+1,0)**2
    counts['triples']+=1
  if n<=6:
   aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(a+5):
    assert raw.get((a+4-j,j),0)==actual.get(j,0)
    counts['literal_coefficients']+=1
  counts['cases']+=1
  (O/'experiment-progress.json').write_text(json.dumps(dict(counts=counts,last=[n,c,r],seconds=time.monotonic()-start))+'\n')
(O/'experiments.json').write_text(json.dumps(dict(status='Finite exact observations only; no universal conclusion',counts=counts,inputs='All five small-cycle families, n=0..50; chart formulas n>=7; literal recurrence n<=6',failures=failures,seconds=time.monotonic()-start),indent=2)+'\n');print(counts)
