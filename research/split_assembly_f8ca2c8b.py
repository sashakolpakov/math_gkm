"""Machine-authored proof-module separation after bounded build timeouts."""
from pathlib import Path
import json,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8ca2c8b'
for tag in sys.argv[1:]:
 p=R/f'research/MarkovThirdSmallLC{tag}MF8.lean';s=p.read_text()
 ix=s.index('namespace MathGKM.Markov');a=s.index(f'theorem sThird{tag}zeroMF8');b=s.index(f'theorem sThird{tag}adjacentMF8');c=s.index(f'theorem sThird{tag}rawMF8')
 header=s[ix:a];tail='end\nend MathGKM.Markov\n'
 support=f'MarkovThirdSupport{tag}MF8';adj=f'MarkovThirdAdjacent{tag}MF8'
 (R/f'research/{support}.lean').write_text(f'import MarkovThirdSmallCoeff{tag}MF8\n'+header+s[a:b]+tail)
 body=s[b:c]
 marker=' by_cases h2 : j=2'
 helper=f''' have transport (q' j' : ℤ) (hq' : q'=q) (hj' : j'=j)
   (h : sThird{tag}EMF8 q' (j'-1)*sThird{tag}EMF8 q' (j'+1) ≤ sThird{tag}EMF8 q' j'^2) :
   sThird{tag}EMF8 q (j-1)*sThird{tag}EMF8 q (j+1) ≤ sThird{tag}EMF8 q j^2 := by
   simpa only [hq',hj'] using h
'''
 body=body.replace(marker,helper+marker)
 lines=[]
 for line in body.splitlines():
  if ' · convert ' in line:
   proof=line.split(' · convert ',1)[1].split(' using 1',1)[0]
   lines.append(' · apply transport _ _ ?_ ?_ ('+proof+') <;> omega')
  else:lines.append(line)
 body='\n'.join(lines)+'\n'
 (R/f'research/{adj}.lean').write_text(s[:ix]+f'import {support}\n'+header+body+tail)
 p.write_text(f'import {adj}\n'+header+s[c:])
ms=[p.stem for p in (R/'research').glob('*MF8.lean') if not p.stem.startswith('Replay')]
(O/'pending-plan.json').write_text(json.dumps({m:m for m in ms})+'\n')
print('Split assembly for',sys.argv[1:])
