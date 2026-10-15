"""Machine-authored finite exact source comparisons; never proof premises."""
from pathlib import Path
from math import comb,gcd
from fractions import Fraction as F
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f2da221d'
def main():
 start=time.monotonic()
 parts=json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['parts']
 inputs=[(n,c,r) for c in range(2,21) for r in range(1,c) if gcd(c,r)==1 for n in [0,1,2,3,4,5,6,8,13,21]]
 inputs += [(n,c,r) for n in [32,64,100,127] for c,r in [(5,2),(7,3),(11,7)]]
 counts=dict(initial_coefficients=0,first_shift_coefficients=0,initial_triples=0,first_shift_triples=0,literal_coefficients=0,small_cycle_initial_coefficients=0)
 for n,c,r in inputs:
  a=n*c+r;b=a+c
  w=[(k+1)*a//b-k*a//b for k in range(1,b)]
  raw=backward(w,4)
  lowparts=[sum(F(v)*c**k[2]*a**k[3] for k,v in p) for p in parts]
  low=lambda j:sum(lowparts[k]*comb(7+j-k,7) for k in range(min(j,12)+1))
  for j in range(n+2):
   assert low(j)==24*raw.get(j,0),(n,c,r,j,'initial')
   counts['initial_coefficients']+=1
   if c<5:counts['small_cycle_initial_coefficients']+=1
  k=a+c-2*n-5;delta=16*(c-r)*k*(k-1)*(k-2)
  if c>=5:
   assert low(n+2)+delta==24*raw.get(n+2,0),(n,c,r,'first_shift')
   counts['first_shift_coefficients']+=1
  for j in range(n+1):
   i=a+2-j
   if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
    assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2,(n,c,r,j,'lc')
    counts['first_shift_triples' if j==n else 'initial_triples']+=1
  if b<=40:
   aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(a+5):
    assert p.get((a+4-j,j),0)==raw.get(j,0),(a,b,j,'literal')
    counts['literal_coefficients']+=1
 result=dict(status='Finite exact experiments, not universal proofs',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start,method='Independent lower-cut matrix evaluation; compared with literal protected source recurrence when b<=40. All coefficients and zeros retained.')
 (O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n')
 print({k:v for k,v in result.items() if k!='inputs'},flush=True)
if __name__=='__main__':main()
