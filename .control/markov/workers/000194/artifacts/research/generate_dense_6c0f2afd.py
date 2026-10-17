"""Machine-authored ordinary-kernel certificates; no model or controller calls."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6c0f2afd'
for c,K in [(4,0),(5,1),(6,1),(7,2),(8,2),(9,2)]:
 name=f'MarkovMiddleDenseC{c+3}M6C0'
 s=f'''import MarkovMiddleExpressionM6C0
import MarkovMiddleFiveResidualMF8D
/-! Machine-authored 6c0f2afd. Full raw gap: no mixed contribution omitted.
The finite polynomial calculation is a kernel-checked universal identity. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000
'''
 for r in ['false','true']:
  s+=f'''
theorem middle_dense_{c}_{r}M6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 {K} {r} {c})) := by decide +kernel
'''
 s+=f'''
theorem middle_gap_{c}_shiftM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r {c} x (k+{K}) := by
 cases r
 · exact middle_gap_dense_transferM6C0 {K} {c} false middle_dense_{c}_falseM6C0 x k
 · exact middle_gap_dense_transferM6C0 {K} {c} true middle_dense_{c}_trueM6C0 x k

theorem middle_gap_{c}_nonnegM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r {c} x k := by
 by_cases hk : {K} ≤ k
 · simpa only [Nat.sub_add_cancel hk] using middle_gap_{c}_shiftM6C0 x (k-{K}) r
 · exact middle_gap_first_two_baseMF8D x k {c} r (by omega)

end MathGKM.Markov
'''
 (R/'research'/f'{name}.lean').write_text(s)
print('Generated six new candidate modules, not yet validated.')
