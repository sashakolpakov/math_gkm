import MarkovOnsetColumnsM96
import MarkovOnsetGap30M96
import MarkovOnsetGap31M96
import MarkovOnsetGap32M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap3_0M96 (N R : ℤ) : ℤ := (onsetColumn4_0M96 N R*onsetColumn4_0M96 N R-onsetColumn3_0M96 N R*onsetColumn5_0M96 N R)

theorem onsetColumnGap3_0M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_0M96 N R := by
 have he : onsetColumnGap3_0M96 N R=(((onsetG3_0_0M96 N*R^0 + onsetG3_1_0M96 N*R^1) + (onsetG3_2_0M96 N*R^2 + onsetG3_3_0M96 N*R^3)) + ((onsetG3_4_0M96 N*R^4 + onsetG3_5_0M96 N*R^5) + (onsetG3_6_0M96 N*R^6 + (onsetG3_7_0M96 N*R^7 + onsetG3_8_0M96 N*R^8)))) := by
  unfold onsetColumnGap3_0M96 onsetColumn3_0M96 onsetColumn4_0M96 onsetColumn5_0M96 onsetG3_0_0M96 onsetG3_1_0M96 onsetG3_2_0M96 onsetG3_3_0M96 onsetG3_4_0M96 onsetG3_5_0M96 onsetG3_6_0M96 onsetG3_7_0M96 onsetG3_8_0M96
  ring
 rw [he]
 have hp0 := onsetG3_0_0M96_nonneg N hN
 have hp1 := onsetG3_1_0M96_nonneg N hN
 have hp2 := onsetG3_2_0M96_nonneg N hN
 have hp3 := onsetG3_3_0M96_nonneg N hN
 have hp4 := onsetG3_4_0M96_nonneg N hN
 have hp5 := onsetG3_5_0M96_nonneg N hN
 have hp6 := onsetG3_6_0M96_nonneg N hN
 have hp7 := onsetG3_7_0M96_nonneg N hN
 have hp8 := onsetG3_8_0M96_nonneg N hN
 positivity

def onsetColumnGap3_1M96 (N R : ℤ) : ℤ := ((onsetColumn4_0M96 N R*onsetColumn4_1M96 N R-onsetColumn3_0M96 N R*onsetColumn5_1M96 N R) + (onsetColumn4_1M96 N R*onsetColumn4_0M96 N R-onsetColumn3_1M96 N R*onsetColumn5_0M96 N R))

theorem onsetColumnGap3_1M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_1M96 N R := by
 have he : onsetColumnGap3_1M96 N R=(((onsetG3_0_1M96 N*R^0 + onsetG3_1_1M96 N*R^1) + (onsetG3_2_1M96 N*R^2 + onsetG3_3_1M96 N*R^3)) + ((onsetG3_4_1M96 N*R^4 + onsetG3_5_1M96 N*R^5) + (onsetG3_6_1M96 N*R^6 + onsetG3_7_1M96 N*R^7))) := by
  unfold onsetColumnGap3_1M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetG3_0_1M96 onsetG3_1_1M96 onsetG3_2_1M96 onsetG3_3_1M96 onsetG3_4_1M96 onsetG3_5_1M96 onsetG3_6_1M96 onsetG3_7_1M96
  ring
 rw [he]
 have hp0 := onsetG3_0_1M96_nonneg N hN
 have hp1 := onsetG3_1_1M96_nonneg N hN
 have hp2 := onsetG3_2_1M96_nonneg N hN
 have hp3 := onsetG3_3_1M96_nonneg N hN
 have hp4 := onsetG3_4_1M96_nonneg N hN
 have hp5 := onsetG3_5_1M96_nonneg N hN
 have hp6 := onsetG3_6_1M96_nonneg N hN
 have hp7 := onsetG3_7_1M96_nonneg N hN
 positivity

def onsetColumnGap3_2M96 (N R : ℤ) : ℤ := ((onsetColumn4_0M96 N R*onsetColumn4_2M96 N R-onsetColumn3_0M96 N R*onsetColumn5_2M96 N R) + ((onsetColumn4_1M96 N R*onsetColumn4_1M96 N R-onsetColumn3_1M96 N R*onsetColumn5_1M96 N R) + (onsetColumn4_2M96 N R*onsetColumn4_0M96 N R-onsetColumn3_2M96 N R*onsetColumn5_0M96 N R)))

theorem onsetColumnGap3_2M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_2M96 N R := by
 have he : onsetColumnGap3_2M96 N R=((onsetG3_0_2M96 N*R^0 + (onsetG3_1_2M96 N*R^1 + onsetG3_2_2M96 N*R^2)) + ((onsetG3_3_2M96 N*R^3 + onsetG3_4_2M96 N*R^4) + (onsetG3_5_2M96 N*R^5 + onsetG3_6_2M96 N*R^6))) := by
  unfold onsetColumnGap3_2M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetG3_0_2M96 onsetG3_1_2M96 onsetG3_2_2M96 onsetG3_3_2M96 onsetG3_4_2M96 onsetG3_5_2M96 onsetG3_6_2M96
  ring
 rw [he]
 have hp0 := onsetG3_0_2M96_nonneg N hN
 have hp1 := onsetG3_1_2M96_nonneg N hN
 have hp2 := onsetG3_2_2M96_nonneg N hN
 have hp3 := onsetG3_3_2M96_nonneg N hN
 have hp4 := onsetG3_4_2M96_nonneg N hN
 have hp5 := onsetG3_5_2M96_nonneg N hN
 have hp6 := onsetG3_6_2M96_nonneg N hN
 positivity
end
end MathGKM.Markov
