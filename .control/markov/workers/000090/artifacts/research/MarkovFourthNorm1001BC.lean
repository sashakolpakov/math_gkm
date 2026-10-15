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

def localFourNum1001BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -6 + 120*x + 1068*x^2 + 5256*x^3 + 15372*x^4 + 28320*x^5 + 35280*x^6 + 30624*x^7 + 18090*x^8 + 6888*x^9 + 1620*x^10 + 216*x^11 + -48*Z*x + -1536*Z*x^2 + -4320*Z*x^3 + -10608*Z*x^4 + -19872*Z*x^5 + -20736*Z*x^6 + -14976*Z*x^7 + -9696*Z*x^8 + -3504*Z*x^9 + -384*Z*x^10 + -288*Z*x^11 + -48*Z*x^12 + 144*Z^2*x^2 + -96*Z^2*x^3 + -6912*Z^2*x^4 + -8640*Z^2*x^5 + -6240*Z^2*x^6 + -12288*Z^2*x^7 + -7296*Z^2*x^8 + 192*Z^2*x^9 + -1200*Z^2*x^10 + -672*Z^2*x^11 + -192*Z^3*x^3 + 1920*Z^3*x^4 + -1344*Z^3*x^5 + -5376*Z^3*x^6 + -7488*Z^3*x^7 + 1920*Z^3*x^8 + 1344*Z^3*x^9 + -4608*Z^3*x^10 + 1536*Z^3*x^11 + 96*Z^4*x^4 + -768*Z^4*x^5 + 2688*Z^4*x^6 + -2208*Z^4*x^7 + -192*Z^4*x^8 + -3168*Z^4*x^9 + 1152*Z^4*x^10 + 1440*Z^4*x^11 + -672*Z^4*x^12 + 96*Z^4*x^13 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -2368*N*Z*x^2 + -6528*N*Z*x^3 + -7872*N*Z*x^4 + -8128*N*Z*x^5 + -2880*N*Z*x^6 + 9024*N*Z*x^7 + 11200*N*Z*x^8 + 4800*N*Z*x^9 + 1920*N*Z*x^10 + 832*N*Z*x^11 + 1440*N*Z^2*x^3 + -7200*N*Z^2*x^4 + -15360*N*Z^2*x^5 + 3456*N*Z^2*x^6 + 11328*N*Z^2*x^7 + -960*N*Z^2*x^8 + 2304*N*Z^2*x^9 + 4992*N*Z^2*x^10 + 288*N*Z^2*x^11 + -288*N*Z^2*x^12 + 384*N*Z^3*x^4 + 1728*N*Z^3*x^5 + -3648*N*Z^3*x^6 + -9024*N*Z^3*x^7 + 3264*N*Z^3*x^8 + 9792*N*Z^3*x^9 + -192*N*Z^3*x^10 + -2496*N*Z^3*x^11 + 192*N*Z^3*x^12 + -960*N^2*Z*x^2 + -2880*N^2*Z*x^3 + -1536*N^2*Z*x^4 + 3072*N^2*Z*x^5 + 4224*N^2*Z*x^6 + 1920*N^2*Z*x^7 + -1536*N^2*Z*x^9 + -1728*N^2*Z*x^10 + -576*N^2*Z*x^11 + 576*N^2*Z^2*x^3 + -1344*N^2*Z^2*x^4 + -5376*N^2*Z^2*x^5 + 768*N^2*Z^2*x^6 + 9600*N^2*Z^2*x^7 + 2688*N^2*Z^2*x^8 + -5376*N^2*Z^2*x^9 + -2304*N^2*Z^2*x^10 + 576*N^2*Z^2*x^11 + 192*N^2*Z^2*x^12 + -128*N^3*Z*x^2 + -384*N^3*Z*x^3 + 1024*N^3*Z*x^5 + 768*N^3*Z*x^6 + -768*N^3*Z*x^7 + -1024*N^3*Z*x^8 + 384*N^3*Z*x^10 + 128*N^3*Z*x^11
theorem localFour_normalize_1001BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n true false false true=
 localFourNum1001BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_00a1BC,gauge_normalize_00a2BC,gauge_normalize_00b2BC,gauge_normalize_00b3BC,gauge_normalize_00c1BC,gauge_normalize_00c2BC,gauge_normalize_00c3BC,gauge_normalize_00d1BC,gauge_normalize_00d2BC,gauge_normalize_00d3BC,gauge_normalize_00d4BC,gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC,gauge_normalize_01d4BC,gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC,gauge_normalize_10d4BC]
 simp only [gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,localFourNum1001BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
