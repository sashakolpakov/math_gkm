import MarkovShiftProductF2
/-! Machine-authored request f2da221d. Exact cubic-zero local expressions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def cubicThirdF2 {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => 2 + -24*x + -132*x^2 + 240*Z*x^2 + 2*N + 18*N*x + 60*N*x^2 + 216*N*Z*x^2 + 48*N^2*Z*x^2
 | false,true => 4 + -6*x + -72*x^2 + -12*Z*x + 60*Z*x^2 + 24*Z^2*x^2 + 2*N + 18*N*x + 60*N*x^2
 | true,false => 2 + -24*x + -132*x^2 + 12*Z*x + 180*Z*x^2 + -24*Z^2*x^2 + 2*N + 18*N*x + 60*N*x^2 + 216*N*Z*x^2 + 48*N^2*Z*x^2
 | true,true => 4 + -6*x + -72*x^2 + 2*N + 18*N*x + 60*N*x^2

theorem localThird_cubicF2 {A : Type*} [CommRing A] (N Z x : A) (p q r : Bool) (hx : x^3=0) :
 localThirdNumBC N Z x p q r=cubicThirdF2 N Z x p q := by
 have hx4 : x^4=0 := by rw [show 4=3+1 by omega,pow_add,hx,zero_mul]
 have hx5 : x^5=0 := by rw [show 5=3+2 by omega,pow_add,hx,zero_mul]
 have hx6 : x^6=0 := by rw [show 6=3+3 by omega,pow_add,hx,zero_mul]
 have hx7 : x^7=0 := by rw [show 7=3+4 by omega,pow_add,hx,zero_mul]
 have hx8 : x^8=0 := by rw [show 8=3+5 by omega,pow_add,hx,zero_mul]
 have hx9 : x^9=0 := by rw [show 9=3+6 by omega,pow_add,hx,zero_mul]
 have hx10 : x^10=0 := by rw [show 10=3+7 by omega,pow_add,hx,zero_mul]
 have hx11 : x^11=0 := by rw [show 11=3+8 by omega,pow_add,hx,zero_mul]
 have hx12 : x^12=0 := by rw [show 12=3+9 by omega,pow_add,hx,zero_mul]
 have hx13 : x^13=0 := by rw [show 13=3+10 by omega,pow_add,hx,zero_mul]
 have hx14 : x^14=0 := by rw [show 14=3+11 by omega,pow_add,hx,zero_mul]
 have hx15 : x^15=0 := by rw [show 15=3+12 by omega,pow_add,hx,zero_mul]
 have hx16 : x^16=0 := by rw [show 16=3+13 by omega,pow_add,hx,zero_mul]
 cases p <;> cases q <;> cases r
 all_goals
  simp only [localThirdNumBC,cubicThirdF2,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,hx,hx4,hx5,hx6,hx7,hx8,hx9,hx10,hx11,hx12,hx13,hx14,hx15,hx16,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
  ring_nf
  simp only [hx,hx4,hx5,hx6,hx7,hx8,hx9,hx10,hx11,hx12,hx13,hx14,hx15,hx16,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
end
end MathGKM.Markov
