"""Machine-authored exact symbolic investigation; candidates require Lean validation."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cfcbaf30'
class P(dict):
 def __add__(a,b):
  d=P(a)
  for k,v in coerce(b).items(): d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-coerce(b)
 def __rsub__(a,b):return coerce(b)+-a
 def __mul__(a,b):
  d={}
  for k,v in a.items():
   for l,w in coerce(b).items():
    t=tuple(i+j for i,j in zip(k,l));d[t]=d.get(t,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  p=coerce(1)
  for _ in range(n):p=p*a
  return p
def coerce(v):return v if isinstance(v,P) else P({(0,0,0):F(v)}) if v else P()
N=P({(1,0,0):F(1)});Z=P({(0,1,0):F(1)});X=P({(0,0,1):F(1)})
def subst(p,n,z,x):return sum((v*n**k[0]*z**k[1]*x**k[2] for k,v in p.items()),P())
def serial(p):return [[list(k),str(v)] for k,v in sorted(p.items())]
def parse(name,c,r):
 s=(R/f'research/Markov{"First" if name=="first" else "Second"}NormBC.lean').read_text()
 body=re.search(r'def '+name+r'NumBC.*?: A :=\n ([^\n]+)',s)[1]
 return eval(body.replace('^','**'),{'__builtins__':{}},dict(N=N,Z=Z,x=X,C=coerce(c),R=coerce(r),Q=coerce(max(2*r-c,0))))
rows=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
def numerator(c,r):
 ch=next(k for k in range(6) if r*bounds[k+1][1]<=c*bounds[k+1][0])
 base=P()
 for k,v in rows[ch]['numerator']:base+=F(v)*N**k[0]*Z**k[1]*c**k[2]*r**k[3]*X**k[7]
 f=parse('first',c,r);s=parse('second',c,r);D=1-X;H=1+X;E=Z**c*X**(c+r)
 corr=12*E*D**4*(2*f**2+4*f*H*D**2+6*H**2*D**4-s) if c==2 else -24*E*D**6*(f+2*H*D**2) if c==3 else 24*E*D**8
 return base+corr
def falling(t):
 p=coerce(1)
 for k in range(7):p=p*(t-k)
 return p
def raw_formula(p,active,j):
 return sum((v*N**a*falling(j+7-b*N-k) for (a,b,k),v in p.items() if b in active),P())
def horner(p,names=('N','Z','x')):
 if not p:return '0'
 if not names:
  v=sum(p.values());assert v.denominator==1
  return str(v.numerator) if v>=0 else '('+str(v.numerator)+')'
 groups={}
 for k,v in p.items():groups.setdefault(k[0],{})[k[1:]]=v
 m=max(groups);s=horner(groups[m],names[1:])
 for k in reversed(range(m)):
  t=horner(groups.get(k,{}),names[1:]);s=f'({s}*{names[0]} + {t})' if t!='0' else f'({s}*{names[0]})'
 return s
if __name__=='__main__':
 out=[]
 for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
  p=numerator(c,r);blocks={b:sorted(set(k for (a,bb,k),v in p.items() if bb==b)) for b in sorted(set(b for a,b,k in p))}
  print(c,r,len(p),blocks,flush=True)
  out.append(dict(c=c,r=r,numerator=serial(p),blocks=blocks))
 (O/'small-numerators.json').write_text(json.dumps(dict(status='Symbolic candidates; not proofs',families=out),indent=2)+'\n')
