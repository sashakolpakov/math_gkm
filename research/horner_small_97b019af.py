"""Machine-authored equivalent Horner layout for the unfinished small-column certificate."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-97b019af'
rows=json.loads((O/'small-gap-certificates.json').read_text())['rows']
def horner(p,vs):
 if not vs:return str(next(iter(p.values())))
 kmax=max(k[0] for k in p);parts={}
 for k,v in p.items():parts.setdefault(k[0],{})[k[1:]]=v
 cur=horner(parts.get(kmax,{(0,)*(len(vs)-1):0}),vs[1:])
 for k in range(kmax-1,-1,-1):
  cur=f'({cur})*{vs[0]}'
  if k in parts:cur+=f'+({horner(parts[k],vs[1:])})'
 return cur
import sys
for ii in map(int,sys.argv[1:]):
 row=next(r for r in rows if r['i']==ii);p={(a,b):int(v) for a,b,v in row['coefficients']}
 expanded='+\n  '.join(str(v)+(f'*h^{a}' if a else '')+(f'*d^{b}' if b else '') for (a,b),v in sorted(p.items()))
 path=R/f'research/MarkovTopSmall{ii}GapM97B.lean';s=path.read_text();assert s.count(expanded)==2
 s=s.replace(expanded,horner(p,['h','d']));path.write_text(s)
 print(ii,len(p))
