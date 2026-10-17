"""Exact sparse rational arithmetic proposes smaller boundary certificates.
Machine-authored f8f306c0. Generated expressions require Lean validation.
"""
from pathlib import Path
from fractions import Fraction as F
import json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f8f306c0'
class P(dict):
 def __add__(a,b):
  b=p(b); c=P(a)
  for k,v in b.items(): c[k]=c.get(k,0)+v
  return P({k:v for k,v in c.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-p(b)
 def __rsub__(a,b):return p(b)+-a
 def __mul__(a,b):
  c=P()
  for k,v in a.items():
   for l,w in p(b).items():
    m=tuple(x+y for x,y in zip(k,l));c[m]=c.get(m,0)+v*w
  return P({k:v for k,v in c.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  c=p(1)
  for _ in range(n):c=c*a
  return c
def p(a):return a if isinstance(a,P) else P({(0,0,0):F(a)}) if a else P()
x=P({(1,0,0):F(1)});g=P({(0,1,0):F(1)});z=P({(0,0,1):F(1)})
def horner(a,dim=0):
 if not a:return '0'
 if dim==3:
  v=sum(a.values());return str(v.numerator) if v.denominator==1 else f'({v.numerator}/{v.denominator})'
 cs={}
 for k,v in a.items():cs.setdefault(k[dim],P())[k]=v
 out=horner(cs[max(cs)],dim+1)
 for i in range(max(cs)-1,-1,-1):out=f'({horner(cs.get(i,P()),dim+1)}+{("x","g","z")[dim]}*{out})'
 return out
class Rat:
 def __init__(a,n,d=None):a.n=p(n);a.d=d or {}
 def __add__(a,b):
  if not isinstance(b,Rat):b=Rat(b)
  d={s:max(a.d.get(s,0),b.d.get(s,0)) for s in a.d.keys()|b.d.keys()}
  def up(r):
   n=r.n
   for s,v in d.items():n=n*(x+s)**(v-r.d.get(s,0))
   return n
  return Rat(up(a)+up(b),d)
 __radd__=__add__
 def __neg__(a):return Rat(-a.n,a.d)
 def __sub__(a,b):return a+-b
 def __mul__(a,b):
  if not isinstance(b,Rat):b=Rat(b)
  return Rat(a.n*b.n,{s:a.d.get(s,0)+b.d.get(s,0) for s in a.d.keys()|b.d.keys()})
 __rmul__=__mul__
 def __pow__(a,n):
  r=Rat(1)
  for _ in range(n):r=r*a
  return r
def denom(*xs):return {s:xs.count(s) for s in set(xs)}
old=(R/'research/MarkovAbsorbedBoundaryCertificateM418.lean').read_text()
report=[]
for r,c in [(2,4),(3,8)]:
 for edge in [0,1]:
  t=x+4; d=t+(1 if edge else 2+g);j=d+r; B=z+j+1
  W=lambda v,m:(v+m+4)*(v+m+5)+4*(j-m)*(v+j+4)
  b0=Rat(B*W(t,0),denom(8,9))
  b10=Rat(B*(t+j+4)*W(t+1,0),denom(8,9,10))
  b11=Rat(B*j*(t+j+4)*W(t+1,1),denom(8,10,11))
  b20=Rat(B*(t+j+4)*(t+j+5)*W(t+2,0),denom(8,9,10,11))
  b21=Rat(B*j*(t+j+4)*(t+j+5)*W(t+2,1),denom(8,9,11,12))
  b22=Rat(F(1,2)*B*j*(j-1)*(t+j+4)*(t+j+5)*W(t+2,2),denom(8,9,12,13))
  a0=Rat(c*(d-t),denom(5));a1=Rat(c*(d-t-1),denom(6));a2=Rat(0 if edge else c*(d-t-2),denom(7))
  gaps=[b11**2-(b0+a0)*b22,2*b11*(b10+a1)-(b0+a0)*b21,(b10+a1)**2-(b0+a0)*(b20+a2)]
  for idx,gap in enumerate(gaps,1):
   tag=f'{r}{edge}{idx}'; name='absorbedBoundary'+tag+'MF8F';mod='MarkovBoundary'+tag+'MF8F'
   definition=old.split('def absorbedBoundary'+tag+'M418')[1].split('\ntheorem ')[0]
   nums=gap.n
   assert all(v>=0 for v in nums.values()),tag
   den='*'.join(f'(x+{s})^{n}' for s,n in sorted(gap.d.items()))
   num=horner(nums)
   text='import MarkovAbsorbedBoundaryModelM418\n/-! Machine-authored f8f306c0. Exact rational boundary certificate; no external axiom. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\nset_option maxRecDepth 8192\n\ndef '+name+definition+'\n'
   text+=f'theorem {name}_nonnegMF8F (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :\n 0 ≤ {name} x g z := by\n'
   text+=f' let num : ℚ := {num}\n let den : ℚ := {den}\n have hn : 0 ≤ num := by dsimp [num]; positivity\n have hd : 0 < den := by dsimp [den]; positivity\n'
   for s in range(5,14):text+=f' have h{s} : x+{s}≠0 := by positivity\n'
   text+=f' have he : {name} x g z = num/den := by\n   dsimp [{name},den]\n   field_simp [h5,h6,h7,h8,h9,h10,h11,h12,h13]\n   <;> dsimp [num] <;> ring\n rw [he]\n exact div_nonneg hn (le_of_lt hd)\n\nend\nend MathGKM.Markov\n'
   (R/'research'/f'{mod}.lean').write_text(text)
   report.append({'module':mod,'terms':len(nums),'degree':[max(k[i] for k in nums) for i in range(3)],'denominator':den,'status':'candidate'})
(O/'certificate-generation.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
