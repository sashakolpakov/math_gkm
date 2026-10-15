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

def localThirdNum010BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 4 + -6*x + -72*x^2 + -308*x^3 + -696*x^4 + -840*x^5 + -584*x^6 + -252*x^7 + -60*x^8 + -2*x^9 + -12*Z*x + 60*Z*x^2 + 468*Z*x^3 + 684*Z*x^4 + 420*Z*x^5 + 276*Z*x^6 + 108*Z*x^7 + -60*Z*x^8 + -24*Z*x^9 + 24*Z^2*x^2 + -72*Z^2*x^3 + -216*Z^2*x^4 + 552*Z^2*x^5 + 552*Z^2*x^6 + -120*Z^2*x^7 + 24*Z^2*x^8 + 24*Z^2*x^9 + -16*Z^3*x^3 + 48*Z^3*x^4 + 24*Z^3*x^5 + -256*Z^3*x^6 + 192*Z^3*x^7 + 144*Z^3*x^8 + -8*Z^3*x^9 + 2*N + 18*N*x + 60*N*x^2 + 92*N*x^3 + 48*N*x^4 + -48*N*x^5 + -92*N*x^6 + -60*N*x^7 + -18*N*x^8 + -2*N*x^9 + 312*N*Z*x^3 + 576*N*Z*x^4 + -72*N*Z*x^5 + -576*N*Z*x^6 + -216*N*Z*x^7 + -24*N*Z*x^9 + -96*N*Z^2*x^4 + 96*N*Z^2*x^5 + 384*N*Z^2*x^6 + -288*N*Z^2*x^8 + -96*N*Z^2*x^9 + 48*N^2*Z*x^3 + 96*N^2*Z*x^4 + -48*N^2*Z*x^5 + -192*N^2*Z*x^6 + -48*N^2*Z*x^7 + 96*N^2*Z*x^8 + 48*N^2*Z*x^9
theorem localThird_normalize_010BC (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n false true false=
 localThirdNum010BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalBDEE
 dsimp only
 simp only [gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC,gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC]
 simp only [gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,localThirdNum010BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
