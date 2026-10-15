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

def localFourNum1011BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -6 + 120*x + 1068*x^2 + 5256*x^3 + 15372*x^4 + 28320*x^5 + 35280*x^6 + 30624*x^7 + 18090*x^8 + 6888*x^9 + 1620*x^10 + 216*x^11 + -48*Z*x + -1536*Z*x^2 + -4032*Z*x^3 + -10608*Z*x^4 + -21024*Z*x^5 + -20736*Z*x^6 + -13248*Z*x^7 + -9696*Z*x^8 + -4656*Z*x^9 + -384*Z*x^10 + -48*Z*x^12 + 144*Z^2*x^2 + -672*Z^2*x^3 + -4272*Z^2*x^4 + -11760*Z^2*x^5 + -7680*Z^2*x^6 + -5664*Z^2*x^7 + -12672*Z^2*x^8 + -1344*Z^2*x^9 + 3312*Z^2*x^10 + -2112*Z^2*x^11 + -336*Z^2*x^12 + 48*Z^2*x^13 + -192*Z^3*x^3 + 768*Z^3*x^4 + 576*Z^3*x^5 + -4608*Z^3*x^6 + -6336*Z^3*x^7 + -6528*Z^3*x^8 + 5568*Z^3*x^9 + 2304*Z^3*x^10 + -5760*Z^3*x^11 + 1920*Z^3*x^12 + 96*Z^4*x^4 + -384*Z^4*x^5 + 192*Z^4*x^6 + 960*Z^4*x^7 + -480*Z^4*x^8 + -2688*Z^4*x^9 + 96*Z^4*x^10 + -1344*Z^4*x^11 + 3072*Z^4*x^12 + -1152*Z^4*x^13 + 96*Z^4*x^14 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -2368*N*Z*x^2 + -6432*N*Z*x^3 + -7776*N*Z*x^4 + -8512*N*Z*x^5 + -3264*N*Z*x^6 + 9600*N*Z*x^7 + 11776*N*Z*x^8 + 4416*N*Z*x^9 + 1536*N*Z*x^10 + 928*N*Z*x^11 + 96*N*Z*x^12 + -3648*N*Z^2*x^4 + -13440*N*Z^2*x^5 + -6912*N*Z^2*x^6 + 14208*N*Z^2*x^7 + 8832*N*Z^2*x^8 + -3456*N*Z^2*x^9 + 2304*N*Z^2*x^10 + 2688*N*Z^2*x^11 + -576*N*Z^2*x^12 + 384*N*Z^3*x^5 + -960*N*Z^3*x^6 + -4032*N*Z^3*x^7 + -4032*N*Z^3*x^8 + 4416*N*Z^3*x^9 + 7872*N*Z^3*x^10 + -1344*N*Z^3*x^11 + -2880*N*Z^3*x^12 + 576*N*Z^3*x^13 + -960*N^2*Z*x^2 + -2880*N^2*Z*x^3 + -1536*N^2*Z*x^4 + 3072*N^2*Z*x^5 + 4224*N^2*Z*x^6 + 1920*N^2*Z*x^7 + -1536*N^2*Z*x^9 + -1728*N^2*Z*x^10 + -576*N^2*Z*x^11 + -768*N^2*Z^2*x^4 + -3072*N^2*Z^2*x^5 + -1536*N^2*Z^2*x^6 + 6144*N^2*Z^2*x^7 + 6144*N^2*Z^2*x^8 + -3072*N^2*Z^2*x^9 + -4608*N^2*Z^2*x^10 + 768*N^2*Z^2*x^12 + -128*N^3*Z*x^2 + -384*N^3*Z*x^3 + 1024*N^3*Z*x^5 + 768*N^3*Z*x^6 + -768*N^3*Z*x^7 + -1024*N^3*Z*x^8 + 384*N^3*Z*x^10 + 128*N^3*Z*x^11
theorem localFour_normalize_1011BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n true false true true=
 localFourNum1011BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC,gauge_normalize_01d4BC,gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC,gauge_normalize_10d4BC,gauge_normalize_11a1BC,gauge_normalize_11a2BC,gauge_normalize_11b2BC,gauge_normalize_11b3BC,gauge_normalize_11c1BC,gauge_normalize_11c2BC,gauge_normalize_11c3BC,gauge_normalize_11d1BC,gauge_normalize_11d2BC,gauge_normalize_11d3BC,gauge_normalize_11d4BC]
 simp only [gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,localFourNum1011BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
