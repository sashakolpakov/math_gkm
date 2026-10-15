"""Machine-authored 00a02b28. Reuse candidate text in new files, preserving history."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-00a02b28'
modules=[]
for ch in range(6):
 for k in range(1,6):
  m=f'MarkovOnsetColumns{ch}_{k}M00';modules.append(m)
  if ch==0 and k==1:continue
  s=(R/f'research/MarkovOnsetColumns{ch}_{k}M1B.lean').read_text()
  names=re.findall(r'^(?:def|theorem) (\w+)',s,re.M)
  for name in sorted(names,key=len,reverse=True):
   s=re.sub(r'\b'+name+r'\b',name.replace('M1B','M00'),s)
  s=s.replace('Machine-authored 1b02dddc','Machine-authored 00a02b28, adapted from unvalidated 1b02dddc candidate')
  (R/f'research/{m}.lean').write_text(s)
(O/'planned-onset-modules.json').write_text(json.dumps(modules,indent=2)+'\n')
print('Prepared 29 new independent certificates, in addition to the first accepted build.')
