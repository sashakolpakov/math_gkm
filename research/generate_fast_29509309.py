"""Machine-authored grouped Newton certificate. Lean must check the identity."""
from pathlib import Path
from fractions import Fraction as F
import json
O=Path('evidence/markov-29509309')
co={(a,b):int(v) for a,b,v in json.loads((O/'basis-lower-i8.json').read_text())['newton']}
groups=[]
for b in sorted({b for a,b in co}):
 row=' + '.join(str(co[a,b])+(' * choosePolyM0D3 x '+str(a) if a else '') for a in sorted({a for a,bb in co if bb==b}))
 groups.append('('+row+')'+(' * choosePolyM0D3 y '+str(b) if b else ''))
src='''import MarkovEightLowerPolyM295
import MarkovBinomialTableM295
import MarkovNewtonM295
/-! Machine-authored 29509309. Grouping changes only evaluation cost. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 64000000
set_option maxRecDepth 8192
def lowerGapEightFastM295 (x y : ℚ) : ℚ :=
 '''+' +\n '.join(groups)+'''

theorem lower_gap_eight_fastM295 (x y : ℚ) :
 lowerPolynomialM0D3 8 (x+1) (y+1)^2 -
 lowerPolynomialM0D3 8 x (y+2)*lowerPolynomialM0D3 8 (x+2) y =
 lowerGapEightFastM295 x y := by
 simp_rw [lower_eight_polyM295]
 unfold lowerEightPolyM295 lowerGapEightFastM295
 simp only ['''+', '.join('binomial_poly_'+str(k)+'M295' for k in range(29))+''']
 ring

theorem lower_gap_eight_fast_nonnegM295 (x y : ℕ) :
 0 ≤ lowerPolynomialM0D3 8 ((x:ℚ)+1) ((y:ℚ)+1)^2 -
 lowerPolynomialM0D3 8 x ((y:ℚ)+2)*lowerPolynomialM0D3 8 ((x:ℚ)+2) y := by
 rw [lower_gap_eight_fastM295]
 unfold lowerGapEightFastM295
'''
for k in sorted({a for a,b in co if a}):src+=f' have hx{k} := choose_poly_nat_nonnegM295 x {k}\n'
for k in sorted({b for a,b in co if b}):src+=f' have hy{k} := choose_poly_nat_nonnegM295 y {k}\n'
src+=' positivity\n\nend\nend MathGKM.Markov\n'
Path('research/MarkovEightNewtonM295.lean').write_text(src)
print(len(src))
