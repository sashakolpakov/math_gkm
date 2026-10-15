import MarkovFourLinearDefsCC
/-! Machine-authored cc599cf1. Split square-zero calculation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem localFour_linear1CC {A : Type*} [CommRing A] (N Z x : A) (r s : Bool) (hz : Z^2=0) :
 localFourNumBC N Z x false true r s=linearFourCC N Z x false true r := by
 have hz3 : Z^3=0 := by rw [show 3=2+1 by omega,pow_add,hz,zero_mul]
 have hz4 : Z^4=0 := by rw [show 4=2+2 by omega,pow_add,hz,zero_mul]
 have hz5 : Z^5=0 := by rw [show 5=2+3 by omega,pow_add,hz,zero_mul]
 have hz6 : Z^6=0 := by rw [show 6=2+4 by omega,pow_add,hz,zero_mul]
 have hz7 : Z^7=0 := by rw [show 7=2+5 by omega,pow_add,hz,zero_mul]
 have hz8 : Z^8=0 := by rw [show 8=2+6 by omega,pow_add,hz,zero_mul]
 cases r <;> cases s
 all_goals
  simp only [localFourNumBC,linearFourCC,gaugea1BC,gaugea2BC,gaugeb2BC,gaugeb3BC,gaugec1BC,gaugec2BC,gaugec3BC,gauged1BC,gauged2BC,gauged3BC,gauged4BC,gaugeNum00a1BC,gaugeNum00a2BC,gaugeNum00b2BC,gaugeNum00b3BC,gaugeNum00c1BC,gaugeNum00c2BC,gaugeNum00c3BC,gaugeNum00d1BC,gaugeNum00d2BC,gaugeNum00d3BC,gaugeNum00d4BC,gaugeNum01a1BC,gaugeNum01a2BC,gaugeNum01b2BC,gaugeNum01b3BC,gaugeNum01c1BC,gaugeNum01c2BC,gaugeNum01c3BC,gaugeNum01d1BC,gaugeNum01d2BC,gaugeNum01d3BC,gaugeNum01d4BC,gaugeNum10a1BC,gaugeNum10a2BC,gaugeNum10b2BC,gaugeNum10b3BC,gaugeNum10c1BC,gaugeNum10c2BC,gaugeNum10c3BC,gaugeNum10d1BC,gaugeNum10d2BC,gaugeNum10d3BC,gaugeNum10d4BC,gaugeNum11a1BC,gaugeNum11a2BC,gaugeNum11b2BC,gaugeNum11b3BC,gaugeNum11c1BC,gaugeNum11c2BC,gaugeNum11c3BC,gaugeNum11d1BC,gaugeNum11d2BC,gaugeNum11d3BC,gaugeNum11d4BC,hz,hz3,hz4,hz5,hz6,hz7,hz8,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
  ring_nf
  simp only [hz,hz3,hz4,hz5,hz6,hz7,hz8,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
end
end MathGKM.Markov
