import MarkovFourthRunMomentBE
import MarkovThirdOneBridge8BBB
import MarkovQuinticE273
/-! Machine-authored be5676f9. Exact local fourth moment for run one. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def oneLocalFourBE : Bool → Bool → Bool → Bool → ℤ[X]
 | false, false, false, false => -12 + -72*X + 276*X^2 + 1800*X^3 + 2310*X^4 + -192*X^5 + -1152*X^6 + 96*X^7
 | false, false, false, true => -12 + -72*X + 276*X^2 + 1800*X^3 + 2310*X^4 + -192*X^5 + -1200*X^6 + 96*X^7 + 96*X^8
 | false, false, true, false => -12 + -72*X + 276*X^2 + 1800*X^3 + 2694*X^4 + 384*X^5 + -2112*X^6 + -1536*X^7 + -288*X^8
 | false, false, true, true => -12 + -72*X + 276*X^2 + 1800*X^3 + 2694*X^4 + 384*X^5 + -2112*X^6 + -1584*X^7 + -288*X^8 + 96*X^9
 | false, true, false, false => -18 + -216*X + -1212*X^2 + -3048*X^3 + -3108*X^4 + -48*X^5 + 2016*X^6 + 1152*X^7 + 192*X^8
 | false, true, false, true => -18 + -216*X + -1212*X^2 + -3048*X^3 + -3108*X^4 + -48*X^5 + 1968*X^6 + 864*X^7 + -192*X^8 + -96*X^9
 | false, true, true, false => -18 + -216*X + -1212*X^2 + -3048*X^3 + -2724*X^4 + 3120*X^5 + 10224*X^6 + 10224*X^7 + 4512*X^8 + 672*X^9
 | false, true, true, true => -18 + -216*X + -1212*X^2 + -3048*X^3 + -2724*X^4 + 3120*X^5 + 10224*X^6 + 10176*X^7 + 4224*X^8 + 288*X^9 + -96*X^10
 | true, false, false, false => -12 + -72*X + 228*X^2 + 1800*X^3 + 3510*X^4 + 2736*X^5 + 528*X^6 + -288*X^7
 | true, false, false, true => -12 + -72*X + 228*X^2 + 1800*X^3 + 3510*X^4 + 2736*X^5 + 480*X^6 + -288*X^7 + 96*X^8 + 96*X^9
 | true, false, true, false => -12 + -72*X + 228*X^2 + 1800*X^3 + 3894*X^4 + 3312*X^5 + -432*X^6 + -2976*X^7 + -2112*X^8 + -480*X^9
 | true, false, true, true => -12 + -72*X + 228*X^2 + 1800*X^3 + 3894*X^4 + 3312*X^5 + -432*X^6 + -3024*X^7 + -2112*X^8 + -384*X^9 + 96*X^10
 | true, true, false, false => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1908*X^4 + 5568*X^5 + 13680*X^6 + 13440*X^7 + 6432*X^8 + 1056*X^9 + -192*X^10
 | true, true, false, true => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1908*X^4 + 5568*X^5 + 13632*X^6 + 13152*X^7 + 6048*X^8 + 960*X^9 + -96*X^10
 | true, true, true, false => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1524*X^4 + 8736*X^5 + 21888*X^6 + 22512*X^7 + 9504*X^8 + -672*X^9 + -1440*X^10
 | true, true, true, true => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1524*X^4 + 8736*X^5 + 21888*X^6 + 22464*X^7 + 9216*X^8 + -1056*X^9 + -1536*X^10 + 96*X^11
theorem runLocalFour_oneBE (p q r s : Bool) :
 runLocalFourBE 1 p q r s=oneLocalFourBE p q r s := by
 cases p <;> cases q <;> cases r <;> cases s <;>
   simp only [runLocalFourBE,localFour01F,oneGauge_formula_008BBB,oneGauge_formula_018BBB,
     oneGauge_formula_108BBB,oneGauge_formula_118BBB,U,Polynomial.coeff_add,
     Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,oneLocalFourBE] <;>
   norm_num <;> ring

end
end MathGKM.Markov
