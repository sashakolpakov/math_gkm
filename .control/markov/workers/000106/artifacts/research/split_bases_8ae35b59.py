"""Machine-authored split of unaccepted Horner base builds; failed snapshots retained."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-8ae35b59'
mods=[]
for z in [0,2,3]:
 p=D/f'MarkovMiddleBase{z}M8AE.lean';s=p.read_text();head=s[:s.index('\ndef ')];body=s[s.index('\ndef '):s.rindex('end\nend MathGKM.Markov')]
 parts=re.split(r'(?=\ndef midH)',body)
 imports=[]
 for i in range(3):
  m=f'MarkovMiddleBase{z}_{i}M8AE';q=D/f'{m}.lean';assert not q.exists()
  q.write_text(head+''.join(t for t in parts if re.match(r'\ndef midH'+str(z)+'_'+str(i)+'_',t))+'end\nend MathGKM.Markov\n')
  mods.append(m);imports.append('import '+m)
 p.write_text('\n'.join(imports)+'\n/-! Machine-authored 8ae35b59. Split base assembly. -/\n')
(O/'split-bases.json').write_text(json.dumps(mods,indent=2)+'\n');print(' '.join(mods))
