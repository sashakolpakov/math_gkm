import MarkovOnsetColumnsM96
import MarkovOnsetGap10M96
import MarkovOnsetGap11M96
import MarkovOnsetGap12M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap1_3M96 (N R : ℤ) : ℤ := (((onsetColumn2_0M96 N R*onsetColumn2_3M96 N R-onsetColumn1_0M96 N R*onsetColumn3_3M96 N R) + (onsetColumn2_1M96 N R*onsetColumn2_2M96 N R-onsetColumn1_1M96 N R*onsetColumn3_2M96 N R)) + ((onsetColumn2_2M96 N R*onsetColumn2_1M96 N R-onsetColumn1_2M96 N R*onsetColumn3_1M96 N R) + (onsetColumn2_3M96 N R*onsetColumn2_0M96 N R-onsetColumn1_3M96 N R*onsetColumn3_0M96 N R)))

theorem onsetColumnGap1_3M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_3M96 N R := by
 have he : onsetColumnGap1_3M96 N R=((onsetG1_0_3M96 N*R^0 + (onsetG1_1_3M96 N*R^1 + onsetG1_2_3M96 N*R^2)) + (onsetG1_3_3M96 N*R^3 + (onsetG1_4_3M96 N*R^4 + onsetG1_5_3M96 N*R^5))) := by
  unfold onsetColumnGap1_3M96 onsetColumn1_0M96 onsetColumn1_1M96 onsetColumn1_2M96 onsetColumn1_3M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetG1_0_3M96 onsetG1_1_3M96 onsetG1_2_3M96 onsetG1_3_3M96 onsetG1_4_3M96 onsetG1_5_3M96
  ring
 rw [he]
 have hp0 := onsetG1_0_3M96_nonneg N hN
 have hp1 := onsetG1_1_3M96_nonneg N hN
 have hp2 := onsetG1_2_3M96_nonneg N hN
 have hp3 := onsetG1_3_3M96_nonneg N hN
 have hp4 := onsetG1_4_3M96_nonneg N hN
 have hp5 := onsetG1_5_3M96_nonneg N hN
 positivity

def onsetColumnGap1_4M96 (N R : ℤ) : ℤ := (((onsetColumn2_0M96 N R*onsetColumn2_4M96 N R-onsetColumn1_0M96 N R*onsetColumn3_4M96 N R) + (onsetColumn2_1M96 N R*onsetColumn2_3M96 N R-onsetColumn1_1M96 N R*onsetColumn3_3M96 N R)) + ((onsetColumn2_2M96 N R*onsetColumn2_2M96 N R-onsetColumn1_2M96 N R*onsetColumn3_2M96 N R) + ((onsetColumn2_3M96 N R*onsetColumn2_1M96 N R-onsetColumn1_3M96 N R*onsetColumn3_1M96 N R) + (onsetColumn2_4M96 N R*onsetColumn2_0M96 N R-onsetColumn1_4M96 N R*onsetColumn3_0M96 N R))))

theorem onsetColumnGap1_4M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_4M96 N R := by
 have he : onsetColumnGap1_4M96 N R=((onsetG1_0_4M96 N*R^0 + onsetG1_1_4M96 N*R^1) + (onsetG1_2_4M96 N*R^2 + (onsetG1_3_4M96 N*R^3 + onsetG1_4_4M96 N*R^4))) := by
  unfold onsetColumnGap1_4M96 onsetColumn1_0M96 onsetColumn1_1M96 onsetColumn1_2M96 onsetColumn1_3M96 onsetColumn1_4M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetG1_0_4M96 onsetG1_1_4M96 onsetG1_2_4M96 onsetG1_3_4M96 onsetG1_4_4M96
  ring
 rw [he]
 have hp0 := onsetG1_0_4M96_nonneg N hN
 have hp1 := onsetG1_1_4M96_nonneg N hN
 have hp2 := onsetG1_2_4M96_nonneg N hN
 have hp3 := onsetG1_3_4M96_nonneg N hN
 have hp4 := onsetG1_4_4M96_nonneg N hN
 positivity

def onsetColumnGap1_5M96 (N R : ℤ) : ℤ := (((onsetColumn2_1M96 N R*onsetColumn2_4M96 N R-onsetColumn1_1M96 N R*onsetColumn3_4M96 N R) + (onsetColumn2_2M96 N R*onsetColumn2_3M96 N R-onsetColumn1_2M96 N R*onsetColumn3_3M96 N R)) + ((onsetColumn2_3M96 N R*onsetColumn2_2M96 N R-onsetColumn1_3M96 N R*onsetColumn3_2M96 N R) + (onsetColumn2_4M96 N R*onsetColumn2_1M96 N R-onsetColumn1_4M96 N R*onsetColumn3_1M96 N R)))

theorem onsetColumnGap1_5M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap1_5M96 N R := by
 have he : onsetColumnGap1_5M96 N R=((onsetG1_0_5M96 N*R^0 + onsetG1_1_5M96 N*R^1) + (onsetG1_2_5M96 N*R^2 + onsetG1_3_5M96 N*R^3)) := by
  unfold onsetColumnGap1_5M96 onsetColumn1_1M96 onsetColumn1_2M96 onsetColumn1_3M96 onsetColumn1_4M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetG1_0_5M96 onsetG1_1_5M96 onsetG1_2_5M96 onsetG1_3_5M96
  ring
 rw [he]
 have hp0 := onsetG1_0_5M96_nonneg N hN
 have hp1 := onsetG1_1_5M96_nonneg N hN
 have hp2 := onsetG1_2_5M96_nonneg N hN
 have hp3 := onsetG1_3_5M96_nonneg N hN
 positivity
end
end MathGKM.Markov
