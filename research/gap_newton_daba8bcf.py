"""Machine-authored exact coefficient probes in denominator slack, not proofs."""
from pathlib import Path
from math import comb
import json,time
from positive_rows_daba8bcf import positive
O=Path('/Users/sasha/math_gkm/evidence/markov-daba8bcf')
def diffs(a):
 b=[]
 while a:
  b.append(a[0]);a=[y-x for x,y in zip(a,a[1:])]
 return b
def main():
 start=time.monotonic();o={'status':'finite exact tests, not a universal coefficient-sign theorem',
 'gap_polynomials':0,'newton_coefficients':0,'negative':[],'cross_gap_polynomials':0,'cross_newton_coefficients':0,'cross_negative':[]}
 for j in range(2,36):
  # Adjacent gap degree is at most 2*k+2 in slack d=n-2*j-1.
  for k in range(j-1):
   deg=2*k+2
   vals=[positive(2*j+1+d,j,k+1)**2-positive(2*j+1+d,j,k)*positive(2*j+1+d,j,k+2) for d in range(deg+1)]
   co=diffs(vals);o['gap_polynomials']+=1;o['newton_coefficients']+=len(co)
   if min(co)<0:o['negative'].append([j,k,co])
  if j<=15:
   for i in range(j):
    for k in range(i,j):
     deg=i+k+1
     vals=[positive(2*j+1+d,j,i+1)*positive(2*j+1+d,j,k)-positive(2*j+1+d,j,i)*positive(2*j+1+d,j,k+1) for d in range(deg+1)]
     co=diffs(vals);o['cross_gap_polynomials']+=1;o['cross_newton_coefficients']+=len(co)
     if min(co)<0:o['cross_negative'].append([j,i,k,co])
 o['seconds']=time.monotonic()-start
 (O/'gap-newton.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
