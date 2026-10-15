"""Machine-authored alternative certificate layout amortizing expensive import startup."""
from pathlib import Path
import json,re
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-5dc9c88d'
inv=json.loads((O/'inventory.json').read_text())
head='/-! Machine-authored request 5dc9c88d. Grouped exact certificate layout. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 32000000\nset_option maxRecDepth 65536\n'
end='end\nend MathGKM.Markov\n'
def save(m,s):
 p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
new={'gaps':[],'columns':[],'charts':[],'assembly':[]}
for z in [0,2,3]:
 m=f'MarkovMiddleGaps{z}M5D2';s=f'import MarkovMiddleBase{z}M722\n'+head
 for name in inv['gaps']:
  if not name.startswith(f'MarkovMiddleGap{z}_'):continue
  t=(D/f'{name}.lean').read_text();t=t[t.index('def midG'):t.rindex('\nend\n')];s+=t.replace('M5DC','M5D2')+'\n'
 save(m,s+end);new['gaps'].append(m)
 if z!=3:
  m=f'MarkovMiddleColumns{z}M5D2';s=f'import MarkovMiddleGaps{z}M5D2\n'+head
  for name in inv['columns']:
   if not name.startswith(f'MarkovMiddleColumn{z}_'):continue
   t=(D/f'{name}.lean').read_text();t=t[t.index('def midGapCol'):t.rindex('\nend\n')];s+=t.replace('M5DC','M5D2')+'\n'
  save(m,s+end);new['columns'].append(m)
  s=(D/f'MarkovMiddleChart{z}M5DC.lean').read_text().replace('M5DC','M5D2')
  s=re.sub(r'import MarkovMiddleColumn[^\n]+\n','',s);s=f'import MarkovMiddleColumns{z}M5D2\n'+s
  m=f'MarkovMiddleChart{z}M5D2';save(m,s);new['charts'].append(m)
 else:
  s=(D/'MarkovMiddleHighDirectM5DC.lean').read_text().replace('M5DC','M5D2')
  s=re.sub(r'import MarkovMiddleGap[^\n]+\n','',s);s='import MarkovMiddleGaps3M5D2\n'+s
  save('MarkovMiddleHighDirectM5D2',s);new['charts'].append('MarkovMiddleHighDirectM5D2')
for name in inv['assembly']:
 s=(D/f'{name}.lean').read_text().replace('M5DC','M5D2');m=name.replace('M5DC','M5D2');save(m,s);new['assembly'].append(m)
(O/'grouped-inventory.json').write_text(json.dumps(new,indent=2)+'\n');print(new)
