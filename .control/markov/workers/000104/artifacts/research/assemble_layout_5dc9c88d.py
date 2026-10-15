"""Machine-authored: assemble prepared proofs while retaining every input source."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-5dc9c88d'
def combine(target,names,replacements={}):
 imports=[];bodies=[]
 for name in names:
  s=(D/f'{name}.lean').read_text()
  for a,b in replacements.items():s=s.replace(a,b)
  for x in re.findall(r'^import (\S+)',s,re.M):
   if x not in names and x not in imports:imports.append(x)
  bodies.append(re.sub(r'^import [^\n]+\n','',s,flags=re.M))
 p=D/f'{target}.lean';assert not p.exists();p.write_text(''.join(f'import {x}\n' for x in imports)+'\n'.join(bodies))
for z in [0,2]:
 combine(f'MarkovMiddleChartAll{z}M5D2',[f'MarkovMiddleColumns{z}M5D2',f'MarkovMiddleChart{z}M5D2'])
s=(D/'MarkovFourthFiveM722.lean').read_text().replace('M722','M5D2')
p=D/'MarkovFourthFiveM5D2.lean';assert not p.exists();p.write_text(s)
names=['MarkovMiddleLCM5D2','MarkovMiddleSourceM5D2','MarkovFourthUpperM5D2','MarkovResidualFullM5D2','MarkovFourthFiveM5D2']
combine('MarkovMiddleAssemblyM5D2',names,{'import MarkovMiddleChart0M5D2':'import MarkovMiddleChartAll0M5D2','import MarkovMiddleChart2M5D2':'import MarkovMiddleChartAll2M5D2'})
selected=['MarkovMiddleGaps0M5D2','MarkovMiddleGaps2M5D2','MarkovMiddleGaps3M5D2','MarkovMiddleChartAll0M5D2','MarkovMiddleChartAll2M5D2','MarkovMiddleHighDirectM5D2','MarkovMiddleAssemblyM5D2','MarkovBackwardThreeM5DC','MarkovBackwardThreeSourceM5DC']
(O/'selected-modules.json').write_text(json.dumps(selected,indent=2)+'\n')
print(selected)
