import MarkovFourthTruncateK0B
/-! Machine-authored request 0b212317. Zero-Z local moments. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def zeroFour0K0B {A : Type*} [CommRing A] (N x : A) : A :=
 -6 + 120*x + 1068*x^2 + 5256*x^3 + 15372*x^4 + 28320*x^5 + 35280*x^6 + 30624*x^7 + 18090*x^8 + 6888*x^9 + 1620*x^10 + 216*x^11 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12

def zeroFour1K0B {A : Type*} [CommRing A] (N x : A) : A :=
 -12 + 24*x + 516*x^2 + 3624*x^3 + 12654*x^4 + 26016*x^5 + 35280*x^6 + 32928*x^7 + 20808*x^8 + 8520*x^9 + 2172*x^10 + 312*x^11 + 6*x^12 + -6*N + -96*N*x + -552*N*x^2 + -1632*N*x^3 + -2718*N*x^4 + -2304*N*x^5 + 2304*N*x^7 + 2718*N*x^8 + 1632*N*x^9 + 552*N*x^10 + 96*N*x^11 + 6*N*x^12

theorem localFour_zeroK0B {A : Type*} [CommRing A] (N x : A) (p q r s : Bool) :
 localFourNumBC N 0 x p q r s =
 (if q then zeroFour1K0B N x else zeroFour0K0B N x) := by
 cases p <;> cases q <;> cases r <;> cases s
 all_goals
  simp only [localFourNumBC,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,zeroFour0K0B,zeroFour1K0B,
    Bool.false_eq_true,if_false,if_true,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
  ring
end
end MathGKM.Markov
