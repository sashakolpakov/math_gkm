import MarkovOnsetColumn10M96
import MarkovOnsetColumn11M96
import MarkovOnsetColumn12M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onsetL1M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤onsetValue2M96 (N+4) (R+C+5) (R+4)^2-onsetValue1M96 (N+4) (R+C+5) (R+4)*onsetValue3M96 (N+4) (R+C+5) (R+4) := by
 rw [onset_columns1M96,onset_columns2M96,onset_columns3M96]
 have he : ((onsetColumn2_0M96 N R*C^0 + onsetColumn2_1M96 N R*C^1) + (onsetColumn2_2M96 N R*C^2 + (onsetColumn2_3M96 N R*C^3 + onsetColumn2_4M96 N R*C^4)))^2-((onsetColumn1_0M96 N R*C^0 + onsetColumn1_1M96 N R*C^1) + (onsetColumn1_2M96 N R*C^2 + (onsetColumn1_3M96 N R*C^3 + onsetColumn1_4M96 N R*C^4)))*((onsetColumn3_0M96 N R*C^0 + onsetColumn3_1M96 N R*C^1) + (onsetColumn3_2M96 N R*C^2 + (onsetColumn3_3M96 N R*C^3 + onsetColumn3_4M96 N R*C^4)))=(((onsetColumnGap1_0M96 N R*C^0 + onsetColumnGap1_1M96 N R*C^1) + (onsetColumnGap1_2M96 N R*C^2 + onsetColumnGap1_3M96 N R*C^3)) + ((onsetColumnGap1_4M96 N R*C^4 + onsetColumnGap1_5M96 N R*C^5) + (onsetColumnGap1_6M96 N R*C^6 + (onsetColumnGap1_7M96 N R*C^7 + onsetColumnGap1_8M96 N R*C^8)))) := by
  unfold onsetColumnGap1_0M96 onsetColumnGap1_1M96 onsetColumnGap1_2M96 onsetColumnGap1_3M96 onsetColumnGap1_4M96 onsetColumnGap1_5M96 onsetColumnGap1_6M96 onsetColumnGap1_7M96 onsetColumnGap1_8M96
  ring
 rw [he]
 have hp0 := onsetColumnGap1_0M96_nonneg N R hN hR
 have hp1 := onsetColumnGap1_1M96_nonneg N R hN hR
 have hp2 := onsetColumnGap1_2M96_nonneg N R hN hR
 have hp3 := onsetColumnGap1_3M96_nonneg N R hN hR
 have hp4 := onsetColumnGap1_4M96_nonneg N R hN hR
 have hp5 := onsetColumnGap1_5M96_nonneg N R hN hR
 have hp6 := onsetColumnGap1_6M96_nonneg N R hN hR
 have hp7 := onsetColumnGap1_7M96_nonneg N R hN hR
 have hp8 := onsetColumnGap1_8M96_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
