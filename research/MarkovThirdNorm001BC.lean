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

def localThirdNum001BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2 + -24*x + -132*x^2 + -400*x^3 + -744*x^4 + -792*x^5 + -492*x^6 + -192*x^7 + -42*x^8 + 240*Z*x^2 + 276*Z*x^3 + 360*Z*x^4 + 708*Z*x^5 + 288*Z*x^6 + -36*Z*x^7 + 72*Z*x^8 + 12*Z*x^9 + -120*Z^2*x^3 + 624*Z^2*x^4 + 216*Z^2*x^5 + -288*Z^2*x^6 + 312*Z^2*x^7 + 48*Z^2*x^8 + -24*Z^2*x^9 + 48*Z^3*x^4 + -264*Z^3*x^5 + 416*Z^3*x^6 + 48*Z^3*x^7 + -144*Z^3*x^8 + 24*Z^3*x^9 + 2*N + 18*N*x + 60*N*x^2 + 92*N*x^3 + 48*N*x^4 + -48*N*x^5 + -92*N*x^6 + -60*N*x^7 + -18*N*x^8 + -2*N*x^9 + 216*N*Z*x^2 + 384*N*Z*x^3 + 24*N*Z*x^4 + -192*N*Z*x^5 + -120*N*Z*x^6 + -192*N*Z*x^7 + -120*N*Z*x^8 + -48*N*Z^2*x^3 + 192*N*Z^2*x^4 + 336*N*Z^2*x^5 + -192*N*Z^2*x^6 + -336*N*Z^2*x^7 + 48*N*Z^2*x^9 + 48*N^2*Z*x^2 + 96*N^2*Z*x^3 + -48*N^2*Z*x^4 + -192*N^2*Z*x^5 + -48*N^2*Z*x^6 + 96*N^2*Z*x^7 + 48*N^2*Z*x^8
theorem localThird_normalize_001BC (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n false false true=
 localThirdNum001BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalBDEE
 dsimp only
 simp only [gauge_normalize_00a1BC,gauge_normalize_00a2BC,gauge_normalize_00b2BC,gauge_normalize_00b3BC,gauge_normalize_00c1BC,gauge_normalize_00c2BC,gauge_normalize_00c3BC,gauge_normalize_00d1BC,gauge_normalize_00d2BC,gauge_normalize_00d3BC,gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC]
 simp only [gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,localThirdNum001BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
