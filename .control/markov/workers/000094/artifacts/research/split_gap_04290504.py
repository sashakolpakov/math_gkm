"""Machine-authored smaller proof units; original timed attempts retained."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-04290504'
mods=[]
for tag in ['A','B','D','L']:
 for p in sorted((R/'research').glob(f'MarkovBlock{tag}Gap*M042.lean')):
  s=p.read_text();pos=s.index('\ndef ');head=s[:pos];blocks=re.split(r'\n(?=def )',s[pos:].removesuffix('end\nend MathGKM.Markov\n').strip())
  # Each independent coefficient is checked without waiting for the rest of a file.
  for block in blocks:
   name=re.search(r'def (\w+)',block)[1];m='MarkovSplit'+name.removeprefix('block')
   (R/'research'/f'{m}.lean').write_text(head+'\n'+block+'\nend\nend MathGKM.Markov\n')
   if tag=='A':mods.append(m)
(O/'split-a-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
print(mods)
