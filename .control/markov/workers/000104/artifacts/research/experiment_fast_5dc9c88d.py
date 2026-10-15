"""Machine-authored exact finite experiments for middle and reflected-three formulas; not proofs."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd,comb
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5dc9c88d'
shapes=json.loads((R/'evidence/markov-00a02b28/middle-symbolic.json').read_text())['middle_shapes']
rows=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
inputs=[(n,c,r) for c in range(5,20) for r in range(1,c) if gcd(c,r)==1 for n in [6,7,13,23]]
counts=dict(cases=0,middle_coefficients=0,valid_middle_triples=0,literal_coefficients=0,zeros=0,three_block_coefficients=0,onset_triples=0)
start=time.monotonic()
for n,c,r in inputs:
 a=n*c+r;b=a+c;word=[(k+1)*a//b-k*a//b for k in range(1,b)]
 cut=backward(word,4);ch=sum(r*q>c*p for p,q in [(1,4),(1,3),(1,2),(2,3),(3,4)])
 cs=[F(0)]*8
 for ks,v in shapes[ch]:cs[ks[4]]+=F(v)*n**ks[0]*c**ks[2]*r**ks[3]
 def val(j):return sum(v*j**k for k,v in enumerate(cs))
 for j in range(2*n+6,3*n+4):
  v=val(j);assert v==120960*cut.get(j,0),(n,c,r,j,'middle')
  counts['middle_coefficients']+=1;counts['zeros']+=int(v==0)
 for j in range(2*n+1,3*n+1):
  i=a+2-j
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert cut.get(j,0)*cut.get(j+2,0)<=cut.get(j+1,0)**2
   counts['valid_middle_triples' if j>=2*n+6 else 'onset_triples']+=1
 # The saved normalized numerator is 24 times the raw slice after (1-X)^8.
 blocks={k:{} for k in range(5)}
 for ks,v in rows[ch]['numerator']:
  z,d=ks[1],ks[7];value=F(v)*n**ks[0]*c**ks[2]*r**ks[3]
  blocks[z][d]=blocks[z].get(d,F(0))+value
 def conv_ref(z,D,k):
  if k<0:return 0
  return sum(v*comb(7+k-(D-d),7) for d,v in blocks[z].items() if 0<=D-d<=k)
 for j in range(n+5,4*n+8):
  v=conv_ref(4,15,4*n+7-j)+conv_ref(3,14,3*n+6-j)+conv_ref(2,13,2*n+5-j)
  assert v==24*cut.get(j,0),(n,c,r,j,'three blocks',v,24*cut.get(j,0))
  counts['three_block_coefficients']+=1
 if b<=60:
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j in range(n+5,4*n+8):
   assert p.get((a+4-j,j),0)==cut.get(j,0),(a,b,j,'literal')
   counts['literal_coefficients']+=1
 counts['cases']+=1
 if counts['cases']%25==0:(O/'fast-experiment-progress.json').write_text(json.dumps(dict(counts=counts,seconds=time.monotonic()-start)))
result=dict(status='Finite exact experiments only; not proof',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'fast-experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result|dict(inputs='Retained in artifact')),flush=True)
