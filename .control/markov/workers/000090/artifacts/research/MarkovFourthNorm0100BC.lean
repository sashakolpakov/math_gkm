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

def localFourNum0100BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12 + 24*x + 516*x^2 + 3624*x^3 + 12654*x^4 + 26016*x^5 + 35280*x^6 + 32928*x^7 + 20808*x^8 + 8520*x^9 + 2172*x^10 + 312*x^11 + 6*x^12 + 48*Z*x + -384*Z*x^2 + -5376*Z*x^3 + -13200*Z*x^4 + -19296*Z*x^5 + -24576*Z*x^6 + -19008*Z*x^7 + -4896*Z*x^8 + 432*Z*x^9 + 192*Z*x^11 + 48*Z*x^12 + -144*Z^2*x^2 + 672*Z^2*x^3 + 4320*Z^2*x^4 + -9504*Z^2*x^5 + -19968*Z^2*x^6 + -5088*Z^2*x^7 + -6048*Z^2*x^8 + -8544*Z^2*x^9 + 144*Z^2*x^10 + 960*Z^2*x^11 + 192*Z^2*x^12 + 192*Z^3*x^3 + -768*Z^3*x^4 + -1728*Z^3*x^5 + 11520*Z^3*x^6 + -4800*Z^3*x^7 + -18048*Z^3*x^8 + 1728*Z^3*x^9 + 1536*Z^3*x^10 + -1536*Z^3*x^11 + -384*Z^3*x^12 + -96*Z^4*x^4 + 384*Z^4*x^5 + 96*Z^4*x^6 + -3264*Z^4*x^7 + 6432*Z^4*x^8 + -1536*Z^4*x^9 + -3552*Z^4*x^10 + -192*Z^4*x^11 + 192*Z^4*x^12 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -4768*N*Z*x^3 + -13536*N*Z*x^4 + -10560*N*Z*x^5 + 1472*N*Z*x^6 + 7296*N*Z*x^7 + 9984*N*Z*x^8 + 8512*N*Z*x^9 + 2112*N*Z*x^10 + -480*N*Z*x^11 + -32*N*Z*x^12 + 3648*N*Z^2*x^4 + -2688*N*Z^2*x^5 + -20736*N*Z^2*x^6 + -8832*N*Z^2*x^7 + 15744*N*Z^2*x^8 + 10368*N*Z^2*x^9 + 768*N*Z^2*x^10 + 1152*N*Z^2*x^11 + 576*N*Z^2*x^12 + -960*N*Z^3*x^5 + 3648*N*Z^3*x^6 + 2112*N*Z^3*x^7 + -10176*N*Z^3*x^8 + -4416*N*Z^3*x^9 + 6336*N*Z^3*x^10 + 3264*N*Z^3*x^11 + 192*N*Z^3*x^12 + -1344*N^2*Z*x^3 + -4032*N^2*Z*x^4 + -1536*N^2*Z*x^5 + 6144*N^2*Z*x^6 + 6528*N^2*Z*x^7 + -384*N^2*Z*x^8 + -3072*N^2*Z*x^9 + -1536*N^2*Z*x^10 + -576*N^2*Z*x^11 + -192*N^2*Z*x^12 + 768*N^2*Z^2*x^4 + -4608*N^2*Z^2*x^6 + -3072*N^2*Z^2*x^7 + 6144*N^2*Z^2*x^8 + 6144*N^2*Z^2*x^9 + -1536*N^2*Z^2*x^10 + -3072*N^2*Z^2*x^11 + -768*N^2*Z^2*x^12 + -128*N^3*Z*x^3 + -384*N^3*Z*x^4 + 1024*N^3*Z*x^6 + 768*N^3*Z*x^7 + -768*N^3*Z*x^8 + -1024*N^3*Z*x^9 + 384*N^3*Z*x^11 + 128*N^3*Z*x^12
theorem localFour_normalize_0100BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n false true false false=
 localFourNum0100BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_00a1BC,gauge_normalize_00a2BC,gauge_normalize_00b2BC,gauge_normalize_00b3BC,gauge_normalize_00c1BC,gauge_normalize_00c2BC,gauge_normalize_00c3BC,gauge_normalize_00d1BC,gauge_normalize_00d2BC,gauge_normalize_00d3BC,gauge_normalize_00d4BC,gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC,gauge_normalize_01d4BC,gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC,gauge_normalize_10d4BC]
 simp only [gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,localFourNum0100BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
