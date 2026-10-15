"""Machine-authored exact algebra candidates; Lean checks every expansion."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
charts=[]
for i,j in [(0,1),(1,0)]:
 A=f'(2+(x+{i}))';B=f'(3*{A}+(y+{j}))';charts.append(('low',i,j,[A,B,'0','0','0']))
for i,j in [(0,4),(1,2),(2,1),(3,0)]:
 x=f'(x+{i})';y=f'(y+{j})'
 charts.append(('midlow',i,j,[f'({x}+{y})',f'(3*{x}+2*{y})','0',y,'0']))
 charts.append(('midhigh',i,j,[f'(2*{x}+{y})',f'(3*{x}+2*{y})',x,f'({x}+{y})','0']))
for i,j in [(1,4),(2,1),(3,0)]:
 x=f'(x+{i})';y=f'(y+{j})';charts.append(('high',i,j,[f'(2*{x}+{y})',f'(3*{x}+{y})',f'({x}+{y})',x,y]))
s='''import MarkovHorizontalSeedM13D
/-! Machine-authored request 13d40bd7. Exact nonnegative polynomial certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
'''
for name,i,j,args in charts:
 s+=f'\ntheorem h3chart_{name}_{i}_{j}M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :\n H3BoundsM13D {" ".join(args)} := by\n unfold H3BoundsM13D\n refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩\n'
 for k in range(10):
  s+=' · '
  if k>=6:s+='apply sub_nonneg.mp\n   '
  s+='simp only [h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D]\n   ring_nf <;> positivity\n'
s+='end\nend MathGKM.Markov\n';(R/'research/MarkovHorizontalChartsM13D.lean').write_text(s)
