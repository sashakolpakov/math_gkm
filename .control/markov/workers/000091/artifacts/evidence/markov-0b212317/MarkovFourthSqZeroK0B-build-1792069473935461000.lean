import MarkovFourthTruncateK0B
/-! Machine-authored request 0b212317. Lowest x-terms are independent of Z. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

theorem fourthNumerator_sqzeroK0B {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hx : x^2=0) :
 fourthNumeratorBC N Z x c r=fourthNumeratorBC N 0 x c r := by
 have hx3 : x^3=0 := by rw [show 3=2+1 by omega,pow_add,hx,zero_mul]
 have hx4 : x^4=0 := by rw [show 4=2+2 by omega,pow_add,hx,zero_mul]
 have hx5 : x^5=0 := by rw [show 5=2+3 by omega,pow_add,hx,zero_mul]
 have hx6 : x^6=0 := by rw [show 6=2+4 by omega,pow_add,hx,zero_mul]
 have hx7 : x^7=0 := by rw [show 7=2+5 by omega,pow_add,hx,zero_mul]
 have hx8 : x^8=0 := by rw [show 8=2+6 by omega,pow_add,hx,zero_mul]
 have hx9 : x^9=0 := by rw [show 9=2+7 by omega,pow_add,hx,zero_mul]
 have hx10 : x^10=0 := by rw [show 10=2+8 by omega,pow_add,hx,zero_mul]
 have hx11 : x^11=0 := by rw [show 11=2+9 by omega,pow_add,hx,zero_mul]
 have hx12 : x^12=0 := by rw [show 12=2+10 by omega,pow_add,hx,zero_mul]
 have hx13 : x^13=0 := by rw [show 13=2+11 by omega,pow_add,hx,zero_mul]
 have hx14 : x^14=0 := by rw [show 14=2+12 by omega,pow_add,hx,zero_mul]
 unfold fourthNumeratorBC fourMomentBE fourSourceMoment897
 dsimp only
 split_ifs
 all_goals
  simp only [firstNumBC,secondNumBC,boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,localThirdNumBC,localFourNumBC,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,hx,hx3,hx4,hx5,hx6,hx7,hx8,hx9,hx10,hx11,hx12,hx13,hx14,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
  ring_nf
  simp only [hx,mul_zero,add_zero]
end
end MathGKM.Markov
