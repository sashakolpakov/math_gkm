"""Machine-authored exact polynomial certificates for third low-slope candidate."""
from pathlib import Path
import json
from fractions import Fraction as F
O=Path('evidence/markov-75ad68f9')
class P(dict):
 def __add__(a,b):
  if not isinstance(b,P):b=P({(0,0):b})
  d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  if not isinstance(b,P):b=P({(0,0):b})
  d=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));d[m]=d.get(m,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  z=P({(0,0):1})
  for _ in range(n):z=z*a
  return z
def coefficients(c,r,q,t,u):
 return [-6+11*(c+r)-6*(c+r)**2+(c+r)**3,
 -18-3*c+87*r+3*c*c-51*c*r-54*r*r+9*c*c*r+18*c*r*r+9*r**3,
 -18+6*c+33*r+3*c*r-114*r*r+27*c*r*r+27*r**3,
 -6+21*r-18*r*r+27*r**3+24*q*(c+r-7),
 24*((3*r-5)*q+t),24*u]
def expr(p):
 if not p:return '0'
 return ' + '.join(str(v)+''.join('*'+s+('^'+str(e) if e>1 else '') for s,e in zip(['x','y'],k) if e) for k,v in sorted(p.items()))
def main():
 x=P({(1,0):1});y=P({(0,1):1})
 # Integer cones in (c,r); positive interior slacks. Boundaries handled separately.
 chambers=[('low',3*(x+1)+y,x+1,0,0,0),
 ('midlow',2*(x+1)+3*(y+1),(x+1)+(y+1),0,x+1,0),
 ('midhigh',3*(x+1)+2*(y+1),2*(x+1)+(y+1),x+1,x+y+2,0),
 ('high',(x+1)+3*(y+1),(x+1)+2*(y+1),x+y+2,y+1,x+1)]
 # Correct cells: c/r >=3; 2..3; 1.5..2; 1..1.5.
 # midhigh c=3x+2y,r=2x+y gives q=x, t=c-r=x+y,u=0.
 # high c=x+3y,r=x+2y gives q=x+y,t=y,u=x.
 records=[]
 for name,c,r,q,t,u in chambers:
  C=coefficients(c,r,q,t,u)
  for j in range(4):
   g=C[j+1]**2-C[j]*C[j+2]
   records.append(dict(chamber=name,j=j,terms=len(g),negative=[[k,v] for k,v in g.items() if v<0],expression=expr(g)))
 (O/'third-certificates.json').write_text(json.dumps(records,indent=2))
 print(json.dumps([{k:v for k,v in d.items() if k!='expression'} for d in records]))
if __name__=='__main__':main()
