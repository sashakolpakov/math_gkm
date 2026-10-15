import MarkovOnsetExpand1M96
import MarkovOnsetExpand2M96
import MarkovOnsetExpand3M96
import MarkovOnsetGap10M96
import MarkovOnsetGap11M96
import MarkovOnsetGap12M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onsetL1M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤onsetValue2M96 (N+4) (R+C+5) (R+4)^2-onsetValue1M96 (N+4) (R+C+5) (R+4)*onsetValue3M96 (N+4) (R+C+5) (R+4) := by
 rw [onset_expand1M96,onset_expand2M96,onset_expand3M96]
 have he : (((onsetP2_0_0M96 N*R^0*C^0 + (onsetP2_0_1M96 N*R^0*C^1 + onsetP2_0_2M96 N*R^0*C^2)) + ((onsetP2_0_3M96 N*R^0*C^3 + onsetP2_0_4M96 N*R^0*C^4) + (onsetP2_1_0M96 N*R^1*C^0 + onsetP2_1_1M96 N*R^1*C^1))) + (((onsetP2_1_2M96 N*R^1*C^2 + onsetP2_1_3M96 N*R^1*C^3) + (onsetP2_2_0M96 N*R^2*C^0 + onsetP2_2_1M96 N*R^2*C^1)) + ((onsetP2_2_2M96 N*R^2*C^2 + onsetP2_3_0M96 N*R^3*C^0) + (onsetP2_3_1M96 N*R^3*C^1 + onsetP2_4_0M96 N*R^4*C^0))))^2-(((onsetP1_0_0M96 N*R^0*C^0 + (onsetP1_0_1M96 N*R^0*C^1 + onsetP1_0_2M96 N*R^0*C^2)) + ((onsetP1_0_3M96 N*R^0*C^3 + onsetP1_0_4M96 N*R^0*C^4) + (onsetP1_1_0M96 N*R^1*C^0 + onsetP1_1_1M96 N*R^1*C^1))) + (((onsetP1_1_2M96 N*R^1*C^2 + onsetP1_1_3M96 N*R^1*C^3) + (onsetP1_2_0M96 N*R^2*C^0 + onsetP1_2_1M96 N*R^2*C^1)) + ((onsetP1_2_2M96 N*R^2*C^2 + onsetP1_3_0M96 N*R^3*C^0) + (onsetP1_3_1M96 N*R^3*C^1 + onsetP1_4_0M96 N*R^4*C^0))))*(((onsetP3_0_0M96 N*R^0*C^0 + (onsetP3_0_1M96 N*R^0*C^1 + onsetP3_0_2M96 N*R^0*C^2)) + ((onsetP3_0_3M96 N*R^0*C^3 + onsetP3_0_4M96 N*R^0*C^4) + (onsetP3_1_0M96 N*R^1*C^0 + onsetP3_1_1M96 N*R^1*C^1))) + (((onsetP3_1_2M96 N*R^1*C^2 + onsetP3_1_3M96 N*R^1*C^3) + (onsetP3_2_0M96 N*R^2*C^0 + onsetP3_2_1M96 N*R^2*C^1)) + ((onsetP3_2_2M96 N*R^2*C^2 + onsetP3_3_0M96 N*R^3*C^0) + (onsetP3_3_1M96 N*R^3*C^1 + onsetP3_4_0M96 N*R^4*C^0))))=
 (((((onsetG1_0_0M96 N*R^0*C^0 + onsetG1_0_1M96 N*R^0*C^1) + (onsetG1_0_2M96 N*R^0*C^2 + (onsetG1_0_3M96 N*R^0*C^3 + onsetG1_0_4M96 N*R^0*C^4))) + ((onsetG1_0_5M96 N*R^0*C^5 + (onsetG1_0_6M96 N*R^0*C^6 + onsetG1_0_7M96 N*R^0*C^7)) + (onsetG1_0_8M96 N*R^0*C^8 + (onsetG1_1_0M96 N*R^1*C^0 + onsetG1_1_1M96 N*R^1*C^1)))) + (((onsetG1_1_2M96 N*R^1*C^2 + onsetG1_1_3M96 N*R^1*C^3) + (onsetG1_1_4M96 N*R^1*C^4 + (onsetG1_1_5M96 N*R^1*C^5 + onsetG1_1_6M96 N*R^1*C^6))) + ((onsetG1_1_7M96 N*R^1*C^7 + (onsetG1_2_0M96 N*R^2*C^0 + onsetG1_2_1M96 N*R^2*C^1)) + (onsetG1_2_2M96 N*R^2*C^2 + (onsetG1_2_3M96 N*R^2*C^3 + onsetG1_2_4M96 N*R^2*C^4))))) + ((((onsetG1_2_5M96 N*R^2*C^5 + onsetG1_2_6M96 N*R^2*C^6) + (onsetG1_3_0M96 N*R^3*C^0 + (onsetG1_3_1M96 N*R^3*C^1 + onsetG1_3_2M96 N*R^3*C^2))) + ((onsetG1_3_3M96 N*R^3*C^3 + (onsetG1_3_4M96 N*R^3*C^4 + onsetG1_3_5M96 N*R^3*C^5)) + (onsetG1_4_0M96 N*R^4*C^0 + (onsetG1_4_1M96 N*R^4*C^1 + onsetG1_4_2M96 N*R^4*C^2)))) + (((onsetG1_4_3M96 N*R^4*C^3 + (onsetG1_4_4M96 N*R^4*C^4 + onsetG1_5_0M96 N*R^5*C^0)) + (onsetG1_5_1M96 N*R^5*C^1 + (onsetG1_5_2M96 N*R^5*C^2 + onsetG1_5_3M96 N*R^5*C^3))) + ((onsetG1_6_0M96 N*R^6*C^0 + (onsetG1_6_1M96 N*R^6*C^1 + onsetG1_6_2M96 N*R^6*C^2)) + (onsetG1_7_0M96 N*R^7*C^0 + (onsetG1_7_1M96 N*R^7*C^1 + onsetG1_8_0M96 N*R^8*C^0)))))) := by
  unfold onsetG1_0_0M96 onsetG1_0_1M96 onsetG1_0_2M96 onsetG1_0_3M96 onsetG1_0_4M96 onsetG1_0_5M96 onsetG1_0_6M96 onsetG1_0_7M96 onsetG1_0_8M96 onsetG1_1_0M96 onsetG1_1_1M96 onsetG1_1_2M96 onsetG1_1_3M96 onsetG1_1_4M96 onsetG1_1_5M96 onsetG1_1_6M96 onsetG1_1_7M96 onsetG1_2_0M96 onsetG1_2_1M96 onsetG1_2_2M96 onsetG1_2_3M96 onsetG1_2_4M96 onsetG1_2_5M96 onsetG1_2_6M96 onsetG1_3_0M96 onsetG1_3_1M96 onsetG1_3_2M96 onsetG1_3_3M96 onsetG1_3_4M96 onsetG1_3_5M96 onsetG1_4_0M96 onsetG1_4_1M96 onsetG1_4_2M96 onsetG1_4_3M96 onsetG1_4_4M96 onsetG1_5_0M96 onsetG1_5_1M96 onsetG1_5_2M96 onsetG1_5_3M96 onsetG1_6_0M96 onsetG1_6_1M96 onsetG1_6_2M96 onsetG1_7_0M96 onsetG1_7_1M96 onsetG1_8_0M96
  ring
 rw [he]
 have hp00 := onsetG1_0_0M96_nonneg N hN
 have hp01 := onsetG1_0_1M96_nonneg N hN
 have hp02 := onsetG1_0_2M96_nonneg N hN
 have hp03 := onsetG1_0_3M96_nonneg N hN
 have hp04 := onsetG1_0_4M96_nonneg N hN
 have hp05 := onsetG1_0_5M96_nonneg N hN
 have hp06 := onsetG1_0_6M96_nonneg N hN
 have hp07 := onsetG1_0_7M96_nonneg N hN
 have hp08 := onsetG1_0_8M96_nonneg N hN
 have hp10 := onsetG1_1_0M96_nonneg N hN
 have hp11 := onsetG1_1_1M96_nonneg N hN
 have hp12 := onsetG1_1_2M96_nonneg N hN
 have hp13 := onsetG1_1_3M96_nonneg N hN
 have hp14 := onsetG1_1_4M96_nonneg N hN
 have hp15 := onsetG1_1_5M96_nonneg N hN
 have hp16 := onsetG1_1_6M96_nonneg N hN
 have hp17 := onsetG1_1_7M96_nonneg N hN
 have hp20 := onsetG1_2_0M96_nonneg N hN
 have hp21 := onsetG1_2_1M96_nonneg N hN
 have hp22 := onsetG1_2_2M96_nonneg N hN
 have hp23 := onsetG1_2_3M96_nonneg N hN
 have hp24 := onsetG1_2_4M96_nonneg N hN
 have hp25 := onsetG1_2_5M96_nonneg N hN
 have hp26 := onsetG1_2_6M96_nonneg N hN
 have hp30 := onsetG1_3_0M96_nonneg N hN
 have hp31 := onsetG1_3_1M96_nonneg N hN
 have hp32 := onsetG1_3_2M96_nonneg N hN
 have hp33 := onsetG1_3_3M96_nonneg N hN
 have hp34 := onsetG1_3_4M96_nonneg N hN
 have hp35 := onsetG1_3_5M96_nonneg N hN
 have hp40 := onsetG1_4_0M96_nonneg N hN
 have hp41 := onsetG1_4_1M96_nonneg N hN
 have hp42 := onsetG1_4_2M96_nonneg N hN
 have hp43 := onsetG1_4_3M96_nonneg N hN
 have hp44 := onsetG1_4_4M96_nonneg N hN
 have hp50 := onsetG1_5_0M96_nonneg N hN
 have hp51 := onsetG1_5_1M96_nonneg N hN
 have hp52 := onsetG1_5_2M96_nonneg N hN
 have hp53 := onsetG1_5_3M96_nonneg N hN
 have hp60 := onsetG1_6_0M96_nonneg N hN
 have hp61 := onsetG1_6_1M96_nonneg N hN
 have hp62 := onsetG1_6_2M96_nonneg N hN
 have hp70 := onsetG1_7_0M96_nonneg N hN
 have hp71 := onsetG1_7_1M96_nonneg N hN
 have hp80 := onsetG1_8_0M96_nonneg N hN
 positivity
end
end MathGKM.Markov
