import MarkovOnsetColumnsM96
import MarkovOnsetGap10M96
import MarkovOnsetGap11M96
import MarkovOnsetGap12M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap1_6M96 (N R : ℤ) : ℤ := ((onsetColumn2_2M96 N R*onsetColumn2_4M96 N R-onsetColumn1_2M96 N R*onsetColumn3_4M96 N R) + ((onsetColumn2_3M96 N R*onsetColumn2_3M96 N R-onsetColumn1_3M96 N R*onsetColumn3_3M96 N R) + (onsetColumn2_4M96 N R*onsetColumn2_2M96 N R-onsetColumn1_4M96 N R*onsetColumn3_2M96 N R)))

theorem onsetColumnGap1_6M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_6M96 N R := by
 have he : onsetColumnGap1_6M96 N R=(onsetG1_0_6M96 N*R^0 + (onsetG1_1_6M96 N*R^1 + onsetG1_2_6M96 N*R^2)) := by
  unfold onsetColumnGap1_6M96 onsetColumn1_2M96 onsetColumn1_3M96 onsetColumn1_4M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetG1_0_6M96 onsetG1_1_6M96 onsetG1_2_6M96
  ring
 rw [he]
 have hp0 := onsetG1_0_6M96_nonneg N hN
 have hp1 := onsetG1_1_6M96_nonneg N hN
 have hp2 := onsetG1_2_6M96_nonneg N hN
 positivity

def onsetColumnGap1_7M96 (N R : ℤ) : ℤ := ((onsetColumn2_3M96 N R*onsetColumn2_4M96 N R-onsetColumn1_3M96 N R*onsetColumn3_4M96 N R) + (onsetColumn2_4M96 N R*onsetColumn2_3M96 N R-onsetColumn1_4M96 N R*onsetColumn3_3M96 N R))

theorem onsetColumnGap1_7M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_7M96 N R := by
 have he : onsetColumnGap1_7M96 N R=(onsetG1_0_7M96 N*R^0 + onsetG1_1_7M96 N*R^1) := by
  unfold onsetColumnGap1_7M96 onsetColumn1_3M96 onsetColumn1_4M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetG1_0_7M96 onsetG1_1_7M96
  ring
 rw [he]
 have hp0 := onsetG1_0_7M96_nonneg N hN
 have hp1 := onsetG1_1_7M96_nonneg N hN
 positivity

def onsetColumnGap1_8M96 (N R : ℤ) : ℤ := (onsetColumn2_4M96 N R*onsetColumn2_4M96 N R-onsetColumn1_4M96 N R*onsetColumn3_4M96 N R)

theorem onsetColumnGap1_8M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_8M96 N R := by
 have he : onsetColumnGap1_8M96 N R=onsetG1_0_8M96 N*R^0 := by
  unfold onsetColumnGap1_8M96 onsetColumn1_4M96 onsetColumn2_4M96 onsetColumn3_4M96 onsetG1_0_8M96
  ring
 rw [he]
 have hp0 := onsetG1_0_8M96_nonneg N hN
 positivity
end
end MathGKM.Markov
