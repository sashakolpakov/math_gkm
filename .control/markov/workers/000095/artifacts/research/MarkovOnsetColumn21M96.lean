import MarkovOnsetColumnsM96
import MarkovOnsetGap20M96
import MarkovOnsetGap21M96
import MarkovOnsetGap22M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap2_3M96 (N R : ℤ) : ℤ := (((onsetColumn3_0M96 N R*onsetColumn3_3M96 N R-onsetColumn2_0M96 N R*onsetColumn4_3M96 N R) + (onsetColumn3_1M96 N R*onsetColumn3_2M96 N R-onsetColumn2_1M96 N R*onsetColumn4_2M96 N R)) + ((onsetColumn3_2M96 N R*onsetColumn3_1M96 N R-onsetColumn2_2M96 N R*onsetColumn4_1M96 N R) + (onsetColumn3_3M96 N R*onsetColumn3_0M96 N R-onsetColumn2_3M96 N R*onsetColumn4_0M96 N R)))

theorem onsetColumnGap2_3M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_3M96 N R := by
 have he : onsetColumnGap2_3M96 N R=((onsetG2_0_3M96 N*R^0 + (onsetG2_1_3M96 N*R^1 + onsetG2_2_3M96 N*R^2)) + (onsetG2_3_3M96 N*R^3 + (onsetG2_4_3M96 N*R^4 + onsetG2_5_3M96 N*R^5))) := by
  unfold onsetColumnGap2_3M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetG2_0_3M96 onsetG2_1_3M96 onsetG2_2_3M96 onsetG2_3_3M96 onsetG2_4_3M96 onsetG2_5_3M96
  ring
 rw [he]
 have hp0 := onsetG2_0_3M96_nonneg N hN
 have hp1 := onsetG2_1_3M96_nonneg N hN
 have hp2 := onsetG2_2_3M96_nonneg N hN
 have hp3 := onsetG2_3_3M96_nonneg N hN
 have hp4 := onsetG2_4_3M96_nonneg N hN
 have hp5 := onsetG2_5_3M96_nonneg N hN
 positivity

def onsetColumnGap2_4M96 (N R : ℤ) : ℤ := (((onsetColumn3_0M96 N R*onsetColumn3_4M96 N R-onsetColumn2_0M96 N R*onsetColumn4_4M96 N R) + (onsetColumn3_1M96 N R*onsetColumn3_3M96 N R-onsetColumn2_1M96 N R*onsetColumn4_3M96 N R)) + ((onsetColumn3_2M96 N R*onsetColumn3_2M96 N R-onsetColumn2_2M96 N R*onsetColumn4_2M96 N R) + ((onsetColumn3_3M96 N R*onsetColumn3_1M96 N R-onsetColumn2_3M96 N R*onsetColumn4_1M96 N R) + (onsetColumn3_4M96 N R*onsetColumn3_0M96 N R-onsetColumn2_4M96 N R*onsetColumn4_0M96 N R))))

theorem onsetColumnGap2_4M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_4M96 N R := by
 have he : onsetColumnGap2_4M96 N R=((onsetG2_0_4M96 N*R^0 + onsetG2_1_4M96 N*R^1) + (onsetG2_2_4M96 N*R^2 + (onsetG2_3_4M96 N*R^3 + onsetG2_4_4M96 N*R^4))) := by
  unfold onsetColumnGap2_4M96 onsetColumn2_0M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetG2_0_4M96 onsetG2_1_4M96 onsetG2_2_4M96 onsetG2_3_4M96 onsetG2_4_4M96
  ring
 rw [he]
 have hp0 := onsetG2_0_4M96_nonneg N hN
 have hp1 := onsetG2_1_4M96_nonneg N hN
 have hp2 := onsetG2_2_4M96_nonneg N hN
 have hp3 := onsetG2_3_4M96_nonneg N hN
 have hp4 := onsetG2_4_4M96_nonneg N hN
 positivity

def onsetColumnGap2_5M96 (N R : ℤ) : ℤ := (((onsetColumn3_1M96 N R*onsetColumn3_4M96 N R-onsetColumn2_1M96 N R*onsetColumn4_4M96 N R) + (onsetColumn3_2M96 N R*onsetColumn3_3M96 N R-onsetColumn2_2M96 N R*onsetColumn4_3M96 N R)) + ((onsetColumn3_3M96 N R*onsetColumn3_2M96 N R-onsetColumn2_3M96 N R*onsetColumn4_2M96 N R) + (onsetColumn3_4M96 N R*onsetColumn3_1M96 N R-onsetColumn2_4M96 N R*onsetColumn4_1M96 N R)))

theorem onsetColumnGap2_5M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap2_5M96 N R := by
 have he : onsetColumnGap2_5M96 N R=((onsetG2_0_5M96 N*R^0 + onsetG2_1_5M96 N*R^1) + (onsetG2_2_5M96 N*R^2 + onsetG2_3_5M96 N*R^3)) := by
  unfold onsetColumnGap2_5M96 onsetColumn2_1M96 onsetColumn2_2M96 onsetColumn2_3M96 onsetColumn2_4M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetG2_0_5M96 onsetG2_1_5M96 onsetG2_2_5M96 onsetG2_3_5M96
  ring
 rw [he]
 have hp0 := onsetG2_0_5M96_nonneg N hN
 have hp1 := onsetG2_1_5M96_nonneg N hN
 have hp2 := onsetG2_2_5M96_nonneg N hN
 have hp3 := onsetG2_3_5M96_nonneg N hN
 positivity
end
end MathGKM.Markov
