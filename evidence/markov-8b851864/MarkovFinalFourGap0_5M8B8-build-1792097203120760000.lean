import MarkovOnsetValues0M1B
/-! Machine-authored request 8b851864. Exact short-run final transition. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536

def finalFourGap0_5M8B8 (C R : ℤ) : ℤ := ((((((((130056192000*R + 832359628800)*R + 2015870976000)*R + 2181692620800)*R + 893729894400)*C + (((((2601123840000*R + 17427529728000)*R + 46404049305600)*R + 61025616691200)*R + 39485059891200)*R + 9978561331200))*C + ((((((19612473753600*R + 137261305036800)*R + 397224124416000)*R + 606952739635200)*R + 515673614131200)*R + 230261236531200)*R + 41889168921600))*C + (((((((65860455628800*R + 479725269811200)*R + 1491588454809600)*R + 2565774567014400)*R + 2634410096640000)*R + 1609959910809600)*R + 539142253977600)*R + 75667708569600))*C + ((((((((82949839257600*R + 626298598195200)*R + 2071079829504000)*R + 3921116155084800)*R + 4643027188531200)*R + 3510351555379200)*R + 1646751994675200)*R + 435240362188800)*R + 49315783910400))

theorem finalFour_lc0_5M8B8 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 onsetValue0_5M1B 4 (5+1*C+4*R) (1+0*C+1*R)*onsetValue0_7M1B 4 (5+1*C+4*R) (1+0*C+1*R)≤(onsetValue0_6M1B 4 (5+1*C+4*R) (1+0*C+1*R))^2 := by
 apply sub_nonneg.mp
 have he : (onsetValue0_6M1B 4 (5+1*C+4*R) (1+0*C+1*R))^2-onsetValue0_5M1B 4 (5+1*C+4*R) (1+0*C+1*R)*onsetValue0_7M1B 4 (5+1*C+4*R) (1+0*C+1*R)=finalFourGap0_5M8B8 C R := by
  unfold onsetValue0_5M1B onsetValue0_6M1B onsetValue0_7M1B backShape0M94 onsetCorrection0_5M1B onsetCorrection0_6M1B onsetCorrection0_7M1B finalFourGap0_5M8B8
  ring
 rw [he]
 unfold finalFourGap0_5M8B8
 positivity
end
end MathGKM.Markov
