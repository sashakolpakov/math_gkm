import MarkovOnsetColumnsM96
import MarkovOnsetGap20M96
import MarkovOnsetGap21M96
import MarkovOnsetGap22M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap2_6M96 (N R : ℤ) : ℤ := ((onsetColumn3_2M96 N R*onsetColumn3_4M96 N R-onsetColumn2_2M96 N R*onsetColumn4_4M96 N R) + ((onsetColumn3_3M96 N R*onsetColumn3_3M96 N R-onsetColumn2_3M96 N R*onsetColumn4_3M96 N R) + (onsetColumn3_4M96 N R*onsetColumn3_2M96 N R-onsetColumn2_4M96 N R*onsetColumn4_2M96 N R)))

theorem onsetColumnGap2_6M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_6M96 N R := by
 have he : onsetColumnGap2_6M96 N R=(onsetG2_0_6M96 N*R^0 + (onsetG2_1_6M96 N*R^1 + onsetG2_2_6M96 N*R^2)) := by
  unfold onsetColumnGap2_6M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetG2_0_6M96 onsetG2_1_6M96 onsetG2_2_6M96
  ring
 rw [he]
 have hp0 := onsetG2_0_6M96_nonneg N hN
 have hp1 := onsetG2_1_6M96_nonneg N hN
 have hp2 := onsetG2_2_6M96_nonneg N hN
 positivity

def onsetColumnGap2_7M96 (N R : ℤ) : ℤ := ((onsetColumn3_3M96 N R*onsetColumn3_4M96 N R-onsetColumn2_3M96 N R*onsetColumn4_4M96 N R) + (onsetColumn3_4M96 N R*onsetColumn3_3M96 N R-onsetColumn2_4M96 N R*onsetColumn4_3M96 N R))

theorem onsetColumnGap2_7M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_7M96 N R := by
 have he : onsetColumnGap2_7M96 N R=(onsetG2_0_7M96 N*R^0 + onsetG2_1_7M96 N*R^1) := by
  unfold onsetColumnGap2_7M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetG2_0_7M96 onsetG2_1_7M96
  ring
 rw [he]
 have hp0 := onsetG2_0_7M96_nonneg N hN
 have hp1 := onsetG2_1_7M96_nonneg N hN
 positivity

def onsetColumnGap2_8M96 (N R : ℤ) : ℤ := (onsetColumn3_4M96 N R*onsetColumn3_4M96 N R-onsetColumn2_4M96 N R*onsetColumn4_4M96 N R)

theorem onsetColumnGap2_8M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_8M96 N R := by
 have he : onsetColumnGap2_8M96 N R=onsetG2_0_8M96 N*R^0 := by
  unfold onsetColumnGap2_8M96 onsetColumn2_4M96 onsetColumn3_4M96 onsetColumn4_4M96 onsetG2_0_8M96
  ring
 rw [he]
 have hp0 := onsetG2_0_8M96_nonneg N hN
 positivity
end
end MathGKM.Markov
