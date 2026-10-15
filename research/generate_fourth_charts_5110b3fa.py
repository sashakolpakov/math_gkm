"""Machine-authored chart/coverage generation; all claims checked by Lean."""
from fourth_charts_5110b3fa import *
names=['x','y','q','t','u','v','w','z','xx','h']
head='''/-! Machine-authored request 5110b3fa. Exact fourth horizontal seed certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
'''
s='import MarkovHorizontalFourthSeedM511\n'+head
s+='''
def H4GoodM511 (a b q t u v w z : ℝ) : Prop :=
 H4BoundsM511 a b q t u v w z ∧
 h4c0M511 a b q t u v w z ≤ h4c1M511 a b q t u v w z ∧
 h4c1M511 a b q t u v w z ≤ h4c2M511 a b q t u v w z
end
end MathGKM.Markov
'''
(R/'research/MarkovHorizontalFourthGoodM511.lean').write_text(s)
modules=[]
for name,al,be,ga,de in cones:
 mod='MarkovH4Chart'+name.capitalize()+'M511';modules.append(mod)
 s='import MarkovHorizontalFourthGoodM511\n'+head
 for d in charts:
  if d['name']!=name:continue
  i,j=d['i'],d['j'];args=' '.join('('+lean(p,names)+')' for p in d['args'])
  s+=f'\ntheorem h4chart_{name}_{i}_{j}M511 (x y : ℝ) (hx : 0≤x) (hy : 0≤y) :\n H4GoodM511 {args} := by\n unfold H4GoodM511 H4BoundsM511\n refine ⟨⟨'+','.join('?_' for _ in range(14))+'⟩,?_,?_⟩\n'
  for k in range(16):
   s+=' · '
   if k>=8:s+='apply sub_nonneg.mp\n   '
   s+='simp only ['+','.join(f'h4c{l}M511' for l in range(8))+']\n   ring_nf <;> positivity\n'
 s+='end\nend MathGKM.Markov\n';(R/f'research/{mod}.lean').write_text(s)
(O/'chart-modules.json').write_text(json.dumps(modules)+'\n')
print(json.dumps(modules))
