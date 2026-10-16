import MarkovColumn1MAE9
import MarkovColumn2MAE9
import MarkovColumn3MAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def diagonalGap1MAE9 (d x : ℚ) : ℚ := (x+2)*(x+3)*(x+3)*(x+4)*(x+4)*(x+5)*(x+5)*(x+6)*(x+6)*(3300*d^4*x^5+64020*d^4*x^4+508530*d^4*x^3+2053260*d^4*x^2+4192650*d^4*x+3460380*d^4+22880*d^3*x^6+484220*d^3*x^5+4352480*d^3*x^4+21137600*d^3*x^3+58298240*d^3*x^2+86618840*d^3*x+54298860*d^3+59576*d^2*x^7+1366464*d^2*x^6+13681734*d^2*x^5+77094930*d^2*x^4+263356764*d^2*x^3+545453766*d^2*x^2+634804786*d^2*x+320295360*d^2+69060*d*x^8+1707244*d*x^7+18816696*d*x^6+120163626*d*x^5+485183550*d*x^4+1268128446*d*x^3+2095897734*d*x^2+2001780284*d*x+844203360*d+30079*x^9+797716*x^8+9590225*x^7+68273066*x^6+316498517*x^5+990400244*x^4+2091882955*x^3+2873648494*x^2+2325040704*x+841357440)/50295168000
theorem diagonal_identity1MAE9 (d x : ℚ) :
 column2MAE9 (3*x+7+d) (x+1)^2-column1MAE9 (3*x+7+d) (x+2)*column3MAE9 (3*x+7+d) x=diagonalGap1MAE9 d x := by
 unfold column1MAE9 column2MAE9 column3MAE9 diagonalGap1MAE9
 ring
theorem diagonal_nonneg1MAE9 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 ≤ diagonalGap1MAE9 d x := by
 unfold diagonalGap1MAE9
 positivity
end
end MathGKM.Markov
