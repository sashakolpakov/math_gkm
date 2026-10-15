import MarkovOnsetColumn30M96
import MarkovOnsetColumn31M96
import MarkovOnsetColumn32M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onsetL3M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤onsetValue4M96 (N+4) (R+C+5) (R+4)^2-onsetValue3M96 (N+4) (R+C+5) (R+4)*onsetValue5M96 (N+4) (R+C+5) (R+4) := by
 rw [onset_columns3M96,onset_columns4M96,onset_columns5M96]
 have he : ((onsetColumn4_0M96 N R*C^0 + onsetColumn4_1M96 N R*C^1) + (onsetColumn4_2M96 N R*C^2 + (onsetColumn4_3M96 N R*C^3 + onsetColumn4_4M96 N R*C^4)))^2-((onsetColumn3_0M96 N R*C^0 + onsetColumn3_1M96 N R*C^1) + (onsetColumn3_2M96 N R*C^2 + (onsetColumn3_3M96 N R*C^3 + onsetColumn3_4M96 N R*C^4)))*((onsetColumn5_0M96 N R*C^0 + onsetColumn5_1M96 N R*C^1) + (onsetColumn5_2M96 N R*C^2 + (onsetColumn5_3M96 N R*C^3 + onsetColumn5_4M96 N R*C^4)))=(((onsetColumnGap3_0M96 N R*C^0 + onsetColumnGap3_1M96 N R*C^1) + (onsetColumnGap3_2M96 N R*C^2 + onsetColumnGap3_3M96 N R*C^3)) + ((onsetColumnGap3_4M96 N R*C^4 + onsetColumnGap3_5M96 N R*C^5) + (onsetColumnGap3_6M96 N R*C^6 + (onsetColumnGap3_7M96 N R*C^7 + onsetColumnGap3_8M96 N R*C^8)))) := by
  unfold onsetColumnGap3_0M96 onsetColumnGap3_1M96 onsetColumnGap3_2M96 onsetColumnGap3_3M96 onsetColumnGap3_4M96 onsetColumnGap3_5M96 onsetColumnGap3_6M96 onsetColumnGap3_7M96 onsetColumnGap3_8M96
  ring
 rw [he]
 have hp0 := onsetColumnGap3_0M96_nonneg N R hN hR
 have hp1 := onsetColumnGap3_1M96_nonneg N R hN hR
 have hp2 := onsetColumnGap3_2M96_nonneg N R hN hR
 have hp3 := onsetColumnGap3_3M96_nonneg N R hN hR
 have hp4 := onsetColumnGap3_4M96_nonneg N R hN hR
 have hp5 := onsetColumnGap3_5M96_nonneg N R hN hR
 have hp6 := onsetColumnGap3_6M96_nonneg N R hN hR
 have hp7 := onsetColumnGap3_7M96_nonneg N R hN hR
 have hp8 := onsetColumnGap3_8M96_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
