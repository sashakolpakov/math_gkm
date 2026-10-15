import MarkovGaugeNorm00BC
import MarkovGaugeNorm01BC
import MarkovGaugeNorm10BC
import MarkovGaugeNorm11BC
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def localFourNum1101BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12 + 24*x + 516*x^2 + 3624*x^3 + 12654*x^4 + 26016*x^5 + 35280*x^6 + 32928*x^7 + 20808*x^8 + 8520*x^9 + 2172*x^10 + 312*x^11 + 6*x^12 + -5664*Z*x^3 + -13824*Z*x^4 + -18240*Z*x^5 + -24960*Z*x^6 + -19968*Z*x^7 + -3840*Z*x^8 + 576*Z*x^9 + -384*Z*x^10 + 288*Z*x^11 + 2016*Z^2*x^4 + -672*Z^2*x^5 + -22752*Z^2*x^6 + -18336*Z^2*x^7 + 5472*Z^2*x^8 + -5856*Z^2*x^9 + -6048*Z^2*x^10 + 3360*Z^2*x^11 + -192*Z^2*x^12 + 1152*Z^3*x^6 + 2880*Z^3*x^7 + -3072*Z^3*x^8 + -18240*Z^3*x^9 + -384*Z^3*x^10 + 9408*Z^3*x^11 + -3840*Z^3*x^12 + -192*Z^3*x^13 + 96*Z^4*x^8 + 960*Z^4*x^9 + -288*Z^4*x^10 + -1152*Z^4*x^11 + -2784*Z^4*x^12 + 1728*Z^4*x^13 + -96*Z^4*x^14 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -4768*N*Z*x^3 + -13536*N*Z*x^4 + -10560*N*Z*x^5 + 1472*N*Z*x^6 + 7296*N*Z*x^7 + 9984*N*Z*x^8 + 8512*N*Z*x^9 + 2112*N*Z*x^10 + -480*N*Z*x^11 + -32*N*Z*x^12 + 2208*N*Z^2*x^4 + -288*N*Z^2*x^5 + -17280*N*Z^2*x^6 + -16128*N*Z^2*x^7 + 14016*N*Z^2*x^8 + 17856*N*Z^2*x^9 + -384*N*Z^2*x^10 + -1536*N*Z^2*x^11 + 1440*N*Z^2*x^12 + 96*N*Z^2*x^13 + 576*N*Z^3*x^6 + 2112*N*Z^3*x^7 + -2496*N*Z^3*x^8 + -8640*N*Z^3*x^9 + 192*N*Z^3*x^10 + 7872*N*Z^3*x^11 + 1728*N*Z^3*x^12 + -1344*N*Z^3*x^13 + -1344*N^2*Z*x^3 + -4032*N^2*Z*x^4 + -1536*N^2*Z*x^5 + 6144*N^2*Z*x^6 + 6528*N^2*Z*x^7 + -384*N^2*Z*x^8 + -3072*N^2*Z*x^9 + -1536*N^2*Z*x^10 + -576*N^2*Z*x^11 + -192*N^2*Z*x^12 + 576*N^2*Z^2*x^4 + 192*N^2*Z^2*x^5 + -3840*N^2*Z^2*x^6 + -3840*N^2*Z^2*x^7 + 4992*N^2*Z^2*x^8 + 7296*N^2*Z^2*x^9 + -768*N^2*Z^2*x^10 + -3840*N^2*Z^2*x^11 + -960*N^2*Z^2*x^12 + 192*N^2*Z^2*x^13 + -128*N^3*Z*x^3 + -384*N^3*Z*x^4 + 1024*N^3*Z*x^6 + 768*N^3*Z*x^7 + -768*N^3*Z*x^8 + -1024*N^3*Z*x^9 + 384*N^3*Z*x^11 + 128*N^3*Z*x^12
theorem localFour_normalize_1101BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n true true false true=
 localFourNum1101BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC,gauge_normalize_01d4BC,gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC,gauge_normalize_10d4BC,gauge_normalize_11a1BC,gauge_normalize_11a2BC,gauge_normalize_11b2BC,gauge_normalize_11b3BC,gauge_normalize_11c1BC,gauge_normalize_11c2BC,gauge_normalize_11c3BC,gauge_normalize_11d1BC,gauge_normalize_11d2BC,gauge_normalize_11d3BC,gauge_normalize_11d4BC]
 simp only [gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,localFourNum1101BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
