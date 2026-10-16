import MarkovColumn3MAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def verticalGap1MAE9 (d x : ℚ) : ℚ := (x+2)*(x+3)*(x+3)*(x+4)*(x+4)*(x+5)*(x+5)*(x+6)*(x+6)*(x+7)*(19800*d^6*x^4+356400*d^6*x^3+2385900*d^6*x^2+7038900*d^6*x+7900200*d^6+211200*d^5*x^5+4158000*d^5*x^4+32188200*d^5*x^3+122393700*d^5*x^2+230534700*d^5*x+171309600*d^5+951555*d^4*x^6+20411985*d^4*x^5+179505975*d^4*x^4+829084575*d^4*x^3+2131509270*d^4*x^2+2884506240*d^4*x+1590850800*d^4+2315340*d^3*x^7+53902110*d^3*x^6+531085050*d^3*x^5+2874712350*d^3*x^4+9257265810*d^3*x^3+17693253840*d^3*x^2+18466953300*d^3*x+8054877600*d^3+3204290*d^2*x^8+80624340*d^2*x^7+879939075*d^2*x^6+5447450085*d^2*x^5+20945073885*d^2*x^4+51092750535*d^2*x^3+76825886650*d^2*x^2+64701031740*d^2*x+23229498600*d^2+2387580*d*x^9+64654090*d*x^8+774169020*d*x^7+5383693260*d*x^6+23961080820*d*x^5+70595756610*d*x^4+137078595780*d*x^3+168286391240*d*x^2+117952064400*d*x+35822001600*d+747099*x^10+21681555*x^9+282491060*x^8+2176349130*x^7+10969952667*x^6+37698512175*x^5+89093920590*x^4+142350461220*x^3+146545068184*x^2+87472595520*x+22932201600)/9053130240000
theorem vertical_identity1MAE9 (d x : ℚ) :
 column3MAE9 (3*x+7+d) (x+1)^2-column3MAE9 (3*x+7+d) x*column3MAE9 (3*x+7+d) (x+2)=verticalGap1MAE9 d x := by
 unfold column3MAE9 verticalGap1MAE9
 ring
theorem vertical_nonneg1MAE9 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 ≤ verticalGap1MAE9 d x := by
 unfold verticalGap1MAE9
 positivity
end
end MathGKM.Markov
