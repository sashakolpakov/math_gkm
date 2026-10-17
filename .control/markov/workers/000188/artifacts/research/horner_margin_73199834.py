"""Machine-authored re-expression of the inherited exact positive certificate.
Only this request's source is edited; polynomial equality is checked by Lean.
"""
from pathlib import Path
from fractions import Fraction
import json
R=Path('/Users/sasha/math_gkm')
raw=json.loads((R/'evidence/markov-20825094/first-central-symbolic.json').read_text())
p={tuple(k):Fraction(v) for k,v in raw['shifted']}
assert all(v>0 and v.denominator==1 for v in p.values())
def horner(p,variables):
 if not p:return '0'
 if not variables:
  assert all(not any(k) for k in p)
  return str(int(sum(p.values())))
 j,name=variables[0];degree=max(k[j] for k in p)
 def sub(e):return {k[:j]+(0,)+k[j+1:]:v for k,v in p.items() if k[j]==e}
 out=horner(sub(degree),variables[1:])
 for e in reversed(range(degree)):
  out='('+horner(sub(e),variables[1:])+' + '+name+' * '+out+')'
 return out
expr=horner(p,[(0,'x'),(1,'y'),(3,'z')])
q=R/'research/MarkovTopFirstCentralMarginM731.lean';s=q.read_text()
start=s.index('\n have he :');a=s.index('=\n',start)+2;b=s.index(' := by unfold firstCentralReducedM731; ring',a)
s=s[:a]+expr+s[b:]
q.write_text(s)
print(json.dumps(dict(positive_coefficients=len(p),horner_characters=len(expr))))
