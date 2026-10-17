"""Machine-authored c9f23b44. Data-only reification of unchanged coefficient arrays.
The term elaborator proposes ordinary constructor terms. Arithmetic proofs still
use the proved Boolean checker and kernel reduction; no evaluator is trusted.
"""
from pathlib import Path
import json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c9f23b44'
mods=json.loads((O/'mathematical-modules.json').read_text())
mods.insert(2,'MarkovDenseDataMC9F')
for a in range(4):
 for k in ([21] if a in [0,1] else [18,21]):
  old=f'MarkovBooleanBatch{a}S{k}MC9F';new=f'MarkovDataBatch{a}S{k}MC9F'
  s=(R/'research'/f'{old}.lean').read_text().replace('import MarkovDenseBooleanMC9F','import MarkovDenseDataMC9F')
  s=re.sub(r'(noncomputable def dp\w+ : DenseMC9F 4 := )(\[.*\])',lambda m:m[1]+'dense_data% 4 '+json.dumps(m[2]),s)
  if a not in [0,1] and k==21:s=s.replace(f'import MarkovBooleanBatch{a}S18MC9F',f'import MarkovDataBatch{a}S18MC9F')
  (R/'research'/f'{new}.lean').write_text(s)
  mods[mods.index(old)]=new
p=R/'research/MarkovDenseGapMC9F.lean';s=p.read_text()
for a in range(4):s=s.replace(f'import MarkovBooleanBatch{a}S21MC9F',f'import MarkovDataBatch{a}S21MC9F')
s=re.sub(r'(noncomputable def denseGapMC9F : DenseMC9F 4 := )(\[.*\])',lambda m:m[1]+'dense_data% 4 '+json.dumps(m[2]),s)
p.write_text(s)
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
print('Generated six data-reified arithmetic modules; preceding candidates retained.')
