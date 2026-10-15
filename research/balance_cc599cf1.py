"""Machine-authored expression regrouping; failed original source snapshots retained."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
def bal(xs):
 if len(xs)==1:return xs[0]
 k=len(xs)//2
 return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
for name in ['MarkovBlockSmall1CC','MarkovBlockSmall2CC','MarkovBlockSmall3CC']:
 p=R/(name+'.lean');ls=p.read_text().splitlines()
 for i,l in enumerate(ls):
  if i and ls[i-1].startswith('def ') and ' + ' in l:ls[i]=' '+bal(l.strip().split(' + '))
 p.write_text('\n'.join(ls)+'\n')
