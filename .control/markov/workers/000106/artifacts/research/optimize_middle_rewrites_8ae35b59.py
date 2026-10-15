"""Machine-authored: keep scalar coefficient definitions opaque during rewrites."""
from pathlib import Path
import re
D=Path('/Users/sasha/math_gkm/research')
for p in D.glob('MarkovMiddleGap*M8AE.lean'):
 s=p.read_text()
 names=sorted(set(re.findall(r'\b(midP\w+M722|midH\w+M8AE)\b',s)))
 marker='set_option maxRecDepth 65536\n'
 s=s.replace(marker,marker+'attribute [local irreducible] '+' '.join(names)+'\n')
 p.write_text(s)
print('Kept coefficient names opaque until their explicit algebraic unfolding.')
