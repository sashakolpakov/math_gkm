"""Machine-authored exact finite source checks; no computation is a proof premise."""
from pathlib import Path
from fractions import Fraction as F
from math import comb,gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def main():
 start=time.monotonic()
 low=json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['parts']
 lin=json.loads((O/'linear-factor.json').read_text())['linear']
 inputs=[(n,c,r) for c in range(5,17) for r in range(1,c) if gcd(c,r)==1 for n in [4,5,6,7,8,10,13,21]]
 inputs += [(n,c,r) for n in [32,64,100] for c,r in [(5,1),(5,4),(7,3),(11,7)]]
 counts=dict(block_coefficients=0,block_shape_positions=0,block_triples=0,run_four_triples=0,literal_coefficients=0)
 for n,c,r in inputs:
  a=n*c+r;b=a+c;raw=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
  lv=[sum(F(v)*c**k[2]*a**k[3] for k,v in p) for p in low]
  dv=[sum(F(v)*n**k[0]*c**k[2]*r**k[3] for k,v in lin if k[-1]==i) for i in range(13)]
  value=lambda j:sum(lv[t]*comb(7+j-t,7) for t in range(min(j,12)+1))+sum(dv[t]*comb(7+j-n-t,7) for t in range(min(j-n,12)+1))
  for j in range(2*n+3):
   assert value(j)==24*raw.get(j,0),(n,c,r,j,'block')
   counts['block_coefficients']+=1
   if n+5<=j:counts['block_shape_positions']+=1
  for j in range(n+5,2*n+1):
   i=a+2-j
   if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
    assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2,(n,c,r,j,'LC')
    counts['block_triples']+=1
  if n==4:
   j=4;i=a+2-j
   if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
    assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2
    counts['run_four_triples']+=1
  if b<=60:
   aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(a+5):
    assert p.get((a+4-j,j),0)==raw.get(j,0),(a,b,j,'literal')
    counts['literal_coefficients']+=1
 result=dict(status='Exact finite experiments only; formal theorem hypotheses remain separate',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n')
 print({k:v for k,v in result.items() if k!='inputs'},flush=True)
if __name__=='__main__':main()
