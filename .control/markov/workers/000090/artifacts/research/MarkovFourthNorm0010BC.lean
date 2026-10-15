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

def localFourNum0010BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -6 + 120*x + 1068*x^2 + 5256*x^3 + 15372*x^4 + 28320*x^5 + 35280*x^6 + 30624*x^7 + 18090*x^8 + 6888*x^9 + 1620*x^10 + 216*x^11 + -1920*Z*x^2 + -3744*Z*x^3 + -9984*Z*x^4 + -22080*Z*x^5 + -20352*Z*x^6 + -12288*Z*x^7 + -10752*Z*x^8 + -4800*Z*x^9 + -96*Z*x^11 + 1440*Z^2*x^3 + -9696*Z^2*x^4 + -9696*Z^2*x^5 + 96*Z^2*x^6 + -15264*Z^2*x^7 + -11232*Z^2*x^8 + 3168*Z^2*x^9 + -480*Z^2*x^10 + -1152*Z^2*x^11 + -192*Z^2*x^12 + -1152*Z^3*x^4 + 7872*Z^3*x^5 + -11904*Z^3*x^6 + -14784*Z^3*x^7 + 12288*Z^3*x^8 + -192*Z^3*x^9 + -5760*Z^3*x^10 + 960*Z^3*x^11 + 384*Z^3*x^12 + 384*Z^4*x^5 + -2784*Z^4*x^6 + 6720*Z^4*x^7 + -3936*Z^4*x^8 + -6144*Z^4*x^9 + 3936*Z^4*x^10 + 576*Z^4*x^11 + -288*Z^4*x^12 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12 + -2368*N*Z*x^2 + -6432*N*Z*x^3 + -7776*N*Z*x^4 + -8512*N*Z*x^5 + -3264*N*Z*x^6 + 9600*N*Z*x^7 + 11776*N*Z*x^8 + 4416*N*Z*x^9 + 1536*N*Z*x^10 + 928*N*Z*x^11 + 96*N*Z*x^12 + 1056*N*Z^2*x^3 + -5664*N*Z^2*x^4 + -15360*N*Z^2*x^5 + -1152*N*Z^2*x^6 + 13632*N*Z^2*x^7 + 3648*N*Z^2*x^8 + -768*N*Z^2*x^9 + 3456*N*Z^2*x^10 + 1440*N*Z^2*x^11 + -288*N*Z^2*x^12 + -384*N*Z^3*x^4 + 2112*N*Z^3*x^5 + -960*N*Z^3*x^6 + -10176*N*Z^3*x^7 + -192*N*Z^3*x^8 + 10944*N*Z^3*x^9 + 1728*N*Z^3*x^10 + -2880*N*Z^3*x^11 + -192*N*Z^3*x^12 + -960*N^2*Z*x^2 + -2880*N^2*Z*x^3 + -1536*N^2*Z*x^4 + 3072*N^2*Z*x^5 + 4224*N^2*Z*x^6 + 1920*N^2*Z*x^7 + -1536*N^2*Z*x^9 + -1728*N^2*Z*x^10 + -576*N^2*Z*x^11 + 192*N^2*Z^2*x^3 + -960*N^2*Z^2*x^4 + -3840*N^2*Z^2*x^5 + -768*N^2*Z^2*x^6 + 7296*N^2*Z^2*x^7 + 4992*N^2*Z^2*x^8 + -3840*N^2*Z^2*x^9 + -3840*N^2*Z^2*x^10 + 192*N^2*Z^2*x^11 + 576*N^2*Z^2*x^12 + -128*N^3*Z*x^2 + -384*N^3*Z*x^3 + 1024*N^3*Z*x^5 + 768*N^3*Z*x^6 + -768*N^3*Z*x^7 + -1024*N^3*Z*x^8 + 384*N^3*Z*x^10 + 128*N^3*Z*x^11
theorem localFour_normalize_0010BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n false false true false=
 localFourNum0010BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [gauge_normalize_00a1BC,gauge_normalize_00a2BC,gauge_normalize_00b2BC,gauge_normalize_00b3BC,gauge_normalize_00c1BC,gauge_normalize_00c2BC,gauge_normalize_00c3BC,gauge_normalize_00d1BC,gauge_normalize_00d2BC,gauge_normalize_00d3BC,gauge_normalize_00d4BC,gauge_normalize_01a1BC,gauge_normalize_01a2BC,gauge_normalize_01b2BC,gauge_normalize_01b3BC,gauge_normalize_01c1BC,gauge_normalize_01c2BC,gauge_normalize_01c3BC,gauge_normalize_01d1BC,gauge_normalize_01d2BC,gauge_normalize_01d3BC,gauge_normalize_01d4BC,gauge_normalize_10a1BC,gauge_normalize_10a2BC,gauge_normalize_10b2BC,gauge_normalize_10b3BC,gauge_normalize_10c1BC,gauge_normalize_10c2BC,gauge_normalize_10c3BC,gauge_normalize_10d1BC,gauge_normalize_10d2BC,gauge_normalize_10d3BC,gauge_normalize_10d4BC]
 simp only [gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,localFourNum0010BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
