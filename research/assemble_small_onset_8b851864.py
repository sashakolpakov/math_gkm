"""Machine-authored source adapters for strengthened onset certificates."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-8b851864'
head='/-! Machine-authored request 8b851864. Raw onset inequality, reduced run bound. -/\nnamespace MathGKM.Markov\nnoncomputable section\nattribute [local irreducible] frame coeff onsetScalarLowM253 onsetScalarHighM253\n'
end='end\nend MathGKM.Markov\n'
mods=[]
for pfx in ['Low','High','Top']:
 old=f'MarkovOnset{pfx}ChartM253';s=(D/f'{old}.lean').read_text();s=s[s.index(f'theorem onset{pfx}_chartM253'):s.rindex('end\nend')]
 s=s.replace(f'onset{pfx}_chartM253',f'onset{pfx}_chartM8B8').replace('(hN : 0≤N)','(hN : -4≤N)')
 for k in range(1,6):s=s.replace(f'onset{pfx}_lc{k}M253',f'onset{pfx}_lc{k}M8B8')
 m=f'MarkovOnset{pfx}SmallChartM8B8';p=D/f'{m}.lean';assert not p.exists()
 p.write_text(f'import {old}\n'+''.join(f'import MarkovOnset{pfx}Small{k}M8B8\n' for k in range(1,6))+head+s+end);mods.append(m)
s=(D/'MarkovOnsetOneAssemblyM253.lean').read_text();s=s[s.index('theorem onsetOne_lcM253'):s.index('theorem source_fourth_onset_oneM253')]
s=s.replace('onsetOne_lcM253','onsetOne_lcM8B8').replace('secondOnset_one_lcM253','secondOnset_one_lcM8B8').replace('(hN : 0≤N)','(hN : -4≤N)').replace('(hn : 7≤n)','(hn : 3≤n)')
for k in range(1,6):s=s.replace(f'onsetOne_lc{k}M253',f'onsetOne_lc{k}M8B8')
m='MarkovOnsetOneSmallChartM8B8';p=D/f'{m}.lean';assert not p.exists();p.write_text('import MarkovOnsetOneAssemblyM253\n'+''.join(f'import MarkovOnsetOneSmall{k}M8B8\n' for k in range(1,6))+head+s+end);mods.append(m)
s=(D/'MarkovOnsetAllM253.lean').read_text();s=s[s.index('theorem secondOnset_lcM253'):s.rindex('end\nend')]
for pfx in ['Low','High','Top']:s=s.replace(f'onset{pfx}_chartM253',f'onset{pfx}_chartM8B8')
s=s.replace('secondOnset_one_lcM253','secondOnset_one_lcM8B8').replace('secondOnset_lcM253','secondOnset_lcM8B8').replace('source_fourth_onsetM253','source_fourth_onsetM8B8')
s=s.replace('(hn : 7≤n)','(hn : 3≤n)',1).replace('(hn : 7≤n)','(hn : 4≤n)')
s=s.replace('source_fourth_second_onset_valueM5DC','source_fourth_second_onset_valueM8AE')
s=s.replace(' k hn hc',' k (by omega) hc')
m='MarkovOnsetAllSmallM8B8';p=D/f'{m}.lean';assert not p.exists();p.write_text('import MarkovOnsetSmallSourceM8AE\n'+''.join(f'import {m}\n' for m in mods)+head+s+end);mods.append(m)
(O/'small-onset-assemblies.json').write_text(json.dumps(mods,indent=2)+'\n');print(mods)
