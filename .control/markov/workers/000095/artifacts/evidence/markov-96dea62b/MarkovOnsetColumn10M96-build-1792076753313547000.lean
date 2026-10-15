import MarkovOnsetColumnsM96
import MarkovOnsetGap10M96
import MarkovOnsetGap11M96
import MarkovOnsetGap12M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap1_0M96 (N R : ℤ) : ℤ := (onsetColumn2_0M96 N R*onsetColumn2_0M96 N R-onsetColumn1_0M96 N R*onsetColumn3_0M96 N R)

theorem onsetColumnGap1_0M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_0M96 N R := by
 have he : onsetColumnGap1_0M96 N R=(((onsetG1_0_0M96 N*R^0 + onsetG1_1_0M96 N*R^1) + (onsetG1_2_0M96 N*R^2 + onsetG1_3_0M96 N*R^3)) + ((onsetG1_4_0M96 N*R^4 + onsetG1_5_0M96 N*R^5) + (onsetG1_6_0M96 N*R^6 + (onsetG1_7_0M96 N*R^7 + onsetG1_8_0M96 N*R^8)))) := by
  unfold onsetColumnGap1_0M96 onsetColumn1_0M96 onsetColumn2_0M96 onsetColumn3_0M96 onsetG1_0_0M96 onsetG1_1_0M96 onsetG1_2_0M96 onsetG1_3_0M96 onsetG1_4_0M96 onsetG1_5_0M96 onsetG1_6_0M96 onsetG1_7_0M96 onsetG1_8_0M96
  ring
 rw [he]
 have hp0 := onsetG1_0_0M96_nonneg N hN
 have hp1 := onsetG1_1_0M96_nonneg N hN
 have hp2 := onsetG1_2_0M96_nonneg N hN
 have hp3 := onsetG1_3_0M96_nonneg N hN
 have hp4 := onsetG1_4_0M96_nonneg N hN
 have hp5 := onsetG1_5_0M96_nonneg N hN
 have hp6 := onsetG1_6_0M96_nonneg N hN
 have hp7 := onsetG1_7_0M96_nonneg N hN
 have hp8 := onsetG1_8_0M96_nonneg N hN
 positivity

def onsetColumnGap1_1M96 (N R : ℤ) : ℤ := ((onsetColumn2_0M96 N R*onsetColumn2_1M96 N R-onsetColumn1_0M96 N R*onsetColumn3_1M96 N R) + (onsetColumn2_1M96 N R*onsetColumn2_0M96 N R-onsetColumn1_1M96 N R*onsetColumn3_0M96 N R))

theorem onsetColumnGap1_1M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_1M96 N R := by
 have he : onsetColumnGap1_1M96 N R=(((onsetG1_0_1M96 N*R^0 + onsetG1_1_1M96 N*R^1) + (onsetG1_2_1M96 N*R^2 + onsetG1_3_1M96 N*R^3)) + ((onsetG1_4_1M96 N*R^4 + onsetG1_5_1M96 N*R^5) + (onsetG1_6_1M96 N*R^6 + onsetG1_7_1M96 N*R^7))) := by
  unfold onsetColumnGap1_1M96 onsetColumn1_0M96 onsetColumn1_1M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetG1_0_1M96 onsetG1_1_1M96 onsetG1_2_1M96 onsetG1_3_1M96 onsetG1_4_1M96 onsetG1_5_1M96 onsetG1_6_1M96 onsetG1_7_1M96
  ring
 rw [he]
 have hp0 := onsetG1_0_1M96_nonneg N hN
 have hp1 := onsetG1_1_1M96_nonneg N hN
 have hp2 := onsetG1_2_1M96_nonneg N hN
 have hp3 := onsetG1_3_1M96_nonneg N hN
 have hp4 := onsetG1_4_1M96_nonneg N hN
 have hp5 := onsetG1_5_1M96_nonneg N hN
 have hp6 := onsetG1_6_1M96_nonneg N hN
 have hp7 := onsetG1_7_1M96_nonneg N hN
 positivity

def onsetColumnGap1_2M96 (N R : ℤ) : ℤ := ((onsetColumn2_0M96 N R*onsetColumn2_2M96 N R-onsetColumn1_0M96 N R*onsetColumn3_2M96 N R) + ((onsetColumn2_1M96 N R*onsetColumn2_1M96 N R-onsetColumn1_1M96 N R*onsetColumn3_1M96 N R) + (onsetColumn2_2M96 N R*onsetColumn2_0M96 N R-onsetColumn1_2M96 N R*onsetColumn3_0M96 N R)))

theorem onsetColumnGap1_2M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_2M96 N R := by
 have he : onsetColumnGap1_2M96 N R=((onsetG1_0_2M96 N*R^0 + (onsetG1_1_2M96 N*R^1 + onsetG1_2_2M96 N*R^2)) + ((onsetG1_3_2M96 N*R^3 + onsetG1_4_2M96 N*R^4) + (onsetG1_5_2M96 N*R^5 + onsetG1_6_2M96 N*R^6))) := by
  unfold onsetColumnGap1_2M96 onsetColumn1_0M96 onsetColumn1_1M96 onsetColumn1_2M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetG1_0_2M96 onsetG1_1_2M96 onsetG1_2_2M96 onsetG1_3_2M96 onsetG1_4_2M96 onsetG1_5_2M96 onsetG1_6_2M96
  ring
 rw [he]
 have hp0 := onsetG1_0_2M96_nonneg N hN
 have hp1 := onsetG1_1_2M96_nonneg N hN
 have hp2 := onsetG1_2_2M96_nonneg N hN
 have hp3 := onsetG1_3_2M96_nonneg N hN
 have hp4 := onsetG1_4_2M96_nonneg N hN
 have hp5 := onsetG1_5_2M96_nonneg N hN
 have hp6 := onsetG1_6_2M96_nonneg N hN
 positivity
end
end MathGKM.Markov
