import MarkovOnsetColumn40M96
import MarkovOnsetColumn41M96
import MarkovOnsetColumn42M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onsetL4M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤onsetValue5M96 (N+4) (R+C+5) (R+4)^2-onsetValue4M96 (N+4) (R+C+5) (R+4)*onsetValue6M96 (N+4) (R+C+5) (R+4) := by
 rw [onset_columns4M96,onset_columns5M96,onset_columns6M96]
 have he : ((onsetColumn5_0M96 N R*C^0 + onsetColumn5_1M96 N R*C^1) + (onsetColumn5_2M96 N R*C^2 + (onsetColumn5_3M96 N R*C^3 + onsetColumn5_4M96 N R*C^4)))^2-((onsetColumn4_0M96 N R*C^0 + onsetColumn4_1M96 N R*C^1) + (onsetColumn4_2M96 N R*C^2 + (onsetColumn4_3M96 N R*C^3 + onsetColumn4_4M96 N R*C^4)))*((onsetColumn6_0M96 N R*C^0 + onsetColumn6_1M96 N R*C^1) + (onsetColumn6_2M96 N R*C^2 + (onsetColumn6_3M96 N R*C^3 + onsetColumn6_4M96 N R*C^4)))=(((onsetColumnGap4_0M96 N R*C^0 + onsetColumnGap4_1M96 N R*C^1) + (onsetColumnGap4_2M96 N R*C^2 + onsetColumnGap4_3M96 N R*C^3)) + ((onsetColumnGap4_4M96 N R*C^4 + onsetColumnGap4_5M96 N R*C^5) + (onsetColumnGap4_6M96 N R*C^6 + (onsetColumnGap4_7M96 N R*C^7 + onsetColumnGap4_8M96 N R*C^8)))) := by
  unfold onsetColumnGap4_0M96 onsetColumnGap4_1M96 onsetColumnGap4_2M96 onsetColumnGap4_3M96 onsetColumnGap4_4M96 onsetColumnGap4_5M96 onsetColumnGap4_6M96 onsetColumnGap4_7M96 onsetColumnGap4_8M96
  ring
 rw [he]
 have hp0 := onsetColumnGap4_0M96_nonneg N R hN hR
 have hp1 := onsetColumnGap4_1M96_nonneg N R hN hR
 have hp2 := onsetColumnGap4_2M96_nonneg N R hN hR
 have hp3 := onsetColumnGap4_3M96_nonneg N R hN hR
 have hp4 := onsetColumnGap4_4M96_nonneg N R hN hR
 have hp5 := onsetColumnGap4_5M96_nonneg N R hN hR
 have hp6 := onsetColumnGap4_6M96_nonneg N R hN hR
 have hp7 := onsetColumnGap4_7M96_nonneg N R hN hR
 have hp8 := onsetColumnGap4_8M96_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
