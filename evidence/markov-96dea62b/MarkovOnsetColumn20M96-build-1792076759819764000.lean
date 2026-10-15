import MarkovOnsetColumnsM96
import MarkovOnsetGap20M96
import MarkovOnsetGap21M96
import MarkovOnsetGap22M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap2_0M96 (N R : ℤ) : ℤ := (onsetColumn3_0M96 N R*onsetColumn3_0M96 N R-onsetColumn2_0M96 N R*onsetColumn4_0M96 N R)

theorem onsetColumnGap2_0M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_0M96 N R := by
 have he : onsetColumnGap2_0M96 N R=(((onsetG2_0_0M96 N*R^0 + onsetG2_1_0M96 N*R^1) + (onsetG2_2_0M96 N*R^2 + onsetG2_3_0M96 N*R^3)) + ((onsetG2_4_0M96 N*R^4 + onsetG2_5_0M96 N*R^5) + (onsetG2_6_0M96 N*R^6 + (onsetG2_7_0M96 N*R^7 + onsetG2_8_0M96 N*R^8)))) := by
  unfold onsetColumnGap2_0M96 onsetColumn2_0M96 onsetColumn3_0M96 onsetColumn4_0M96 onsetG2_0_0M96 onsetG2_1_0M96 onsetG2_2_0M96 onsetG2_3_0M96 onsetG2_4_0M96 onsetG2_5_0M96 onsetG2_6_0M96 onsetG2_7_0M96 onsetG2_8_0M96
  ring
 rw [he]
 have hp0 := onsetG2_0_0M96_nonneg N hN
 have hp1 := onsetG2_1_0M96_nonneg N hN
 have hp2 := onsetG2_2_0M96_nonneg N hN
 have hp3 := onsetG2_3_0M96_nonneg N hN
 have hp4 := onsetG2_4_0M96_nonneg N hN
 have hp5 := onsetG2_5_0M96_nonneg N hN
 have hp6 := onsetG2_6_0M96_nonneg N hN
 have hp7 := onsetG2_7_0M96_nonneg N hN
 have hp8 := onsetG2_8_0M96_nonneg N hN
 positivity

def onsetColumnGap2_1M96 (N R : ℤ) : ℤ := ((onsetColumn3_0M96 N R*onsetColumn3_1M96 N R-onsetColumn2_0M96 N R*onsetColumn4_1M96 N R) + (onsetColumn3_1M96 N R*onsetColumn3_0M96 N R-onsetColumn2_1M96 N R*onsetColumn4_0M96 N R))

theorem onsetColumnGap2_1M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_1M96 N R := by
 have he : onsetColumnGap2_1M96 N R=(((onsetG2_0_1M96 N*R^0 + onsetG2_1_1M96 N*R^1) + (onsetG2_2_1M96 N*R^2 + onsetG2_3_1M96 N*R^3)) + ((onsetG2_4_1M96 N*R^4 + onsetG2_5_1M96 N*R^5) + (onsetG2_6_1M96 N*R^6 + onsetG2_7_1M96 N*R^7))) := by
  unfold onsetColumnGap2_1M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetG2_0_1M96 onsetG2_1_1M96 onsetG2_2_1M96 onsetG2_3_1M96 onsetG2_4_1M96 onsetG2_5_1M96 onsetG2_6_1M96 onsetG2_7_1M96
  ring
 rw [he]
 have hp0 := onsetG2_0_1M96_nonneg N hN
 have hp1 := onsetG2_1_1M96_nonneg N hN
 have hp2 := onsetG2_2_1M96_nonneg N hN
 have hp3 := onsetG2_3_1M96_nonneg N hN
 have hp4 := onsetG2_4_1M96_nonneg N hN
 have hp5 := onsetG2_5_1M96_nonneg N hN
 have hp6 := onsetG2_6_1M96_nonneg N hN
 have hp7 := onsetG2_7_1M96_nonneg N hN
 positivity

def onsetColumnGap2_2M96 (N R : ℤ) : ℤ := ((onsetColumn3_0M96 N R*onsetColumn3_2M96 N R-onsetColumn2_0M96 N R*onsetColumn4_2M96 N R) + ((onsetColumn3_1M96 N R*onsetColumn3_1M96 N R-onsetColumn2_1M96 N R*onsetColumn4_1M96 N R) + (onsetColumn3_2M96 N R*onsetColumn3_0M96 N R-onsetColumn2_2M96 N R*onsetColumn4_0M96 N R)))

theorem onsetColumnGap2_2M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_2M96 N R := by
 have he : onsetColumnGap2_2M96 N R=((onsetG2_0_2M96 N*R^0 + (onsetG2_1_2M96 N*R^1 + onsetG2_2_2M96 N*R^2)) + ((onsetG2_3_2M96 N*R^3 + onsetG2_4_2M96 N*R^4) + (onsetG2_5_2M96 N*R^5 + onsetG2_6_2M96 N*R^6))) := by
  unfold onsetColumnGap2_2M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetG2_0_2M96 onsetG2_1_2M96 onsetG2_2_2M96 onsetG2_3_2M96 onsetG2_4_2M96 onsetG2_5_2M96 onsetG2_6_2M96
  ring
 rw [he]
 have hp0 := onsetG2_0_2M96_nonneg N hN
 have hp1 := onsetG2_1_2M96_nonneg N hN
 have hp2 := onsetG2_2_2M96_nonneg N hN
 have hp3 := onsetG2_3_2M96_nonneg N hN
 have hp4 := onsetG2_4_2M96_nonneg N hN
 have hp5 := onsetG2_5_2M96_nonneg N hN
 have hp6 := onsetG2_6_2M96_nonneg N hN
 positivity
end
end MathGKM.Markov
