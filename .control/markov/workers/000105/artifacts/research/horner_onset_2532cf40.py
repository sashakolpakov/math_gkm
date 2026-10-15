"""Machine-authored operational revision: same exact polynomial in Horner form."""
from pathlib import Path
from fractions import Fraction
import json,re
R=Path('/Users/sasha/math_gkm');D=R/'research'
data=json.loads((R/'evidence/markov-5dc9c88d/onset-candidates.json').read_text())
def horner(rows,variables=[(0,'N'),(2,'C'),(3,'R')]):
 rows={tuple(k):Fraction(v) for k,v in rows}
 def rec(p,vs):
  if not p:return '0'
  if not vs:
   assert len(p)==1
   k,v=next(iter(p.items()));assert all(e==0 for e in k) and v.denominator==1
   return str(v.numerator)
  idx,x=vs[0];groups={}
  for k,v in p.items():
   z=list(k);a=z[idx];z[idx]=0;groups.setdefault(a,{})[tuple(z)]=v
  m=max(groups);s=rec(groups.get(m,{}),vs[1:])
  for a in reversed(range(m)):
   t=rec(groups.get(a,{}),vs[1:]);s=f'({s}*{x} + {t})' if t!='0' else f'({s}*{x})'
  return s
 return rec(rows,variables)
for ci,prefix in [(0,'Low'),(2,'High')]:
 p=D/f'MarkovOnset{prefix}DefsM253.lean';s=p.read_text()
 for k,v in enumerate(data['charts'][ci]['values'],1):
  s=re.sub(r'(def onset'+prefix+'V'+str(k)+r'M253[^\n]*\n )[^\n]+',lambda m:m[1]+horner(v),s)
 p.write_text(s)
 for k,v in enumerate(data['charts'][ci]['gaps'],1):
  p=D/f'MarkovOnset{prefix}Gap{k}M253.lean';s=p.read_text()
  s=re.sub(r'(def onset'+prefix+'G'+str(k)+r'M253[^\n]*\n )[^\n]+',lambda m:m[1]+horner(v),s)
  p.write_text(s)
print('Rewrote unaccepted general candidates in Horner form; previous attempts retained.')
