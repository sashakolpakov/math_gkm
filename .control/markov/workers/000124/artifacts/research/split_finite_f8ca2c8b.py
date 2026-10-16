"""Machine-authored bounded finite base-case proof splitting; no mathematical assumptions."""
from pathlib import Path
import re,json,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8ca2c8b'
for tag in sys.argv[1:]:
 p=R/f'research/MarkovThirdSmallLC{tag}MF8.lean';s=p.read_text()
 old=next(line for line in s.splitlines() if 'interval_cases q <;> interval_cases j' in line)
 defs=old.split('norm_num [',1)[1].rsplit(']',1)[0]
 imports=[]
 for q in range(1,5):
  mod=f'MarkovThirdFinite{tag}Q{q}MF8';imports.append('import '+mod)
  body=f'''import MarkovThirdSmallCoeff{tag}MF8
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
theorem sThird{tag}finite{q}MF8 (j : ℤ) (h0 : 2≤j) (hN : j≤{3*q+5}) :
 sThird{tag}EMF8 {q} (j-1)*sThird{tag}EMF8 {q} (j+1) ≤ sThird{tag}EMF8 {q} j^2 := by
 interval_cases j <;> norm_num [{defs}]
end
end MathGKM.Markov
'''
  (R/f'research/{mod}.lean').write_text(body)
 new=' · interval_cases q\n'+''.join(f'   · exact sThird{tag}finite{q}MF8 j (by omega) (by omega)\n' for q in range(1,5))
 s='\n'.join(imports)+'\n'+s.replace(old,new.rstrip())
 p.write_text(s)
ms=[p.stem for p in (R/'research').glob('*MF8.lean') if not p.stem.startswith('Replay')]
(O/'pending-plan.json').write_text(json.dumps({m:m for m in ms})+'\n')
print('Split finite bases for',sys.argv[1:])
