"""Machine-authored db238071: direct ordinary kernel conversion candidates."""
from pathlib import Path
import re,json,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-db238071'
mods=[]
for a,start in enumerate([21,21,15,15]):
 for b in range(start,22):
  old=f'MarkovProduct{a}S{b}MDB2';new=f'MarkovDirect{a}S{b}MDB2'
  s=(R/'research'/f'{old}.lean').read_text()
  s='import KernelRflMDB2\n'+s
  for k in range(start,b+1):
   s=s.replace(f'MarkovProduct{a}S{k}MDB2',f'MarkovDirect{a}S{k}MDB2')
   s=s.replace(f'prod{a}s{k}',f'direct{a}s{k}')
  s=s.replace('dbeq_soundMC9F 4 _ _ (by decide +kernel)','by kernel_rfl_mdb2')
  (R/'research'/f'{new}.lean').write_text(s);mods.append(new)
(O/'direct-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
print(mods)
