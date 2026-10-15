"""Machine-authored: split inherited candidate certificates without altering prior files."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-5dc9c88d'; D=R/'research'
head='/-! Machine-authored request 5dc9c88d. Exact fourth-slice coefficient certificate; no root closure. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 32000000\nset_option maxRecDepth 65536\nset_option linter.unusedVariables false\n'
end='end\nend MathGKM.Markov\n'
def save(m,s):
 p=D/f'{m}.lean';assert not p.exists();p.write_text(s.replace('≤m',' ≤ m'))
def rename(s):
 return re.sub(r'((?:midG|midGapCol|middle_gap_|middle_column_|middle_chart)\w*)M722',r'\1M5DC',s)
inventory={'gaps':[],'columns':[],'charts':[],'assembly':[]}
for z in [0,2,3]:
 for b in (range(9) if z!=3 else [0]):
  text=(D/f'MarkovMiddleGap{z}_{b}M722.lean').read_text()
  parts=re.split(r'\n(?=def midG)',text)[1:]
  mods=[]
  for a,part in enumerate(parts):
   part=part.split('\nend\n')[0]
   m=f'MarkovMiddleGap{z}_{a}_{b}M5DC';mods.append(m);inventory['gaps'].append(m)
   save(m,f'import MarkovMiddleBase{z}M722\n'+head+rename(part)+'\n'+end)
  if z!=3:
   m=f'MarkovMiddleColumn{z}_{b}M5DC';inventory['columns'].append(m)
   s=(D/f'MarkovMiddleColumn{z}_{b}M722.lean').read_text()
   s=s[s.index('/-!'):];s=rename(s)
   # simp only unfolds whichever columns are actually present, including zero ones.
   s=re.sub(r'  unfold (midGapCol[^\n]*)',r'  simp only [\1]',s)
   s=re.sub(r'  simp only \[([^\n]*)\]',lambda m:'  simp only ['+', '.join(m[1].split())+']',s)
   save(m,''.join(f'import {x}\n' for x in mods)+s)
 if z!=3:
  m=f'MarkovMiddleChart{z}M5DC';inventory['charts'].append(m)
  s=rename((D/f'MarkovMiddleChart{z}M722.lean').read_text())
  s=re.sub(r'(import MarkovMiddleColumn\w*)M722',r'\1M5DC',s)
  save(m,s)
# Upper extreme is one parameter. Retain every power, avoid irrelevant zero columns.
z=3
names=re.findall(r'^def (midP\w+)',(D/'MarkovMiddleBase3M722.lean').read_text(),re.M)
s=''.join(f'import MarkovMiddleValue3_{i}M722\n' for i in range(3))+''.join(f'import MarkovMiddleGap3_{a}_0M5DC\n' for a in range(9))+head
s+='attribute [local irreducible] '+' '.join(names)+'\n'
v=lambda i:f'middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+{6+i})'
d=lambda i:' + '.join(f'midP3_{i}_{a}_0M722 J E*R^{a}' for a in range(5))
g=' + '.join(f'midG3_{a}_0M5DC J E*R^{a}' for a in range(9))
s+=f'\ntheorem middle_high_directM5DC (R J E : ℤ) (hR : 0 ≤ R) (hJ : 0 ≤ J) (hE : 0 ≤ E) : {v(0)}*{v(2)} ≤ {v(1)}^2 := by\n apply sub_nonneg.mp\n rw ['+','.join(f'middle_value3_{i}M722 0 R J E' for i in range(3))+']\n simp only [pow_zero,pow_succ,zero_mul,mul_zero,add_zero,mul_one]\n unfold '+' '.join(f'midCol3_{i}_0M722' for i in range(3))+'\n'
s+=f' have he : ({d(1)})^2-({d(0)})*({d(2)})={g} := by\n  rw ['+','.join(f'←middle_gap_eq3_{a}_0M5DC' for a in range(9))+']\n  ring\n'
for a in range(9):s+=f' have h{a} := middle_gap_nonneg3_{a}_0M5DC J E hJ hE\n'
s+=f' have hp : 0 ≤ {g} := by positivity\n nlinarith only [he,hp]\n'+end
save('MarkovMiddleHighDirectM5DC',s);inventory['charts'].append('MarkovMiddleHighDirectM5DC')
# Reuse inherited low-direct theorem; this run separately replays and audits it.
s=(D/'MarkovMiddleLCM722.lean').read_text().replace('import MarkovMiddleChart1M722','import MarkovMiddleLowDirectM722').replace('import MarkovMiddleChart3M722','import MarkovMiddleHighDirectM5DC')
s=s.replace('middle_chart1M722 (c-5) 0 J E (by omega) (by omega)','middle_low_directM722 (c-5) J E (by omega)').replace('middle_chart3M722 0 (c-5) J E (by omega) (by omega)','middle_high_directM5DC (c-5) J E (by omega)')
s=s.replace('MarkovMiddleChart0M722','MarkovMiddleChart0M5DC').replace('MarkovMiddleChart2M722','MarkovMiddleChart2M5DC').replace('middle_chart0M722','middle_chart0M5DC').replace('middle_chart2M722','middle_chart2M5DC').replace('middleRawValue_lcM722','middleRawValue_lcM5DC')
save('MarkovMiddleLCM5DC',s);inventory['assembly'].append('MarkovMiddleLCM5DC')
for name in ['MarkovMiddleSource','MarkovFourthUpper','MarkovResidualFull']:
 s=(D/f'{name}M722.lean').read_text()
 for a,b in [('MarkovMiddleLCM722','MarkovMiddleLCM5DC'),('MarkovMiddleSourceM722','MarkovMiddleSourceM5DC'),('MarkovFourthUpperM722','MarkovFourthUpperM5DC'),('source_fourth_middleM722','source_fourth_middleM5DC'),('middleRawValue_lcM722','middleRawValue_lcM5DC'),('source_fourth_upperM722','source_fourth_upperM5DC'),('FinalFourthRegionFullM722','FinalFourthRegionFullM5DC'),('InteriorCore63FullM722','InteriorCore63FullM5DC'),('root_iff_coreFullM722','root_iff_coreFullM5DC')]:s=s.replace(a,b)
 save(f'{name}M5DC',s);inventory['assembly'].append(f'{name}M5DC')
(O/'inventory.json').write_text(json.dumps(inventory,indent=2)+'\n');print({k:len(v) for k,v in inventory.items()})
