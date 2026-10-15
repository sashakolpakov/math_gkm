import MarkovFourthTruncateK0B
/-! Machine-authored request 0b212317. Zero-Z local moments. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def zeroThird0K0B {A : Type*} [CommRing A] (N x : A) : A :=
 2 + -24*x + -132*x^2 + -400*x^3 + -744*x^4 + -792*x^5 + -492*x^6 + -192*x^7 + -42*x^8 + 2*N + 18*N*x + 60*N*x^2 + 92*N*x^3 + 48*N*x^4 + -48*N*x^5 + -92*N*x^6 + -60*N*x^7 + -18*N*x^8 + -2*N*x^9

def zeroThird1K0B {A : Type*} [CommRing A] (N x : A) : A :=
 4 + -6*x + -72*x^2 + -308*x^3 + -696*x^4 + -840*x^5 + -584*x^6 + -252*x^7 + -60*x^8 + -2*x^9 + 2*N + 18*N*x + 60*N*x^2 + 92*N*x^3 + 48*N*x^4 + -48*N*x^5 + -92*N*x^6 + -60*N*x^7 + -18*N*x^8 + -2*N*x^9

theorem localThird_zeroK0B {A : Type*} [CommRing A] (N x : A) (p q r : Bool) :
 localThirdNumBC N 0 x p q r =
 (if q then zeroThird1K0B N x else zeroThird0K0B N x) := by
 cases p <;> cases q <;> cases r
 all_goals
  simp only [localThirdNumBC,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,zeroThird0K0B,zeroThird1K0B,
    Bool.false_eq_true,if_false,if_true,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
  ring
end
end MathGKM.Markov
