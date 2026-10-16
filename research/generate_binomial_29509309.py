"""Machine-authored staged binomial identities, checked independently by Lean."""
from pathlib import Path
from poly_probe_0d346fa7 import X,choose
from generate_staged_29509309 import expr
src='''import MarkovBinomialPolyM0D3
/-! Machine-authored 29509309. Reusable exact expansions, not axioms. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 4096
'''
for k in range(29):
 src+=f'\ntheorem binomial_poly_{k}M295 (x : ℚ) :\n choosePolyM0D3 x {k} = {expr(choose(X,k))} := by\n'
 if k==0:src+=' simp [choose_poly_zeroM0D3]\n'
 else:src+=f''' have h := choose_poly_succM0D3 x {k-1}
 norm_num only at h
 rw [h,binomial_poly_{k-1}M295]
 ring
'''
src+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovBinomialTableM295.lean').write_text(src)
print(len(src))
