"""Machine-authored alternate discrete proof split. Certificates are untrusted until Lean checks."""
from poly_probe_0d346fa7 import *
from generate_staged_29509309 import expr
from newton_probe_0d346fa7 import lower,diffs
R=Path('research')
head='''import MarkovEightLowerPolyM295
import MarkovBinomialTableM295
import MarkovNewtonM295
/-! Machine-authored 29509309. Alternative split at the natural offset zero. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 64000000
set_option maxRecDepth 8192
'''
pos=gap(L(X,add(Y,const(3)),8),L(add(X,one),add(Y,const(2)),8),L(add(X,const(2)),add(Y,one),8))
assert all(v>=0 for v in pos.values())
src=head+f'\ndef lowerPositiveGapM295 (x y : ℚ) : ℚ := {expr(pos)}\n'
src+='''theorem lower_positive_gapM295 (x y : ℚ) :
 lowerPolynomialM0D3 8 (x+1) (y+2)^2 -
 lowerPolynomialM0D3 8 x (y+3)*lowerPolynomialM0D3 8 (x+2) (y+1) =
 lowerPositiveGapM295 x y := by
 simp_rw [lower_eight_polyM295]
 unfold lowerEightPolyM295 lowerPositiveGapM295
 ring

theorem lower_positive_gap_nonnegM295 (x y : ℚ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 0 ≤ lowerPolynomialM0D3 8 (x+1) (y+2)^2 -
 lowerPolynomialM0D3 8 x (y+3)*lowerPolynomialM0D3 8 (x+2) (y+1) := by
 rw [lower_positive_gapM295]
 unfold lowerPositiveGapM295
 positivity
end
end MathGKM.Markov
'''
(R/'MarkovEightPositiveM295.lean').write_text(src)
cs=diffs([lower(x+1,1,8)**2-lower(x,2,8)*lower(x+2,0,8) for x in range(29)])
assert all(c>=0 for c in cs)
src=head+'\ndef lowerZeroGapM295 (x : ℚ) : ℚ :=\n '+' +\n '.join(str(c)+f' * choosePolyM0D3 x {k}' for k,c in enumerate(cs) if c)+'\n'
src+='''theorem lower_zero_gapM295 (x : ℚ) :
 lowerPolynomialM0D3 8 (x+1) 1^2 -
 lowerPolynomialM0D3 8 x 2*lowerPolynomialM0D3 8 (x+2) 0 = lowerZeroGapM295 x := by
 simp_rw [lower_eight_polyM295]
 unfold lowerEightPolyM295 lowerZeroGapM295
 simp only ['''+', '.join('binomial_poly_'+str(k)+'M295' for k,c in enumerate(cs) if c)+''']
 ring

theorem lower_zero_gap_nonnegM295 (x : ℕ) :
 0 ≤ lowerPolynomialM0D3 8 ((x:ℚ)+1) 1^2 -
 lowerPolynomialM0D3 8 x 2*lowerPolynomialM0D3 8 ((x:ℚ)+2) 0 := by
 rw [lower_zero_gapM295]
 unfold lowerZeroGapM295
'''
for k,c in enumerate(cs):
 if c:src+=f' have hx{k} := choose_poly_nat_nonnegM295 x {k}\n'
src+=' positivity\nend\nend MathGKM.Markov\n'
(R/'MarkovEightZeroM295.lean').write_text(src)
print('Generated alternate certificates')
