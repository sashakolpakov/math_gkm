"""Machine-authored exact fixed-run quotient and gap candidates; not proofs."""
from pathlib import Path
from fractions import Fraction
from math import comb
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-38ebef17'
class P(dict):
 def __add__(a,b):
  d=P(a)
  for k,v in coerce(b).items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-coerce(b)
 def __rsub__(a,b):return coerce(b)+-a
 def __mul__(a,b):
  d={}
  for k,v in a.items():
   for l,w in coerce(b).items():
    z=tuple(i+j for i,j in zip(k,l));d[z]=d.get(z,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  z=coerce(1)
  for _ in range(n):z=z*a
  return z
def coerce(p):return p if isinstance(p,P) else P({(0,0):Fraction(p)}) if p else P()
c=C=P({(1,0):Fraction(1)});r=T=P({(0,1):Fraction(1)})
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
data=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())
rows=[];start=time.monotonic()
def serial(p):return [[list(k),str(v)] for k,v in sorted(p.items()) if v]
def subst(p,a,b):return sum((v*a**k[0]*b**k[1] for k,v in p.items()),P())
def main():
 for n in range(4):
  one(n)
def one(n):
 for ch,row in enumerate(data['rows']):
  coeff={}
  for ks,v in row['numerator']:
   assert ks[4:7]==[0,0,0]
   j=n*ks[1]+ks[7];coeff[j]=coeff.get(j,P())+Fraction(v)*n**ks[0]*c**ks[2]*r**ks[3]
  qs=[sum((v*comb(7+j-k,7) for k,v in coeff.items() if k<=j),P()) for j in range(4*n+8)]
  for j in range(4*n+16):
   assert sum((qs[j-k]*((-1)**k*comb(8,k)) for k in range(9) if 0<=j-k<len(qs)),P())==coeff.get(j,P()),(n,ch,j)
  (a,b),(u,v)=bounds[ch:ch+2];cv=b+v+b*C+v*T;rv=a+u+a*C+u*T
  gaps=[]
  for j in range(len(qs)-2):
   g=subst(qs[j+1]**2-qs[j]*qs[j+2],cv,rv)
   gaps.append(dict(j=j,nonnegative=all(z>=0 for z in g.values()),negative_terms=[[list(k),str(z)] for k,z in g.items() if z<0],terms=serial(g)))
  d=dict(n=n,chamber=ch,quotient=[serial(v) for v in qs],gaps=gaps)
  rows.append(d);print(n,ch,'degree',max(j for j,v in enumerate(qs) if v),'failed positive expansions',[g['j'] for g in gaps if not g['nonnegative']],flush=True)
  (O/'small-run-candidates.json').write_text(json.dumps(dict(status='Symbolic candidates only; no Lean proof inferred',rows=rows,seconds=time.monotonic()-start),indent=2)+'\n')
if __name__=='__main__':main()
