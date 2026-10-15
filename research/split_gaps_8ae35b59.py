"""Machine-authored split of unaccepted gap groups; prior snapshots retained."""
from pathlib import Path
import re,json
D=Path('/Users/sasha/math_gkm/research');mods=[]
for p in sorted(D.glob('MarkovMiddleGap*M8AE.lean')):
 s=p.read_text(); head=s[:s.index('\ndef ')]; body=s[s.index('\ndef '):s.rindex('end\nend MathGKM.Markov')]
 parts=[x for x in re.split(r'(?=\ndef midG)',body) if x.strip()]
 imports=[]
 for a,t in enumerate(parts):
  m=p.stem.replace('M8AE','_'+str(a)+'M8AE');q=D/(m+'.lean');assert not q.exists();q.write_text(head+t+'end\nend MathGKM.Markov\n');mods.append(m);imports.append('import '+m)
 p.write_text('\n'.join(imports)+'\n/-! Machine-authored request 8ae35b59. Gap import assembly. -/\n')
(D.parent/'evidence/markov-8ae35b59/split-gaps.json').write_text(json.dumps(mods,indent=2)+'\n')
print(len(mods),'coefficient gap modules')
