import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onset_expand5M96 (N C R : ℤ) :
 onsetValue5M96 (N+4) (R+C+5) (R+4)=(((onsetP5_0_0M96 N*R^0*C^0 + (onsetP5_0_1M96 N*R^0*C^1 + onsetP5_0_2M96 N*R^0*C^2)) + ((onsetP5_0_3M96 N*R^0*C^3 + onsetP5_0_4M96 N*R^0*C^4) + (onsetP5_1_0M96 N*R^1*C^0 + onsetP5_1_1M96 N*R^1*C^1))) + (((onsetP5_1_2M96 N*R^1*C^2 + onsetP5_1_3M96 N*R^1*C^3) + (onsetP5_2_0M96 N*R^2*C^0 + onsetP5_2_1M96 N*R^2*C^1)) + ((onsetP5_2_2M96 N*R^2*C^2 + onsetP5_3_0M96 N*R^3*C^0) + (onsetP5_3_1M96 N*R^3*C^1 + onsetP5_4_0M96 N*R^4*C^0)))) := by
 unfold onsetValue5M96 onsetP5_0_0M96 onsetP5_0_1M96 onsetP5_0_2M96 onsetP5_0_3M96 onsetP5_0_4M96 onsetP5_1_0M96 onsetP5_1_1M96 onsetP5_1_2M96 onsetP5_1_3M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96
 ring
end
end MathGKM.Markov
