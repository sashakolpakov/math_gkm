"""Machine-authored exact rational polynomial expansion; no CAS dependency."""
from pathlib import Path
from fractions import Fraction as Q
import json
O=Path('evidence/markov-68a44d34')
def add(a,b):return [sum((a[i] if i<len(a) else 0,b[i] if i<len(b) else 0)) for i in range(max(len(a),len(b)))]
def mul(a,b):
 c=[Q(0)]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def scale(a,c):return [x*c for x in a]
def choosepoly(shift,k):
 a=[Q(1)]
 for i in range(k):a=scale(mul(a,[Q(shift-i),Q(1)]),Q(1,i+1))
 return a
def horner(a):
 if len(a)==1:return str(a[0]) if a[0].denominator==1 else f'({a[0].numerator}/{a[0].denominator})'
 return f'({horner(a[:1])}+t*{horner(a[1:])})'
L=mul([33,1],choosepoly(34,2));M=mul([34,1],choosepoly(33,3))
R=add(add(mul([33,1],choosepoly(32,4)),scale(choosepoly(33,5),2)),choosepoly(32,5))
negGap=add(mul(L,R),scale(mul(M,M),-1))
assert all(x>0 for x in negGap)
rec=dict(shift=33,negative_gap_coefficients=[str(x) for x in negGap],horner=horner(negGap),constant=str(negGap[0]),status='exact rational expansion; identity still requires Lean proof')
(O/'count-gap-certificate.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
