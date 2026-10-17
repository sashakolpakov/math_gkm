"""Machine-authored exact sparse algebra; output is not a proof."""
from pathlib import Path
from fractions import Fraction
import json,time
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-09fffb56'
class P(dict):
 def __init__(self,x=0):
  super().__init__(x if isinstance(x,dict) else ({(0,0,0):x} if x else {}))
 def __add__(a,b):
  b=P(b);r=P(a)
  for k,v in b.items():r[k]=r.get(k,0)+v
  return P({k:v for k,v in r.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-P(b)
 def __rsub__(a,b):return P(b)+-a
 def __mul__(a,b):
  b=P(b);r=P()
  for k,v in a.items():
   for l,w in b.items():
    n=tuple(x+y for x,y in zip(k,l));r[n]=r.get(n,0)+v*w
  return P({k:v for k,v in r.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  r=P(1)
  for _ in range(n):r=r*a
  return r
 def eval(a,vs):return sum(v*vs[0]**k[0]*vs[1]**k[1]*vs[2]**k[2] for k,v in a.items())
def variable(i):return P({tuple(int(i==j) for j in range(3)):1})
def W(j,t,m):return (t+m+4)*(t+m+5)+4*(j-m)*(t+j+4)
def num(j,t,m):return (t+4)*(t+5)*W(j,t,m)
def den(j,t,m):return (t+m+4)*(t+m+5)*W(j,t,0)
def horner(p,vs=('t','m','z'),i=0):
 if not p:return '0'
 if i==3:return str(p.get((0,0,0),0))
 deg=max(k[i] for k in p);parts=[]
 for d in range(deg+1):
  sub={tuple(0 if q==i else k[q] for q in range(3)):v for k,v in p.items() if k[i]==d}
  parts.append(horner(sub,vs,i+1))
 out=parts[-1]
 for s in reversed(parts[:-1]):out=f'({s}+{vs[i]}*{out})' if s!='0' else f'({vs[i]}*{out})'
 return out
def main():
 t,m,z=[variable(i) for i in range(3)];j=m+z
 ns=[num(j,t+h,m) for h in range(3)];ds=[den(j,t+h,m) for h in range(3)]
 gap=ns[1]**2*ds[0]*ds[2]-ns[0]*ns[2]*ds[1]**2
 step=ns[1]*ds[0]-ns[0]*ds[1]
 out={}
 for name,p in [('gap',gap),('step',step)]:
  out[name]=dict(terms=len(p),negative=sum(v<0 for v in p.values()),minimum=min(p.values()),degree=[max(k[i] for k in p) for i in range(3)],common=[min(k[i] for k in p) for i in range(3)])
  (O/(name+'-polynomial.json')).write_text(json.dumps([[list(k),v] for k,v in sorted(p.items())])+'\n')
  (O/(name+'-horner.txt')).write_text(horner(p)+'\n')
 print(json.dumps(out));(O/'normalized-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
if __name__=='__main__':main()
