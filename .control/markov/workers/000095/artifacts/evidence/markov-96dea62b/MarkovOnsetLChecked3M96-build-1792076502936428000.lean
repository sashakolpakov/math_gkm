import MarkovOnsetExpand3M96
import MarkovOnsetExpand4M96
import MarkovOnsetExpand5M96
import MarkovOnsetGap30M96
import MarkovOnsetGap31M96
import MarkovOnsetGap32M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onsetL3M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤onsetValue4M96 (N+4) (R+C+5) (R+4)^2-onsetValue3M96 (N+4) (R+C+5) (R+4)*onsetValue5M96 (N+4) (R+C+5) (R+4) := by
 rw [onset_expand3M96,onset_expand4M96,onset_expand5M96]
 have he : (((onsetP4_0_0M96 N*R^0*C^0 + (onsetP4_0_1M96 N*R^0*C^1 + onsetP4_0_2M96 N*R^0*C^2)) + ((onsetP4_0_3M96 N*R^0*C^3 + onsetP4_0_4M96 N*R^0*C^4) + (onsetP4_1_0M96 N*R^1*C^0 + onsetP4_1_1M96 N*R^1*C^1))) + (((onsetP4_1_2M96 N*R^1*C^2 + onsetP4_1_3M96 N*R^1*C^3) + (onsetP4_2_0M96 N*R^2*C^0 + onsetP4_2_1M96 N*R^2*C^1)) + ((onsetP4_2_2M96 N*R^2*C^2 + onsetP4_3_0M96 N*R^3*C^0) + (onsetP4_3_1M96 N*R^3*C^1 + onsetP4_4_0M96 N*R^4*C^0))))^2-(((onsetP3_0_0M96 N*R^0*C^0 + (onsetP3_0_1M96 N*R^0*C^1 + onsetP3_0_2M96 N*R^0*C^2)) + ((onsetP3_0_3M96 N*R^0*C^3 + onsetP3_0_4M96 N*R^0*C^4) + (onsetP3_1_0M96 N*R^1*C^0 + onsetP3_1_1M96 N*R^1*C^1))) + (((onsetP3_1_2M96 N*R^1*C^2 + onsetP3_1_3M96 N*R^1*C^3) + (onsetP3_2_0M96 N*R^2*C^0 + onsetP3_2_1M96 N*R^2*C^1)) + ((onsetP3_2_2M96 N*R^2*C^2 + onsetP3_3_0M96 N*R^3*C^0) + (onsetP3_3_1M96 N*R^3*C^1 + onsetP3_4_0M96 N*R^4*C^0))))*(((onsetP5_0_0M96 N*R^0*C^0 + (onsetP5_0_1M96 N*R^0*C^1 + onsetP5_0_2M96 N*R^0*C^2)) + ((onsetP5_0_3M96 N*R^0*C^3 + onsetP5_0_4M96 N*R^0*C^4) + (onsetP5_1_0M96 N*R^1*C^0 + onsetP5_1_1M96 N*R^1*C^1))) + (((onsetP5_1_2M96 N*R^1*C^2 + onsetP5_1_3M96 N*R^1*C^3) + (onsetP5_2_0M96 N*R^2*C^0 + onsetP5_2_1M96 N*R^2*C^1)) + ((onsetP5_2_2M96 N*R^2*C^2 + onsetP5_3_0M96 N*R^3*C^0) + (onsetP5_3_1M96 N*R^3*C^1 + onsetP5_4_0M96 N*R^4*C^0))))=
 (((((onsetG3_0_0M96 N*R^0*C^0 + onsetG3_0_1M96 N*R^0*C^1) + (onsetG3_0_2M96 N*R^0*C^2 + (onsetG3_0_3M96 N*R^0*C^3 + onsetG3_0_4M96 N*R^0*C^4))) + ((onsetG3_0_5M96 N*R^0*C^5 + (onsetG3_0_6M96 N*R^0*C^6 + onsetG3_0_7M96 N*R^0*C^7)) + (onsetG3_0_8M96 N*R^0*C^8 + (onsetG3_1_0M96 N*R^1*C^0 + onsetG3_1_1M96 N*R^1*C^1)))) + (((onsetG3_1_2M96 N*R^1*C^2 + onsetG3_1_3M96 N*R^1*C^3) + (onsetG3_1_4M96 N*R^1*C^4 + (onsetG3_1_5M96 N*R^1*C^5 + onsetG3_1_6M96 N*R^1*C^6))) + ((onsetG3_1_7M96 N*R^1*C^7 + (onsetG3_2_0M96 N*R^2*C^0 + onsetG3_2_1M96 N*R^2*C^1)) + (onsetG3_2_2M96 N*R^2*C^2 + (onsetG3_2_3M96 N*R^2*C^3 + onsetG3_2_4M96 N*R^2*C^4))))) + ((((onsetG3_2_5M96 N*R^2*C^5 + onsetG3_2_6M96 N*R^2*C^6) + (onsetG3_3_0M96 N*R^3*C^0 + (onsetG3_3_1M96 N*R^3*C^1 + onsetG3_3_2M96 N*R^3*C^2))) + ((onsetG3_3_3M96 N*R^3*C^3 + (onsetG3_3_4M96 N*R^3*C^4 + onsetG3_3_5M96 N*R^3*C^5)) + (onsetG3_4_0M96 N*R^4*C^0 + (onsetG3_4_1M96 N*R^4*C^1 + onsetG3_4_2M96 N*R^4*C^2)))) + (((onsetG3_4_3M96 N*R^4*C^3 + (onsetG3_4_4M96 N*R^4*C^4 + onsetG3_5_0M96 N*R^5*C^0)) + (onsetG3_5_1M96 N*R^5*C^1 + (onsetG3_5_2M96 N*R^5*C^2 + onsetG3_5_3M96 N*R^5*C^3))) + ((onsetG3_6_0M96 N*R^6*C^0 + (onsetG3_6_1M96 N*R^6*C^1 + onsetG3_6_2M96 N*R^6*C^2)) + (onsetG3_7_0M96 N*R^7*C^0 + (onsetG3_7_1M96 N*R^7*C^1 + onsetG3_8_0M96 N*R^8*C^0)))))) := by
  unfold onsetG3_0_0M96 onsetG3_0_1M96 onsetG3_0_2M96 onsetG3_0_3M96 onsetG3_0_4M96 onsetG3_0_5M96 onsetG3_0_6M96 onsetG3_0_7M96 onsetG3_0_8M96 onsetG3_1_0M96 onsetG3_1_1M96 onsetG3_1_2M96 onsetG3_1_3M96 onsetG3_1_4M96 onsetG3_1_5M96 onsetG3_1_6M96 onsetG3_1_7M96 onsetG3_2_0M96 onsetG3_2_1M96 onsetG3_2_2M96 onsetG3_2_3M96 onsetG3_2_4M96 onsetG3_2_5M96 onsetG3_2_6M96 onsetG3_3_0M96 onsetG3_3_1M96 onsetG3_3_2M96 onsetG3_3_3M96 onsetG3_3_4M96 onsetG3_3_5M96 onsetG3_4_0M96 onsetG3_4_1M96 onsetG3_4_2M96 onsetG3_4_3M96 onsetG3_4_4M96 onsetG3_5_0M96 onsetG3_5_1M96 onsetG3_5_2M96 onsetG3_5_3M96 onsetG3_6_0M96 onsetG3_6_1M96 onsetG3_6_2M96 onsetG3_7_0M96 onsetG3_7_1M96 onsetG3_8_0M96
  ring
 rw [he]
 have hp00 := onsetG3_0_0M96_nonneg N hN
 have hp01 := onsetG3_0_1M96_nonneg N hN
 have hp02 := onsetG3_0_2M96_nonneg N hN
 have hp03 := onsetG3_0_3M96_nonneg N hN
 have hp04 := onsetG3_0_4M96_nonneg N hN
 have hp05 := onsetG3_0_5M96_nonneg N hN
 have hp06 := onsetG3_0_6M96_nonneg N hN
 have hp07 := onsetG3_0_7M96_nonneg N hN
 have hp08 := onsetG3_0_8M96_nonneg N hN
 have hp10 := onsetG3_1_0M96_nonneg N hN
 have hp11 := onsetG3_1_1M96_nonneg N hN
 have hp12 := onsetG3_1_2M96_nonneg N hN
 have hp13 := onsetG3_1_3M96_nonneg N hN
 have hp14 := onsetG3_1_4M96_nonneg N hN
 have hp15 := onsetG3_1_5M96_nonneg N hN
 have hp16 := onsetG3_1_6M96_nonneg N hN
 have hp17 := onsetG3_1_7M96_nonneg N hN
 have hp20 := onsetG3_2_0M96_nonneg N hN
 have hp21 := onsetG3_2_1M96_nonneg N hN
 have hp22 := onsetG3_2_2M96_nonneg N hN
 have hp23 := onsetG3_2_3M96_nonneg N hN
 have hp24 := onsetG3_2_4M96_nonneg N hN
 have hp25 := onsetG3_2_5M96_nonneg N hN
 have hp26 := onsetG3_2_6M96_nonneg N hN
 have hp30 := onsetG3_3_0M96_nonneg N hN
 have hp31 := onsetG3_3_1M96_nonneg N hN
 have hp32 := onsetG3_3_2M96_nonneg N hN
 have hp33 := onsetG3_3_3M96_nonneg N hN
 have hp34 := onsetG3_3_4M96_nonneg N hN
 have hp35 := onsetG3_3_5M96_nonneg N hN
 have hp40 := onsetG3_4_0M96_nonneg N hN
 have hp41 := onsetG3_4_1M96_nonneg N hN
 have hp42 := onsetG3_4_2M96_nonneg N hN
 have hp43 := onsetG3_4_3M96_nonneg N hN
 have hp44 := onsetG3_4_4M96_nonneg N hN
 have hp50 := onsetG3_5_0M96_nonneg N hN
 have hp51 := onsetG3_5_1M96_nonneg N hN
 have hp52 := onsetG3_5_2M96_nonneg N hN
 have hp53 := onsetG3_5_3M96_nonneg N hN
 have hp60 := onsetG3_6_0M96_nonneg N hN
 have hp61 := onsetG3_6_1M96_nonneg N hN
 have hp62 := onsetG3_6_2M96_nonneg N hN
 have hp70 := onsetG3_7_0M96_nonneg N hN
 have hp71 := onsetG3_7_1M96_nonneg N hN
 have hp80 := onsetG3_8_0M96_nonneg N hN
 positivity
end
end MathGKM.Markov
