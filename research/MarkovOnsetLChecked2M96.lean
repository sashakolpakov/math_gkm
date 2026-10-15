import MarkovOnsetExpand2M96
import MarkovOnsetExpand3M96
import MarkovOnsetExpand4M96
import MarkovOnsetGap20M96
import MarkovOnsetGap21M96
import MarkovOnsetGap22M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem onsetL2M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤onsetValue3M96 (N+4) (R+C+5) (R+4)^2-onsetValue2M96 (N+4) (R+C+5) (R+4)*onsetValue4M96 (N+4) (R+C+5) (R+4) := by
 rw [onset_expand2M96,onset_expand3M96,onset_expand4M96]
 have he : (((onsetP3_0_0M96 N*R^0*C^0 + (onsetP3_0_1M96 N*R^0*C^1 + onsetP3_0_2M96 N*R^0*C^2)) + ((onsetP3_0_3M96 N*R^0*C^3 + onsetP3_0_4M96 N*R^0*C^4) + (onsetP3_1_0M96 N*R^1*C^0 + onsetP3_1_1M96 N*R^1*C^1))) + (((onsetP3_1_2M96 N*R^1*C^2 + onsetP3_1_3M96 N*R^1*C^3) + (onsetP3_2_0M96 N*R^2*C^0 + onsetP3_2_1M96 N*R^2*C^1)) + ((onsetP3_2_2M96 N*R^2*C^2 + onsetP3_3_0M96 N*R^3*C^0) + (onsetP3_3_1M96 N*R^3*C^1 + onsetP3_4_0M96 N*R^4*C^0))))^2-(((onsetP2_0_0M96 N*R^0*C^0 + (onsetP2_0_1M96 N*R^0*C^1 + onsetP2_0_2M96 N*R^0*C^2)) + ((onsetP2_0_3M96 N*R^0*C^3 + onsetP2_0_4M96 N*R^0*C^4) + (onsetP2_1_0M96 N*R^1*C^0 + onsetP2_1_1M96 N*R^1*C^1))) + (((onsetP2_1_2M96 N*R^1*C^2 + onsetP2_1_3M96 N*R^1*C^3) + (onsetP2_2_0M96 N*R^2*C^0 + onsetP2_2_1M96 N*R^2*C^1)) + ((onsetP2_2_2M96 N*R^2*C^2 + onsetP2_3_0M96 N*R^3*C^0) + (onsetP2_3_1M96 N*R^3*C^1 + onsetP2_4_0M96 N*R^4*C^0))))*(((onsetP4_0_0M96 N*R^0*C^0 + (onsetP4_0_1M96 N*R^0*C^1 + onsetP4_0_2M96 N*R^0*C^2)) + ((onsetP4_0_3M96 N*R^0*C^3 + onsetP4_0_4M96 N*R^0*C^4) + (onsetP4_1_0M96 N*R^1*C^0 + onsetP4_1_1M96 N*R^1*C^1))) + (((onsetP4_1_2M96 N*R^1*C^2 + onsetP4_1_3M96 N*R^1*C^3) + (onsetP4_2_0M96 N*R^2*C^0 + onsetP4_2_1M96 N*R^2*C^1)) + ((onsetP4_2_2M96 N*R^2*C^2 + onsetP4_3_0M96 N*R^3*C^0) + (onsetP4_3_1M96 N*R^3*C^1 + onsetP4_4_0M96 N*R^4*C^0))))=
 (((((onsetG2_0_0M96 N*R^0*C^0 + onsetG2_0_1M96 N*R^0*C^1) + (onsetG2_0_2M96 N*R^0*C^2 + (onsetG2_0_3M96 N*R^0*C^3 + onsetG2_0_4M96 N*R^0*C^4))) + ((onsetG2_0_5M96 N*R^0*C^5 + (onsetG2_0_6M96 N*R^0*C^6 + onsetG2_0_7M96 N*R^0*C^7)) + (onsetG2_0_8M96 N*R^0*C^8 + (onsetG2_1_0M96 N*R^1*C^0 + onsetG2_1_1M96 N*R^1*C^1)))) + (((onsetG2_1_2M96 N*R^1*C^2 + onsetG2_1_3M96 N*R^1*C^3) + (onsetG2_1_4M96 N*R^1*C^4 + (onsetG2_1_5M96 N*R^1*C^5 + onsetG2_1_6M96 N*R^1*C^6))) + ((onsetG2_1_7M96 N*R^1*C^7 + (onsetG2_2_0M96 N*R^2*C^0 + onsetG2_2_1M96 N*R^2*C^1)) + (onsetG2_2_2M96 N*R^2*C^2 + (onsetG2_2_3M96 N*R^2*C^3 + onsetG2_2_4M96 N*R^2*C^4))))) + ((((onsetG2_2_5M96 N*R^2*C^5 + onsetG2_2_6M96 N*R^2*C^6) + (onsetG2_3_0M96 N*R^3*C^0 + (onsetG2_3_1M96 N*R^3*C^1 + onsetG2_3_2M96 N*R^3*C^2))) + ((onsetG2_3_3M96 N*R^3*C^3 + (onsetG2_3_4M96 N*R^3*C^4 + onsetG2_3_5M96 N*R^3*C^5)) + (onsetG2_4_0M96 N*R^4*C^0 + (onsetG2_4_1M96 N*R^4*C^1 + onsetG2_4_2M96 N*R^4*C^2)))) + (((onsetG2_4_3M96 N*R^4*C^3 + (onsetG2_4_4M96 N*R^4*C^4 + onsetG2_5_0M96 N*R^5*C^0)) + (onsetG2_5_1M96 N*R^5*C^1 + (onsetG2_5_2M96 N*R^5*C^2 + onsetG2_5_3M96 N*R^5*C^3))) + ((onsetG2_6_0M96 N*R^6*C^0 + (onsetG2_6_1M96 N*R^6*C^1 + onsetG2_6_2M96 N*R^6*C^2)) + (onsetG2_7_0M96 N*R^7*C^0 + (onsetG2_7_1M96 N*R^7*C^1 + onsetG2_8_0M96 N*R^8*C^0)))))) := by
  unfold onsetG2_0_0M96 onsetG2_0_1M96 onsetG2_0_2M96 onsetG2_0_3M96 onsetG2_0_4M96 onsetG2_0_5M96 onsetG2_0_6M96 onsetG2_0_7M96 onsetG2_0_8M96 onsetG2_1_0M96 onsetG2_1_1M96 onsetG2_1_2M96 onsetG2_1_3M96 onsetG2_1_4M96 onsetG2_1_5M96 onsetG2_1_6M96 onsetG2_1_7M96 onsetG2_2_0M96 onsetG2_2_1M96 onsetG2_2_2M96 onsetG2_2_3M96 onsetG2_2_4M96 onsetG2_2_5M96 onsetG2_2_6M96 onsetG2_3_0M96 onsetG2_3_1M96 onsetG2_3_2M96 onsetG2_3_3M96 onsetG2_3_4M96 onsetG2_3_5M96 onsetG2_4_0M96 onsetG2_4_1M96 onsetG2_4_2M96 onsetG2_4_3M96 onsetG2_4_4M96 onsetG2_5_0M96 onsetG2_5_1M96 onsetG2_5_2M96 onsetG2_5_3M96 onsetG2_6_0M96 onsetG2_6_1M96 onsetG2_6_2M96 onsetG2_7_0M96 onsetG2_7_1M96 onsetG2_8_0M96
  ring
 rw [he]
 have hp00 := onsetG2_0_0M96_nonneg N hN
 have hp01 := onsetG2_0_1M96_nonneg N hN
 have hp02 := onsetG2_0_2M96_nonneg N hN
 have hp03 := onsetG2_0_3M96_nonneg N hN
 have hp04 := onsetG2_0_4M96_nonneg N hN
 have hp05 := onsetG2_0_5M96_nonneg N hN
 have hp06 := onsetG2_0_6M96_nonneg N hN
 have hp07 := onsetG2_0_7M96_nonneg N hN
 have hp08 := onsetG2_0_8M96_nonneg N hN
 have hp10 := onsetG2_1_0M96_nonneg N hN
 have hp11 := onsetG2_1_1M96_nonneg N hN
 have hp12 := onsetG2_1_2M96_nonneg N hN
 have hp13 := onsetG2_1_3M96_nonneg N hN
 have hp14 := onsetG2_1_4M96_nonneg N hN
 have hp15 := onsetG2_1_5M96_nonneg N hN
 have hp16 := onsetG2_1_6M96_nonneg N hN
 have hp17 := onsetG2_1_7M96_nonneg N hN
 have hp20 := onsetG2_2_0M96_nonneg N hN
 have hp21 := onsetG2_2_1M96_nonneg N hN
 have hp22 := onsetG2_2_2M96_nonneg N hN
 have hp23 := onsetG2_2_3M96_nonneg N hN
 have hp24 := onsetG2_2_4M96_nonneg N hN
 have hp25 := onsetG2_2_5M96_nonneg N hN
 have hp26 := onsetG2_2_6M96_nonneg N hN
 have hp30 := onsetG2_3_0M96_nonneg N hN
 have hp31 := onsetG2_3_1M96_nonneg N hN
 have hp32 := onsetG2_3_2M96_nonneg N hN
 have hp33 := onsetG2_3_3M96_nonneg N hN
 have hp34 := onsetG2_3_4M96_nonneg N hN
 have hp35 := onsetG2_3_5M96_nonneg N hN
 have hp40 := onsetG2_4_0M96_nonneg N hN
 have hp41 := onsetG2_4_1M96_nonneg N hN
 have hp42 := onsetG2_4_2M96_nonneg N hN
 have hp43 := onsetG2_4_3M96_nonneg N hN
 have hp44 := onsetG2_4_4M96_nonneg N hN
 have hp50 := onsetG2_5_0M96_nonneg N hN
 have hp51 := onsetG2_5_1M96_nonneg N hN
 have hp52 := onsetG2_5_2M96_nonneg N hN
 have hp53 := onsetG2_5_3M96_nonneg N hN
 have hp60 := onsetG2_6_0M96_nonneg N hN
 have hp61 := onsetG2_6_1M96_nonneg N hN
 have hp62 := onsetG2_6_2M96_nonneg N hN
 have hp70 := onsetG2_7_0M96_nonneg N hN
 have hp71 := onsetG2_7_1M96_nonneg N hN
 have hp80 := onsetG2_8_0M96_nonneg N hN
 positivity
end
end MathGKM.Markov
