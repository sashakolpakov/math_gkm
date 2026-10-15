import MarkovOnsetColumnsM96
import MarkovOnsetGap30M96
import MarkovOnsetGap31M96
import MarkovOnsetGap32M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap3_6M96 (N R : ℤ) : ℤ := ((onsetColumn4_2M96 N R*onsetColumn4_4M96 N R-onsetColumn3_2M96 N R*onsetColumn5_4M96 N R) + ((onsetColumn4_3M96 N R*onsetColumn4_3M96 N R-onsetColumn3_3M96 N R*onsetColumn5_3M96 N R) + (onsetColumn4_4M96 N R*onsetColumn4_2M96 N R-onsetColumn3_4M96 N R*onsetColumn5_2M96 N R)))

theorem onsetColumnGap3_6M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_6M96 N R := by
 have he : onsetColumnGap3_6M96 N R=(onsetG3_0_6M96 N*R^0 + (onsetG3_1_6M96 N*R^1 + onsetG3_2_6M96 N*R^2)) := by
  unfold onsetColumnGap3_6M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetG3_0_6M96 onsetG3_1_6M96 onsetG3_2_6M96
  ring
 rw [he]
 have hp0 := onsetG3_0_6M96_nonneg N hN
 have hp1 := onsetG3_1_6M96_nonneg N hN
 have hp2 := onsetG3_2_6M96_nonneg N hN
 positivity

def onsetColumnGap3_7M96 (N R : ℤ) : ℤ := ((onsetColumn4_3M96 N R*onsetColumn4_4M96 N R-onsetColumn3_3M96 N R*onsetColumn5_4M96 N R) + (onsetColumn4_4M96 N R*onsetColumn4_3M96 N R-onsetColumn3_4M96 N R*onsetColumn5_3M96 N R))

theorem onsetColumnGap3_7M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_7M96 N R := by
 have he : onsetColumnGap3_7M96 N R=(onsetG3_0_7M96 N*R^0 + onsetG3_1_7M96 N*R^1) := by
  unfold onsetColumnGap3_7M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetG3_0_7M96 onsetG3_1_7M96
  ring
 rw [he]
 have hp0 := onsetG3_0_7M96_nonneg N hN
 have hp1 := onsetG3_1_7M96_nonneg N hN
 positivity

def onsetColumnGap3_8M96 (N R : ℤ) : ℤ := (onsetColumn4_4M96 N R*onsetColumn4_4M96 N R-onsetColumn3_4M96 N R*onsetColumn5_4M96 N R)

theorem onsetColumnGap3_8M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_8M96 N R := by
 have he : onsetColumnGap3_8M96 N R=onsetG3_0_8M96 N*R^0 := by
  unfold onsetColumnGap3_8M96 onsetColumn3_4M96 onsetColumn4_4M96 onsetColumn5_4M96 onsetG3_0_8M96
  ring
 rw [he]
 have hp0 := onsetG3_0_8M96_nonneg N hN
 positivity
end
end MathGKM.Markov
