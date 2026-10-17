"""Machine-authored c9f23b44. Preserve candidates and reduce repeated import costs.
Holding each unstarted S5 source makes the foreground sequential driver stop
after S4 with an explicit missing-source outcome; no Lean proof is interrupted.
The source is preserved byte-for-byte and restored after the driver exits.
"""
from pathlib import Path
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c9f23b44'
held=[]
for a in range(4):
 p=R/'research'/f'MarkovDenseProduct{a}S5MC9F.lean'
 q=R/'research'/f'MarkovDenseProduct{a}S5MC9F.held.lean'
 p.rename(q);held.append([str(p.relative_to(R)),str(q.relative_to(R))])
mods=['MarkovDenseCertificateMC9F','MarkovDenseFactorsMC9F']
for a in range(4):
 mods.extend(f'MarkovDenseProduct{a}S{k}MC9F' for k in range(1,5))
 prev=f'MarkovDenseProduct{a}S4MC9F'
 for lo,hi in [(5,9),(10,14),(15,18),(19,21)]:
  name=f'MarkovDenseBatch{a}S{hi}MC9F'
  s=f'import {prev}\n/-! Machine-authored c9f23b44. Batched exact dense certificates. -/\nnamespace MathGKM.Markov\nset_option maxRecDepth 100000\nset_option maxHeartbeats 16000000\n'
  for k in range(lo,hi+1):
   p=R/'research'/f'MarkovDenseProduct{a}S{k}MC9F.lean'
   if k==5:p=p.with_suffix('.held.lean')
   z=p.read_text();s+=z[z.index('def dp'):z.rindex('end MathGKM.Markov')]
  (R/'research'/f'{name}.lean').write_text(s+'end MathGKM.Markov\n')
  mods.append(name);prev=name
p=R/'research/MarkovDenseGapMC9F.lean';s=p.read_text()
for a in range(4):s=s.replace(f'import MarkovDenseProduct{a}S21MC9F',f'import MarkovDenseBatch{a}S21MC9F')
p.write_text(s)
mods.extend(['MarkovDenseGapMC9F','MarkovLowerClosedMC9F'])
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
(O/'batch-suspension.json').write_text(json.dumps({'time_ns':time.time_ns(),'reason':'Repeated import overhead dominates. No mathematical proof is interrupted; stop each driver after S4 by holding the not-yet-started S5 input. Restore after driver exits.','held':held,'modules':mods},indent=2)+'\n')
print(json.dumps({'held':held,'modules':len(mods)}))
