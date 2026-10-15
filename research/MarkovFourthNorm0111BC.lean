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

def localFourNum0111BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12 + 24*x + 516*x^2 + 3624*x^3 + 12654*x^4 + 26016*x^5 + 35280*x^6 + 32928*x^7 + 20808*x^8 + 8520*x^9 + 2172*x^10 + 312*x^11 + 6*x^12 + 48*Z*x + -384*Z*x^2 + -5088*Z*x^3 + -13200*Z*x^4 + -20448*Z*x^5 + -24576*Z*x^6 + -17280*Z*x^7 + -4896*Z*x^8 + -720*Z*x^9 + 480*Z*x^11 + 48*Z*x^12 + -144*Z^2*x^2 + 672*Z^2*x^3 + 2256*Z^2*x^4 + -3456*Z^2*x^5 + -20160*Z^2*x^6 + -17184*Z^2*x^7 + 768*Z^2*x^8 + -2400*Z^2*x^9 + -4656*Z^2*x^10 + 768*Z^2*x^11 + 432*Z^2*x^12 + 96*Z^2*x^13 + 192*Z^3*x^3 + -768*Z^3*x^4 + -576*Z^3*x^5 + 3360*Z^3*x^6 + 7296*Z^3*x^7 + -12864*Z^3*x^8 + -17664*Z^3*x^9 + 6528*Z^3*x^10 + 5568*Z^3*x^11 + -2496*Z^3*x^12 + -960*Z^3*x^13 + 96*Z^3*x^14 + -96*Z^4*x^4 + 384*Z^4*x^5 + -192*Z^4*x^6 + -960*Z^4*x^7 + 480*Z^4*x^8 + 768*Z^4*x^9 + 6048*Z^4*x^10 + -11712*Z^4*x^11 + 3072*Z^4*x^12 + 768*Z^4*x^13 + -96*Z^4*x^14 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -4672*N*Z*x^3 + -13440*N*Z*x^4 + -10944*N*Z*x^5 + 1088*N*Z*x^6 + 7872*N*Z*x^7 + 10560*N*Z*x^8 + 8128*N*Z*x^9 + 1728*N*Z*x^10 + -384*N*Z*x^11 + 64*N*Z*x^12 + 1440*N*Z^2*x^4 + 1632*N*Z^2*x^5 + -15744*N*Z^2*x^6 + -22272*N*Z^2*x^7 + 14016*N*Z^2*x^8 + 24768*N*Z^2*x^9 + -1920*N*Z^2*x^10 + -4608*N*Z^2*x^11 + 2208*N*Z^2*x^12 + 480*N*Z^2*x^13 + -384*N*Z^3*x^5 + 384*N*Z^3*x^6 + 3264*N*Z^3*x^7 + -576*N*Z^3*x^8 + -11328*N*Z^3*x^9 + -2880*N*Z^3*x^10 + 11328*N*Z^3*x^11 + 2880*N*Z^3*x^12 + -2880*N*Z^3*x^13 + 192*N*Z^3*x^14 + -1344*N^2*Z*x^3 + -4032*N^2*Z*x^4 + -1536*N^2*Z*x^5 + 6144*N^2*Z*x^6 + 6528*N^2*Z*x^7 + -384*N^2*Z*x^8 + -3072*N^2*Z*x^9 + -1536*N^2*Z*x^10 + -576*N^2*Z*x^11 + -192*N^2*Z*x^12 + 192*N^2*Z^2*x^4 + 576*N^2*Z^2*x^5 + -2304*N^2*Z^2*x^6 + -5376*N^2*Z^2*x^7 + 2688*N^2*Z^2*x^8 + 9600*N^2*Z^2*x^9 + 768*N^2*Z^2*x^10 + -5376*N^2*Z^2*x^11 + -1344*N^2*Z^2*x^12 + 576*N^2*Z^2*x^13 + -128*N^3*Z*x^3 + -384*N^3*Z*x^4 + 1024*N^3*Z*x^6 + 768*N^3*Z*x^7 + -768*N^3*Z*x^8 + -1024*N^3*Z*x^9 + 384*N^3*Z*x^11 + 128*N^3*Z*x^12
theorem localFour_normalize_0111BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n false true true true=
 localFourNum0111BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC,gauge_normalize_01d4BC,gauge_normalize_11a1BC,gauge_normalize_11a2BC,gauge_normalize_11b2BC,gauge_normalize_11b3BC,gauge_normalize_11c1BC,gauge_normalize_11c2BC,gauge_normalize_11c3BC,gauge_normalize_11d1BC,gauge_normalize_11d2BC,gauge_normalize_11d3BC,gauge_normalize_11d4BC]
 simp only [gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,localFourNum0111BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
