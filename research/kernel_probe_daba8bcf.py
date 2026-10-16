"""Machine-authored exploration of a log-concavity-preserving kernel route.
Theorem hypotheses from primary literature are not assumed for this kernel.
"""
from pathlib import Path
from math import comb
import json,time
from lower_rows_1bb0aa1e import mul
O=Path('/Users/sasha/math_gkm/evidence/markov-daba8bcf')
def K(j,d,l,r):
 return comb(j-r+3,j-l+3)*comb(d+2*j-r-l+3,j-l) if r<=l else 0
def main():
 start=time.monotonic();out={'status':'finite exact auxiliary tests, not a source refutation or universal transform theorem',
 'truncated_gap_coefficients':0,'negative':[],'geometric_mixture_failures':[]}
 for j in range(2,26):
  for d in [0,j,2*j]:
   for l in range(1,j):
    for r0 in range(l+1):
     a=[K(j,d,l-1,r) if r>=r0 else 0 for r in range(l+2)]
     b=[K(j,d,l,r) if r>=r0 else 0 for r in range(l+2)]
     c=[K(j,d,l+1,r) if r>=r0 else 0 for r in range(l+2)]
     ga=mul(b,b);gb=mul(a,c)
     for k,(x,y) in enumerate(zip(ga,gb)):
      out['truncated_gap_coefficients']+=1
      if x<y and len(out['negative'])<20:out['negative'].append([j,d,l,r0,k,x-y])
 for j in range(2,101):
  for d in [0,j,2*j]:
   a=[sum(2**(j-s)*comb(s+3,k+3)*comb(d+s+k+3,k) for s in range(k,j+1)) for k in range(j+1)]
   for k in range(j-1):
    if a[k]*a[k+2]>a[k+1]**2 and len(out['geometric_mixture_failures'])<5:
     out['geometric_mixture_failures'].append({'j':j,'d':d,'k':k,'triple':a[k:k+3],
       'gap':a[k+1]**2-a[k]*a[k+2],
       'input':'weights f_s=2^(j-s) are positive and adjacent-LC with equality; these are not the source weights'})
 out['seconds']=time.monotonic()-start
 (O/'kernel-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
