"""Machine-authored direct one-parameter assembly, avoiding redundant zero columns."""
from pathlib import Path
import re
R=Path('/Users/sasha/math_gkm/research')
names=re.findall(r'^def (midP\w+)',(R/'MarkovMiddleBase1M722.lean').read_text(),re.M)
s=''.join(f'import MarkovMiddleValue1_{i}M722\n' for i in range(3))+''.join(f'import MarkovMiddleGap1_{b}M722\n' for b in range(9))
s+='/-! Machine-authored 722898f8. Direct low extreme chart, all degree columns retained. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 32768\nattribute [local irreducible] '+' '.join(names)+'\n'
v=lambda i:f'middleShape0M722 (J+E+6) (C+5) 1 (2*(J+E+6)+J+{6+i})'
d=lambda i:' + '.join(f'midP1_{i}_0_{b}M722 J E*C^{b}' for b in range(5))
g=' + '.join(f'midG1_0_{b}M722 J E*C^{b}' for b in range(9))
s+=f'\ntheorem middle_low_directM722 (C J E : ℤ) (hC : 0  ≤  C) (hJ : 0  ≤  J) (hE : 0  ≤  E) : {v(0)}*{v(2)} ≤ {v(1)}^2 := by\n apply sub_nonneg.mp\n rw ['+','.join(f'middle_value1_{i}M722 C 0 J E' for i in range(3))+']\n unfold '+' '.join(f'midCol1_{i}_{b}M722' for i in range(3) for b in range(5))+'\n simp only [pow_zero,mul_one]\n'
s+=f' have he : ({d(1)})^2-({d(0)})*({d(2)})={g} := by\n  rw ['+','.join(f'←middle_gap_eq1_0_{b}M722' for b in range(9))+']\n  ring\n'
for b in range(9):s+=f' have h{b} := middle_gap_nonneg1_0_{b}M722 J E hJ hE\n'
s+=f' have hp : 0  ≤  {g} := by positivity\n nlinarith only [he,hp]\nend\nend MathGKM.Markov\n'
(R/'MarkovMiddleLowDirectM722.lean').write_text(s)
p=R/'MarkovMiddleOneM722.lean';s=p.read_text().replace('import MarkovMiddleChart1M722','import MarkovMiddleLowDirectM722').replace('middle_chart1M722 (c-5) 0 J E (by omega) (by omega)','middle_low_directM722 (c-5) J E (by omega)');p.write_text(s)
