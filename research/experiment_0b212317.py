"""Machine-authored exact finite experiment. This is not proof evidence."""
from pathlib import Path
from fractions import Fraction as F
from math import comb,gcd
import json,time
from experiment_8833 import backward
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0b212317'
d=json.loads((O/'compact-low-candidates.json').read_text())
def ev(poly,c,h,j=0):
 return sum(F(v)*c**k[2]*h**k[3]*j**k[4] for k,v in poly)
def main():
 start=time.monotonic();cases=[];coeff=shapes=triples=first_shift=0;examples=[]
 inputs=[(n,c,r) for c in range(5,18) for r in range(1,c) if gcd(c,r)==1 for n in [0,1,2,4,7,8,12,20]]
 inputs += [(n,c,r) for n in [32,64,100,127] for c,r in [(5,2),(7,3),(11,7)]]
 for n,c,r in inputs:
  a=c*n+r;b=a+c;word=[(k+1)*a//b-k*a//b for k in range(1,b)]
  raw=backward(word,4);parts=[ev(p,c,a) for p in d['parts']]
  vals=[]
  for j in range(n+2):
   v=sum(parts[k]*comb(7+j-k,7) for k in range(min(j,12)+1))
   assert v==24*raw.get(j,0),(n,c,r,j,v,raw.get(j,0))
   vals.append(v);coeff+=1
   if j>=5:
    assert ev(d['shape'],c,a,j)==315*v
    shapes+=1
  j=n+2;v=sum(parts[k]*comb(7+j-k,7) for k in range(min(j,12)+1))
  if v!=24*raw.get(j,0):
   first_shift+=1
   if len(examples)<8:examples.append(dict(n=n,c=c,r=r,j=j,pre_shift=int(v),actual_scaled=24*raw.get(j,0)))
  for j in range(n):
   i=a+2-j
   polygon=all(a*b<=b*u+a*v and u+v<=a+b-1 for u,v in [(i,j+2),(i+1,j+1),(i+2,j)])
   assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2
   assert vals[j]*vals[j+2]<=vals[j+1]**2
   if polygon:triples+=1
  cases.append([n,c,r])
 result=dict(status='Finite exact experiment; no universal theorem follows from these tests',source_method='Inherited exact lower-cut matrix recurrence on mechanical source words; source correspondence is supplied by separate inherited Lean bridges',cases=cases,coefficient_checks=coeff,shape_checks=shapes,polygon_valid_triples=triples,first_shift_differences=first_shift,first_shift_examples=examples,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n')
 print({k:v for k,v in result.items() if k not in ['cases','first_shift_examples']},flush=True)
if __name__=='__main__':main()
