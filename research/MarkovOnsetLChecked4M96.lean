import MarkovOnsetExpand4M96
import MarkovOnsetExpand5M96
import MarkovOnsetExpand6M96
import MarkovOnsetGap40M96
import MarkovOnsetGap41M96
import MarkovOnsetGap42M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onsetL4M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤onsetValue5M96 (N+4) (R+C+5) (R+4)^2-onsetValue4M96 (N+4) (R+C+5) (R+4)*onsetValue6M96 (N+4) (R+C+5) (R+4) := by
 rw [onset_expand4M96,onset_expand5M96,onset_expand6M96]
 have he : (((onsetP5_0_0M96 N*R^0*C^0 + (onsetP5_0_1M96 N*R^0*C^1 + onsetP5_0_2M96 N*R^0*C^2)) + ((onsetP5_0_3M96 N*R^0*C^3 + onsetP5_0_4M96 N*R^0*C^4) + (onsetP5_1_0M96 N*R^1*C^0 + onsetP5_1_1M96 N*R^1*C^1))) + (((onsetP5_1_2M96 N*R^1*C^2 + onsetP5_1_3M96 N*R^1*C^3) + (onsetP5_2_0M96 N*R^2*C^0 + onsetP5_2_1M96 N*R^2*C^1)) + ((onsetP5_2_2M96 N*R^2*C^2 + onsetP5_3_0M96 N*R^3*C^0) + (onsetP5_3_1M96 N*R^3*C^1 + onsetP5_4_0M96 N*R^4*C^0))))^2-(((onsetP4_0_0M96 N*R^0*C^0 + (onsetP4_0_1M96 N*R^0*C^1 + onsetP4_0_2M96 N*R^0*C^2)) + ((onsetP4_0_3M96 N*R^0*C^3 + onsetP4_0_4M96 N*R^0*C^4) + (onsetP4_1_0M96 N*R^1*C^0 + onsetP4_1_1M96 N*R^1*C^1))) + (((onsetP4_1_2M96 N*R^1*C^2 + onsetP4_1_3M96 N*R^1*C^3) + (onsetP4_2_0M96 N*R^2*C^0 + onsetP4_2_1M96 N*R^2*C^1)) + ((onsetP4_2_2M96 N*R^2*C^2 + onsetP4_3_0M96 N*R^3*C^0) + (onsetP4_3_1M96 N*R^3*C^1 + onsetP4_4_0M96 N*R^4*C^0))))*(((onsetP6_0_0M96 N*R^0*C^0 + (onsetP6_0_1M96 N*R^0*C^1 + onsetP6_0_2M96 N*R^0*C^2)) + ((onsetP6_0_3M96 N*R^0*C^3 + onsetP6_0_4M96 N*R^0*C^4) + (onsetP6_1_0M96 N*R^1*C^0 + onsetP6_1_1M96 N*R^1*C^1))) + (((onsetP6_1_2M96 N*R^1*C^2 + onsetP6_1_3M96 N*R^1*C^3) + (onsetP6_2_0M96 N*R^2*C^0 + onsetP6_2_1M96 N*R^2*C^1)) + ((onsetP6_2_2M96 N*R^2*C^2 + onsetP6_3_0M96 N*R^3*C^0) + (onsetP6_3_1M96 N*R^3*C^1 + onsetP6_4_0M96 N*R^4*C^0))))=
 (((((onsetG4_0_0M96 N*R^0*C^0 + onsetG4_0_1M96 N*R^0*C^1) + (onsetG4_0_2M96 N*R^0*C^2 + (onsetG4_0_3M96 N*R^0*C^3 + onsetG4_0_4M96 N*R^0*C^4))) + ((onsetG4_0_5M96 N*R^0*C^5 + (onsetG4_0_6M96 N*R^0*C^6 + onsetG4_0_7M96 N*R^0*C^7)) + (onsetG4_0_8M96 N*R^0*C^8 + (onsetG4_1_0M96 N*R^1*C^0 + onsetG4_1_1M96 N*R^1*C^1)))) + (((onsetG4_1_2M96 N*R^1*C^2 + onsetG4_1_3M96 N*R^1*C^3) + (onsetG4_1_4M96 N*R^1*C^4 + (onsetG4_1_5M96 N*R^1*C^5 + onsetG4_1_6M96 N*R^1*C^6))) + ((onsetG4_1_7M96 N*R^1*C^7 + (onsetG4_2_0M96 N*R^2*C^0 + onsetG4_2_1M96 N*R^2*C^1)) + (onsetG4_2_2M96 N*R^2*C^2 + (onsetG4_2_3M96 N*R^2*C^3 + onsetG4_2_4M96 N*R^2*C^4))))) + ((((onsetG4_2_5M96 N*R^2*C^5 + onsetG4_2_6M96 N*R^2*C^6) + (onsetG4_3_0M96 N*R^3*C^0 + (onsetG4_3_1M96 N*R^3*C^1 + onsetG4_3_2M96 N*R^3*C^2))) + ((onsetG4_3_3M96 N*R^3*C^3 + (onsetG4_3_4M96 N*R^3*C^4 + onsetG4_3_5M96 N*R^3*C^5)) + (onsetG4_4_0M96 N*R^4*C^0 + (onsetG4_4_1M96 N*R^4*C^1 + onsetG4_4_2M96 N*R^4*C^2)))) + (((onsetG4_4_3M96 N*R^4*C^3 + (onsetG4_4_4M96 N*R^4*C^4 + onsetG4_5_0M96 N*R^5*C^0)) + (onsetG4_5_1M96 N*R^5*C^1 + (onsetG4_5_2M96 N*R^5*C^2 + onsetG4_5_3M96 N*R^5*C^3))) + ((onsetG4_6_0M96 N*R^6*C^0 + (onsetG4_6_1M96 N*R^6*C^1 + onsetG4_6_2M96 N*R^6*C^2)) + (onsetG4_7_0M96 N*R^7*C^0 + (onsetG4_7_1M96 N*R^7*C^1 + onsetG4_8_0M96 N*R^8*C^0)))))) := by
  unfold onsetG4_0_0M96 onsetG4_0_1M96 onsetG4_0_2M96 onsetG4_0_3M96 onsetG4_0_4M96 onsetG4_0_5M96 onsetG4_0_6M96 onsetG4_0_7M96 onsetG4_0_8M96 onsetG4_1_0M96 onsetG4_1_1M96 onsetG4_1_2M96 onsetG4_1_3M96 onsetG4_1_4M96 onsetG4_1_5M96 onsetG4_1_6M96 onsetG4_1_7M96 onsetG4_2_0M96 onsetG4_2_1M96 onsetG4_2_2M96 onsetG4_2_3M96 onsetG4_2_4M96 onsetG4_2_5M96 onsetG4_2_6M96 onsetG4_3_0M96 onsetG4_3_1M96 onsetG4_3_2M96 onsetG4_3_3M96 onsetG4_3_4M96 onsetG4_3_5M96 onsetG4_4_0M96 onsetG4_4_1M96 onsetG4_4_2M96 onsetG4_4_3M96 onsetG4_4_4M96 onsetG4_5_0M96 onsetG4_5_1M96 onsetG4_5_2M96 onsetG4_5_3M96 onsetG4_6_0M96 onsetG4_6_1M96 onsetG4_6_2M96 onsetG4_7_0M96 onsetG4_7_1M96 onsetG4_8_0M96
  ring
 rw [he]
 have hp00 := onsetG4_0_0M96_nonneg N hN
 have hp01 := onsetG4_0_1M96_nonneg N hN
 have hp02 := onsetG4_0_2M96_nonneg N hN
 have hp03 := onsetG4_0_3M96_nonneg N hN
 have hp04 := onsetG4_0_4M96_nonneg N hN
 have hp05 := onsetG4_0_5M96_nonneg N hN
 have hp06 := onsetG4_0_6M96_nonneg N hN
 have hp07 := onsetG4_0_7M96_nonneg N hN
 have hp08 := onsetG4_0_8M96_nonneg N hN
 have hp10 := onsetG4_1_0M96_nonneg N hN
 have hp11 := onsetG4_1_1M96_nonneg N hN
 have hp12 := onsetG4_1_2M96_nonneg N hN
 have hp13 := onsetG4_1_3M96_nonneg N hN
 have hp14 := onsetG4_1_4M96_nonneg N hN
 have hp15 := onsetG4_1_5M96_nonneg N hN
 have hp16 := onsetG4_1_6M96_nonneg N hN
 have hp17 := onsetG4_1_7M96_nonneg N hN
 have hp20 := onsetG4_2_0M96_nonneg N hN
 have hp21 := onsetG4_2_1M96_nonneg N hN
 have hp22 := onsetG4_2_2M96_nonneg N hN
 have hp23 := onsetG4_2_3M96_nonneg N hN
 have hp24 := onsetG4_2_4M96_nonneg N hN
 have hp25 := onsetG4_2_5M96_nonneg N hN
 have hp26 := onsetG4_2_6M96_nonneg N hN
 have hp30 := onsetG4_3_0M96_nonneg N hN
 have hp31 := onsetG4_3_1M96_nonneg N hN
 have hp32 := onsetG4_3_2M96_nonneg N hN
 have hp33 := onsetG4_3_3M96_nonneg N hN
 have hp34 := onsetG4_3_4M96_nonneg N hN
 have hp35 := onsetG4_3_5M96_nonneg N hN
 have hp40 := onsetG4_4_0M96_nonneg N hN
 have hp41 := onsetG4_4_1M96_nonneg N hN
 have hp42 := onsetG4_4_2M96_nonneg N hN
 have hp43 := onsetG4_4_3M96_nonneg N hN
 have hp44 := onsetG4_4_4M96_nonneg N hN
 have hp50 := onsetG4_5_0M96_nonneg N hN
 have hp51 := onsetG4_5_1M96_nonneg N hN
 have hp52 := onsetG4_5_2M96_nonneg N hN
 have hp53 := onsetG4_5_3M96_nonneg N hN
 have hp60 := onsetG4_6_0M96_nonneg N hN
 have hp61 := onsetG4_6_1M96_nonneg N hN
 have hp62 := onsetG4_6_2M96_nonneg N hN
 have hp70 := onsetG4_7_0M96_nonneg N hN
 have hp71 := onsetG4_7_1M96_nonneg N hN
 have hp80 := onsetG4_8_0M96_nonneg N hN
 positivity
end
end MathGKM.Markov
