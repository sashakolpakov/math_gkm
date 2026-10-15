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

def localFourNum0000BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -6 + 120*x + 1068*x^2 + 5256*x^3 + 15372*x^4 + 28320*x^5 + 35280*x^6 + 30624*x^7 + 18090*x^8 + 6888*x^9 + 1620*x^10 + 216*x^11 + -1920*Z*x^2 + -4032*Z*x^3 + -9984*Z*x^4 + -20928*Z*x^5 + -20352*Z*x^6 + -14016*Z*x^7 + -10752*Z*x^8 + -3648*Z*x^9 + -384*Z*x^11 + 2016*Z^2*x^3 + -12288*Z^2*x^4 + -6720*Z^2*x^5 + 1536*Z^2*x^6 + -21504*Z^2*x^7 + -6144*Z^2*x^8 + 4416*Z^2*x^9 + -4608*Z^2*x^10 + 288*Z^2*x^11 + -768*Z^3*x^4 + 11328*Z^3*x^5 + -27264*Z^3*x^6 + 1728*Z^3*x^7 + 16896*Z^3*x^8 + -19008*Z^3*x^9 + 4992*Z^3*x^10 + -192*Z^3*x^11 + 96*Z^4*x^5 + -2304*Z^4*x^6 + 12960*Z^4*x^7 + -23040*Z^4*x^8 + 12960*Z^4*x^9 + -2304*Z^4*x^10 + 96*Z^4*x^11 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -2368*N*Z*x^2 + -6528*N*Z*x^3 + -7872*N*Z*x^4 + -8128*N*Z*x^5 + -2880*N*Z*x^6 + 9024*N*Z*x^7 + 11200*N*Z*x^8 + 4800*N*Z*x^9 + 1920*N*Z*x^10 + 832*N*Z*x^11 + 2496*N*Z^2*x^3 + -9216*N*Z^2*x^4 + -17280*N*Z^2*x^5 + 9216*N*Z^2*x^6 + 10752*N*Z^2*x^7 + -6144*N*Z^2*x^8 + 4992*N*Z^2*x^9 + 6144*N*Z^2*x^10 + -960*N*Z^2*x^11 + -576*N*Z^3*x^4 + 6336*N*Z^3*x^5 + -8256*N*Z^3*x^6 + -15168*N*Z^3*x^7 + 15168*N*Z^3*x^8 + 8256*N*Z^3*x^9 + -6336*N*Z^3*x^10 + 576*N*Z^3*x^11 + -960*N^2*Z*x^2 + -2880*N^2*Z*x^3 + -1536*N^2*Z*x^4 + 3072*N^2*Z*x^5 + 4224*N^2*Z*x^6 + 1920*N^2*Z*x^7 + -1536*N^2*Z*x^9 + -1728*N^2*Z*x^10 + -576*N^2*Z*x^11 + 768*N^2*Z^2*x^3 + -1536*N^2*Z^2*x^4 + -6144*N^2*Z^2*x^5 + 1536*N^2*Z^2*x^6 + 10752*N^2*Z^2*x^7 + 1536*N^2*Z^2*x^8 + -6144*N^2*Z^2*x^9 + -1536*N^2*Z^2*x^10 + 768*N^2*Z^2*x^11 + -128*N^3*Z*x^2 + -384*N^3*Z*x^3 + 1024*N^3*Z*x^5 + 768*N^3*Z*x^6 + -768*N^3*Z*x^7 + -1024*N^3*Z*x^8 + 384*N^3*Z*x^10 + 128*N^3*Z*x^11
theorem localFour_normalize_0000BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n false false false false=
 localFourNum0000BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_00a1BC,gauge_normalize_00a2BC,gauge_normalize_00b2BC,gauge_normalize_00b3BC,gauge_normalize_00c1BC,gauge_normalize_00c2BC,gauge_normalize_00c3BC,gauge_normalize_00d1BC,gauge_normalize_00d2BC,gauge_normalize_00d3BC,gauge_normalize_00d4BC]
 simp only [gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,localFourNum0000BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
