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

def localFourNum1110BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12 + 24*x + 516*x^2 + 3624*x^3 + 12654*x^4 + 26016*x^5 + 35280*x^6 + 32928*x^7 + 20808*x^8 + 8520*x^9 + 2172*x^10 + 312*x^11 + 6*x^12 + -5376*Z*x^3 + -13824*Z*x^4 + -19392*Z*x^5 + -24960*Z*x^6 + -18240*Z*x^7 + -3840*Z*x^8 + -576*Z*x^9 + -384*Z*x^10 + 576*Z*x^11 + 5328*Z^2*x^5 + -23136*Z^2*x^6 + -30240*Z^2*x^7 + 12576*Z^2*x^8 + -11040*Z^2*x^10 + 3360*Z^2*x^11 + 96*Z^2*x^12 + 48*Z^2*x^13 + -288*Z^3*x^6 + 15552*Z^3*x^8 + -34944*Z^3*x^9 + -11520*Z^3*x^10 + 29952*Z^3*x^11 + -10176*Z^3*x^12 + -1152*Z^3*x^13 + 288*Z^3*x^14 + -96*Z^4*x^8 + 192*Z^4*x^9 + -1248*Z^4*x^10 + 9600*Z^4*x^11 + -18720*Z^4*x^12 + 10176*Z^4*x^13 + -1440*Z^4*x^14 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -4672*N*Z*x^3 + -13440*N*Z*x^4 + -10944*N*Z*x^5 + 1088*N*Z*x^6 + 7872*N*Z*x^7 + 10560*N*Z*x^8 + 8128*N*Z*x^9 + 1728*N*Z*x^10 + -384*N*Z*x^11 + 64*N*Z*x^12 + 4032*N*Z^2*x^5 + -12288*N*Z^2*x^6 + -29568*N*Z^2*x^7 + 12288*N*Z^2*x^8 + 32256*N*Z^2*x^9 + -3072*N*Z^2*x^10 + -7296*N*Z^2*x^11 + 3072*N*Z^2*x^12 + 576*N*Z^2*x^13 + -192*N*Z^3*x^6 + 192*N*Z^3*x^7 + 5568*N*Z^3*x^8 + -9024*N*Z^3*x^9 + -13248*N*Z^3*x^10 + 14400*N*Z^3*x^11 + 7488*N*Z^3*x^12 + -5568*N*Z^3*x^13 + 384*N*Z^3*x^14 + -1344*N^2*Z*x^3 + -4032*N^2*Z*x^4 + -1536*N^2*Z*x^5 + 6144*N^2*Z*x^6 + 6528*N^2*Z*x^7 + -384*N^2*Z*x^8 + -3072*N^2*Z*x^9 + -1536*N^2*Z*x^10 + -576*N^2*Z*x^11 + -192*N^2*Z*x^12 + 768*N^2*Z^2*x^5 + -1536*N^2*Z^2*x^6 + -6144*N^2*Z^2*x^7 + 1536*N^2*Z^2*x^8 + 10752*N^2*Z^2*x^9 + 1536*N^2*Z^2*x^10 + -6144*N^2*Z^2*x^11 + -1536*N^2*Z^2*x^12 + 768*N^2*Z^2*x^13 + -128*N^3*Z*x^3 + -384*N^3*Z*x^4 + 1024*N^3*Z*x^6 + 768*N^3*Z*x^7 + -768*N^3*Z*x^8 + -1024*N^3*Z*x^9 + 384*N^3*Z*x^11 + 128*N^3*Z*x^12
theorem localFour_normalize_1110BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n true true true false=
 localFourNum1110BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC,gauge_normalize_10d4BC,gauge_normalize_11a1BC,gauge_normalize_11a2BC,gauge_normalize_11b2BC,gauge_normalize_11b3BC,gauge_normalize_11c1BC,gauge_normalize_11c2BC,gauge_normalize_11c3BC,gauge_normalize_11d1BC,gauge_normalize_11d2BC,gauge_normalize_11d3BC,gauge_normalize_11d4BC]
 simp only [gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,localFourNum1110BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
