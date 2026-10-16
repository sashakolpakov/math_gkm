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
def horizontalGap1MAE9 (d x : ℚ) : ℚ := (x+2)*(x+2)*(x+3)*(x+3)*(x+4)*(x+4)*(x+5)*(x+5)*(x+6)*(3300*d^4*x^5+67980*d^4*x^4+571890*d^4*x^3+2463780*d^4*x^2+5449290*d^4*x+4948020*d^4+22880*d^3*x^6+482020*d^3*x^5+4229280*d^3*x^4+19656560*d^3*x^3+50337760*d^3*x^2+65206680*d^3*x+30755340*d^3+59576*d^2*x^7+1283392*d^2*x^6+11721006*d^2*x^5+58304510*d^2*x^4+168021964*d^2*x^3+273098298*d^2*x^2+222446994*d^2*x+68108040*d^2+69060*d*x^8+1521076*d*x^7+14434712*d*x^6+76364046*d*x^5+242943190*d*x^4+466176914*d*x^3+513132078*d*x^2+289774044*d*x+63257040*d+30079*x^9+677372*x^8+6670057*x^7+37343774*x^6+129431121*x^5+283347328*x^4+384386503*x^3+306212326*x^2+128019360*x+20956320)/50295168000
theorem horizontal_identity1MAE9 (d x : ℚ) :
 column2MAE9 (3*(x+1)+1+d) (x+1)^2-column1MAE9 (3*(x+1)+1+d) (x+1)*column3MAE9 (3*(x+1)+1+d) (x+1)=horizontalGap1MAE9 d x := by
 unfold column1MAE9 column2MAE9 column3MAE9 horizontalGap1MAE9
 ring
theorem horizontal_nonneg1MAE9 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 ≤ horizontalGap1MAE9 d x := by
 unfold horizontalGap1MAE9
 positivity
end
end MathGKM.Markov
