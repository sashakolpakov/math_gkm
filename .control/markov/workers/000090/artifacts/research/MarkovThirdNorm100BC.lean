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

def localThirdNum100BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2 + -24*x + -132*x^2 + -400*x^3 + -744*x^4 + -792*x^5 + -492*x^6 + -192*x^7 + -42*x^8 + 12*Z*x + 180*Z*x^2 + 336*Z*x^3 + 444*Z*x^4 + 552*Z*x^5 + 300*Z*x^6 + 48*Z*x^7 + 36*Z*x^8 + 12*Z*x^9 + -24*Z^2*x^2 + 48*Z^2*x^3 + 312*Z^2*x^4 + 288*Z^2*x^5 + 24*Z^2*x^6 + 48*Z^2*x^7 + 72*Z^2*x^8 + 16*Z^3*x^3 + -96*Z^3*x^4 + 120*Z^3*x^5 + 192*Z^3*x^7 + -96*Z^3*x^8 + -8*Z^3*x^9 + 2*N + 18*N*x + 60*N*x^2 + 92*N*x^3 + 48*N*x^4 + -48*N*x^5 + -92*N*x^6 + -60*N*x^7 + -18*N*x^8 + -2*N*x^9 + 216*N*Z*x^2 + 384*N*Z*x^3 + 24*N*Z*x^4 + -192*N*Z*x^5 + -120*N*Z*x^6 + -192*N*Z*x^7 + -120*N*Z*x^8 + -48*N*Z^2*x^3 + 192*N*Z^2*x^4 + 336*N*Z^2*x^5 + -192*N*Z^2*x^6 + -336*N*Z^2*x^7 + 48*N*Z^2*x^9 + 48*N^2*Z*x^2 + 96*N^2*Z*x^3 + -48*N^2*Z*x^4 + -192*N^2*Z*x^5 + -48*N^2*Z*x^6 + 96*N^2*Z*x^7 + 48*N^2*Z*x^8
theorem localThird_normalize_100BC (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n true false false=
 localThirdNum100BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalBDEE
 dsimp only
 simp only [gauge_normalize_00a1BC,gauge_normalize_00a2BC,gauge_normalize_00b2BC,gauge_normalize_00b3BC,gauge_normalize_00c1BC,gauge_normalize_00c2BC,gauge_normalize_00c3BC,gauge_normalize_00d1BC,gauge_normalize_00d2BC,gauge_normalize_00d3BC,gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC]
 simp only [gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,localThirdNum100BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
