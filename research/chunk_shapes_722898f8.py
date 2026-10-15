"""Machine-authored elaboration repair: named low-degree coefficient blocks."""
from pathlib import Path
import json
from fractions import Fraction
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-722898f8'
d=json.loads((R/'evidence/markov-00a02b28/middle-symbolic.json').read_text())['middle_shapes']
st='import MathGKM.Markov\n/-! Machine-authored 722898f8. Chunked exact polynomial definitions. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxRecDepth 32768\n'
aux={}
for ch in [0,3]:
 groups={}
 for k,v in d[ch]:
  a,b=k[2],k[3];v=Fraction(v);assert v.denominator==1
  s=str(v.numerator)
  if k[0]:s+=f'*n^{k[0]}'
  if k[4]:s+=f'*j^{k[4]}'
  groups.setdefault((a,b),[]).append(s)
 aux[ch]=[f'middleShapePart{ch}_{a}_{b}M722' for a,b in sorted(groups)]
 for (a,b),terms in sorted(groups.items()):st+=f'\ndef middleShapePart{ch}_{a}_{b}M722 (n j : ℤ) : ℤ :=\n '+' + '.join(terms)+'\n'
 st+=f'\ndef middleShape{ch}M722 (n c r j : ℤ) : ℤ :=\n '+' + '.join(f'middleShapePart{ch}_{a}_{b}M722 n j*c^{a}*r^{b}' for a,b in sorted(groups))+'\n'
st+='end\nend MathGKM.Markov\n'
(R/'research/MarkovMiddleShapesM722.lean').write_text(st)
for ch in range(6):
 p=R/f'research/MarkovMiddleShapeEq{ch}M722.lean';s=p.read_text();s=s.replace('\n ring\n',' '+' '.join(aux[0 if ch<3 else 3])+'\n ring\n');p.write_text(s)
for z in range(4):
 for i in range(3):
  p=R/f'research/MarkovMiddleValue{z}_{i}M722.lean';s=p.read_text();s=s.replace('\n ring\n',' '+' '.join(aux[0 if z<2 else 3])+'\n ring\n');p.write_text(s)
(O/'shape-layout-repair.json').write_text(json.dumps(dict(reason='Expanded shape definitions timed out; split by predecessor monomials without changing coefficients.',auxiliary_definitions=aux),indent=2)+'\n')
