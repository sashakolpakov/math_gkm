"""Machine-authored proof-script repairs; retained prior build snapshots record failures."""
from pathlib import Path
for c in range(3):
 p=Path(f'research/MarkovHighCone{c}ExpandM81F.lean')
 lines=p.read_text().splitlines()
 for i,s in enumerate(lines):
  if s.startswith(' unfold highJM81F highHM81F highIM81F '):
   lines[i]=' simp only ['+','.join(s.strip()[7:].split())+']'
 p.write_text('\n'.join(lines)+'\n')
 for r in [5,6]:
  p=Path(f'research/MarkovHighCone{c}Cert{r}M81F.lean')
  p.write_text(p.read_text().replace(' rw [he]\n positivity',' rw [he] <;> positivity'))
p=Path('research/MarkovHighSourceM81F.lean')
p.write_text(p.read_text().replace('=(frame path).mid.a+k by omega','=(frame path).mid.a-1+k by omega'))
p=Path('research/MarkovHighScalingM81F.lean')
s=p.read_text().replace(' simpa only [Nat.add_zero] using h',' linear_combination h')
s=s.replace(' linear_combination ((k:ℝ)+1)*h',' linear_combination (norm := (simp only [highHM81F]; ring_nf)) ((k:ℝ)+1)*h')
s=s.replace(' linear_combination ((k:ℝ)+1)*(k+2)*h',' linear_combination (norm := (simp only [highIM81F]; ring_nf)) ((k:ℝ)+1)*(k+2)*h')
p.write_text(s)
