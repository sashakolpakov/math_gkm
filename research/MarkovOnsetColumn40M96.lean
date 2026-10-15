import MarkovOnsetColumnsM96
import MarkovOnsetGap40M96
import MarkovOnsetGap41M96
import MarkovOnsetGap42M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap4_0M96 (N R : ℤ) : ℤ := (onsetColumn5_0M96 N R*onsetColumn5_0M96 N R-onsetColumn4_0M96 N R*onsetColumn6_0M96 N R)

theorem onsetColumnGap4_0M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_0M96 N R := by
 have he : onsetColumnGap4_0M96 N R=(((onsetG4_0_0M96 N*R^0 + onsetG4_1_0M96 N*R^1) + (onsetG4_2_0M96 N*R^2 + onsetG4_3_0M96 N*R^3)) + ((onsetG4_4_0M96 N*R^4 + onsetG4_5_0M96 N*R^5) + (onsetG4_6_0M96 N*R^6 + (onsetG4_7_0M96 N*R^7 + onsetG4_8_0M96 N*R^8)))) := by
  unfold onsetColumnGap4_0M96 onsetColumn4_0M96 onsetColumn5_0M96 onsetColumn6_0M96 onsetG4_0_0M96 onsetG4_1_0M96 onsetG4_2_0M96 onsetG4_3_0M96 onsetG4_4_0M96 onsetG4_5_0M96 onsetG4_6_0M96 onsetG4_7_0M96 onsetG4_8_0M96
  ring
 rw [he]
 have hp0 := onsetG4_0_0M96_nonneg N hN
 have hp1 := onsetG4_1_0M96_nonneg N hN
 have hp2 := onsetG4_2_0M96_nonneg N hN
 have hp3 := onsetG4_3_0M96_nonneg N hN
 have hp4 := onsetG4_4_0M96_nonneg N hN
 have hp5 := onsetG4_5_0M96_nonneg N hN
 have hp6 := onsetG4_6_0M96_nonneg N hN
 have hp7 := onsetG4_7_0M96_nonneg N hN
 have hp8 := onsetG4_8_0M96_nonneg N hN
 positivity

def onsetColumnGap4_1M96 (N R : ℤ) : ℤ := ((onsetColumn5_0M96 N R*onsetColumn5_1M96 N R-onsetColumn4_0M96 N R*onsetColumn6_1M96 N R) + (onsetColumn5_1M96 N R*onsetColumn5_0M96 N R-onsetColumn4_1M96 N R*onsetColumn6_0M96 N R))

theorem onsetColumnGap4_1M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_1M96 N R := by
 have he : onsetColumnGap4_1M96 N R=(((onsetG4_0_1M96 N*R^0 + onsetG4_1_1M96 N*R^1) + (onsetG4_2_1M96 N*R^2 + onsetG4_3_1M96 N*R^3)) + ((onsetG4_4_1M96 N*R^4 + onsetG4_5_1M96 N*R^5) + (onsetG4_6_1M96 N*R^6 + onsetG4_7_1M96 N*R^7))) := by
  unfold onsetColumnGap4_1M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn6_0M96 onsetColumn6_1M96 onsetG4_0_1M96 onsetG4_1_1M96 onsetG4_2_1M96 onsetG4_3_1M96 onsetG4_4_1M96 onsetG4_5_1M96 onsetG4_6_1M96 onsetG4_7_1M96
  ring
 rw [he]
 have hp0 := onsetG4_0_1M96_nonneg N hN
 have hp1 := onsetG4_1_1M96_nonneg N hN
 have hp2 := onsetG4_2_1M96_nonneg N hN
 have hp3 := onsetG4_3_1M96_nonneg N hN
 have hp4 := onsetG4_4_1M96_nonneg N hN
 have hp5 := onsetG4_5_1M96_nonneg N hN
 have hp6 := onsetG4_6_1M96_nonneg N hN
 have hp7 := onsetG4_7_1M96_nonneg N hN
 positivity

def onsetColumnGap4_2M96 (N R : ℤ) : ℤ := ((onsetColumn5_0M96 N R*onsetColumn5_2M96 N R-onsetColumn4_0M96 N R*onsetColumn6_2M96 N R) + ((onsetColumn5_1M96 N R*onsetColumn5_1M96 N R-onsetColumn4_1M96 N R*onsetColumn6_1M96 N R) + (onsetColumn5_2M96 N R*onsetColumn5_0M96 N R-onsetColumn4_2M96 N R*onsetColumn6_0M96 N R)))

theorem onsetColumnGap4_2M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_2M96 N R := by
 have he : onsetColumnGap4_2M96 N R=((onsetG4_0_2M96 N*R^0 + (onsetG4_1_2M96 N*R^1 + onsetG4_2_2M96 N*R^2)) + ((onsetG4_3_2M96 N*R^3 + onsetG4_4_2M96 N*R^4) + (onsetG4_5_2M96 N*R^5 + onsetG4_6_2M96 N*R^6))) := by
  unfold onsetColumnGap4_2M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn6_0M96 onsetColumn6_1M96 onsetColumn6_2M96 onsetG4_0_2M96 onsetG4_1_2M96 onsetG4_2_2M96 onsetG4_3_2M96 onsetG4_4_2M96 onsetG4_5_2M96 onsetG4_6_2M96
  ring
 rw [he]
 have hp0 := onsetG4_0_2M96_nonneg N hN
 have hp1 := onsetG4_1_2M96_nonneg N hN
 have hp2 := onsetG4_2_2M96_nonneg N hN
 have hp3 := onsetG4_3_2M96_nonneg N hN
 have hp4 := onsetG4_4_2M96_nonneg N hN
 have hp5 := onsetG4_5_2M96_nonneg N hN
 have hp6 := onsetG4_6_2M96_nonneg N hN
 positivity
end
end MathGKM.Markov
