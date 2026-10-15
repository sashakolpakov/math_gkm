import MarkovFourthRunMomentBE
import MarkovSmallPoly2FD
import MarkovFourthGauge2K062
/-! Machine-authored 062809ba. Exact local fourth moment for run two. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def twoLocalFourK062 : Bool → Bool → Bool → Bool → ℤ[X]
 | false, false, false, false => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1524*X^4 + 8736*X^5 + 21888*X^6 + 22464*X^7 + 9216*X^8 + -1056*X^9 + -1536*X^10 + 96*X^11
 | false, false, false, true => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1524*X^4 + 8736*X^5 + 21888*X^6 + 22464*X^7 + 9168*X^8 + -1344*X^9 + -1920*X^10 + 96*X^12
 | false, false, true, false => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1524*X^4 + 9216*X^5 + 25920*X^6 + 33600*X^7 + 23520*X^8 + 6720*X^9 + -1824*X^10 + -1728*X^11 + -288*X^12
 | false, false, true, true => -18 + -216*X + -1260*X^2 + -3048*X^3 + -1524*X^4 + 9216*X^5 + 25920*X^6 + 33600*X^7 + 23520*X^8 + 6672*X^9 + -2112*X^10 + -2112*X^11 + -384*X^12 + 96*X^13
 | false, true, false, false => -24 + -360*X + -2796*X^2 + -13224*X^3 + -39150*X^4 + -75552*X^5 + -96864*X^6 + -81216*X^7 + -40992*X^8 + -8832*X^9 + 1824*X^10 + 1344*X^11 + 192*X^12
 | false, true, false, true => -24 + -360*X + -2796*X^2 + -13224*X^3 + -39150*X^4 + -75552*X^5 + -96864*X^6 + -81216*X^7 + -41040*X^8 + -9120*X^9 + 960*X^10 + 192*X^11 + -480*X^12 + -96*X^13
 | false, true, true, false => -24 + -360*X + -2796*X^2 + -13224*X^3 + -39150*X^4 + -75072*X^5 + -92832*X^6 + -64320*X^7 + -1392*X^8 + 46992*X^9 + 50496*X^10 + 26976*X^11 + 7392*X^12 + 672*X^13
 | false, true, true, true => -24 + -360*X + -2796*X^2 + -13224*X^3 + -39150*X^4 + -75072*X^5 + -92832*X^6 + -64320*X^7 + -1392*X^8 + 46944*X^9 + 50208*X^10 + 26112*X^11 + 6240*X^12 + -96*X^14
 | true, false, false, false => -18 + -216*X + -1260*X^2 + -3096*X^3 + -1524*X^4 + 9792*X^5 + 27168*X^6 + 34560*X^7 + 24432*X^8 + 8832*X^9 + 768*X^10 + -384*X^11
 | true, false, false, true => -18 + -216*X + -1260*X^2 + -3096*X^3 + -1524*X^4 + 9792*X^5 + 27168*X^6 + 34560*X^7 + 24384*X^8 + 8544*X^9 + 384*X^10 + -480*X^11 + 96*X^12 + 96*X^13
 | true, false, true, false => -18 + -216*X + -1260*X^2 + -3096*X^3 + -1524*X^4 + 10272*X^5 + 31200*X^6 + 45696*X^7 + 38736*X^8 + 16608*X^9 + -960*X^10 + -5184*X^11 + -2592*X^12 + -480*X^13
 | true, false, true, true => -18 + -216*X + -1260*X^2 + -3096*X^3 + -1524*X^4 + 10272*X^5 + 31200*X^6 + 45696*X^7 + 38736*X^8 + 16560*X^9 + -1248*X^10 + -5568*X^11 + -2688*X^12 + -384*X^13 + 96*X^14
 | true, true, false, false => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74496*X^5 + -91584*X^6 + -64800*X^7 + -7344*X^8 + 36960*X^9 + 43392*X^10 + 25536*X^11 + 8256*X^12 + 1056*X^13 + -192*X^14
 | true, true, false, true => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74496*X^5 + -91584*X^6 + -64800*X^7 + -7392*X^8 + 36672*X^9 + 42528*X^10 + 24384*X^11 + 7584*X^12 + 960*X^13 + -96*X^14
 | true, true, true, false => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74016*X^5 + -87552*X^6 + -47904*X^7 + 32256*X^8 + 92784*X^9 + 92064*X^10 + 49536*X^11 + 11904*X^12 + -1344*X^13 + -1440*X^14
 | true, true, true, true => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74016*X^5 + -87552*X^6 + -47904*X^7 + 32256*X^8 + 92736*X^9 + 91776*X^10 + 48672*X^11 + 10752*X^12 + -2016*X^13 + -1536*X^14 + 96*X^15
theorem runLocalFour_twoK062 (p q r s : Bool) :
 runLocalFourBE 2 p q r s=twoLocalFourK062 p q r s := by
 cases p <;> cases q <;> cases r <;> cases s <;>
   simp only [runLocalFourBE,localFour01F,gauge2_00K062,gauge2_01K062,
     gauge2_10K062,gauge2_11K062,U,Polynomial.coeff_add,
     Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,twoLocalFourK062] <;>
   norm_num <;> ring

end
end MathGKM.Markov
