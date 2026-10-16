"""Machine-authored exact Sturm experiment. No Lean theorem or root completion."""
from pathlib import Path
from fractions import Fraction
from math import gcd,lcm
import sys,json,time
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw,sources
def trim(p):
 while p and p[-1]==0:p.pop()
 return p
def primitive(p):
 p=trim(p)
 if not p:return []
 den=lcm(*(x.denominator for x in p));v=[int(x*den) for x in p]
 g=gcd(*v)
 return [x//g for x in v] # positive scaling preserves every sign
def remainder(p,q):
 p=list(map(Fraction,p));q=list(map(Fraction,q))
 while len(p)>=len(q):
  a=p[-1]/q[-1];d=len(p)-len(q)
  for k,b in enumerate(q):p[k+d]-=a*b
  trim(p)
 return primitive([-x for x in p])
def variations(signs):
 signs=[x for x in signs if x]
 return sum(a!=b for a,b in zip(signs,signs[1:]))
def neg_roots(p):
 p=trim(list(p))
 while p and p[0]==0:p=p[1:]
 if len(p)<=1:return dict(degree=max(0,len(p)-1),negative_distinct=0,squarefree=True)
 seq=[p,primitive([Fraction(k*p[k]) for k in range(1,len(p))])]
 while seq[-1]:
  r=remainder(seq[-2],seq[-1])
  if not r:break
  seq.append(r)
 minus=[(1 if x[-1]>0 else -1)*(-1 if (len(x)-1)%2 else 1) for x in seq]
 zero=[(x[0]>0)-(x[0]<0) for x in seq]
 return dict(degree=len(p)-1,negative_distinct=variations(minus)-variations(zero),
             squarefree=len(seq[-1])==1,minus_signs=minus,zero_signs=zero)
t=time.monotonic();out=dict(status='exact rational Sturm computations only; no formal conclusion',
 numerator_two_rows=0,general_source_rows=0,failures=[],examples=[])
for q in range(1,31):
 p=raw(2,2*q+1)
 for j in range(q+1,2*q+3):
  row=[p.get((i,j),0) for i in range(2*q+3-j)]
  h=neg_roots(row);out['numerator_two_rows']+=1
  if h['negative_distinct']!=h['degree']:out['failures'].append(dict(fraction=[2,2*q+1],j=j,row=row,sturm=h))
for path,(a,b,p) in sources(24):
 for j in range((b-1)//2+1,a+b):
  row=[p.get((i,j),0) for i in range(a+b-j)]
  if not any(row):continue
  h=neg_roots(row);out['general_source_rows']+=1
  if h['negative_distinct']!=h['degree'] and len(out['failures'])<20:
   out['failures'].append(dict(fraction=[a,b],j=j,row=row,sturm=h))
  if len(out['examples'])<5:out['examples'].append(dict(fraction=[a,b],j=j,row=row,sturm=h))
out['central_comparison']=dict(fraction=[2,5],j=2,row=[0,0,14,28,15],sturm=neg_roots([14,28,15]))
out['seconds']=time.monotonic()-t
Path('evidence/markov-af6200bf/upper-sturm.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
