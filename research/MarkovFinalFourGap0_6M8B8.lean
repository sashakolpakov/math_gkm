import MarkovOnsetValues0M1B
/-! Machine-authored request 8b851864. Exact short-run final transition. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536

def finalFourGap0_6M8B8 (C R : ℤ) : ℤ := ((((((((65028096000*R + 507219148800)*R + 1689104793600)*R + 3062823321600)*R + 3183938150400)*R + 1799652556800)*R + 432538444800)*C + (((((((598258483200*R + 4669017292800)*R + 15834341376000)*R + 30137271091200)*R + 34698992025600)*R + 24157937664000)*R + 9427448217600)*R + 1596642969600))*C + ((((((((1391601254400*R + 10872697651200)*R + 37498451558400)*R + 74392141824000)*R + 92814601420800)*R + 74645751398400)*R + 37894310092800)*R + 11158821273600)*R + 1471362278400))

theorem finalFour_lc0_6M8B8 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 onsetValue0_6M1B 4 (5+1*C+4*R) (1+0*C+1*R)*onsetValue0_8M1B 4 (5+1*C+4*R) (1+0*C+1*R)≤(onsetValue0_7M1B 4 (5+1*C+4*R) (1+0*C+1*R))^2 := by
 apply sub_nonneg.mp
 have he : (onsetValue0_7M1B 4 (5+1*C+4*R) (1+0*C+1*R))^2-onsetValue0_6M1B 4 (5+1*C+4*R) (1+0*C+1*R)*onsetValue0_8M1B 4 (5+1*C+4*R) (1+0*C+1*R)=finalFourGap0_6M8B8 C R := by
  unfold onsetValue0_6M1B onsetValue0_7M1B onsetValue0_8M1B backShape0M94 onsetCorrection0_6M1B onsetCorrection0_7M1B onsetCorrection0_8M1B finalFourGap0_6M8B8
  ring
 rw [he]
 unfold finalFourGap0_6M8B8
 positivity
end
end MathGKM.Markov
