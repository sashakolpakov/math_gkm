import MarkovOnsetColumnsM96
import MarkovOnsetGap30M96
import MarkovOnsetGap31M96
import MarkovOnsetGap32M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap3_3M96 (N R : ℤ) : ℤ := (((onsetColumn4_0M96 N R*onsetColumn4_3M96 N R-onsetColumn3_0M96 N R*onsetColumn5_3M96 N R) + (onsetColumn4_1M96 N R*onsetColumn4_2M96 N R-onsetColumn3_1M96 N R*onsetColumn5_2M96 N R)) + ((onsetColumn4_2M96 N R*onsetColumn4_1M96 N R-onsetColumn3_2M96 N R*onsetColumn5_1M96 N R) + (onsetColumn4_3M96 N R*onsetColumn4_0M96 N R-onsetColumn3_3M96 N R*onsetColumn5_0M96 N R)))

theorem onsetColumnGap3_3M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_3M96 N R := by
 have he : onsetColumnGap3_3M96 N R=((onsetG3_0_3M96 N*R^0 + (onsetG3_1_3M96 N*R^1 + onsetG3_2_3M96 N*R^2)) + (onsetG3_3_3M96 N*R^3 + (onsetG3_4_3M96 N*R^4 + onsetG3_5_3M96 N*R^5))) := by
  unfold onsetColumnGap3_3M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetG3_0_3M96 onsetG3_1_3M96 onsetG3_2_3M96 onsetG3_3_3M96 onsetG3_4_3M96 onsetG3_5_3M96
  ring
 rw [he]
 have hp0 := onsetG3_0_3M96_nonneg N hN
 have hp1 := onsetG3_1_3M96_nonneg N hN
 have hp2 := onsetG3_2_3M96_nonneg N hN
 have hp3 := onsetG3_3_3M96_nonneg N hN
 have hp4 := onsetG3_4_3M96_nonneg N hN
 have hp5 := onsetG3_5_3M96_nonneg N hN
 positivity

def onsetColumnGap3_4M96 (N R : ℤ) : ℤ := (((onsetColumn4_0M96 N R*onsetColumn4_4M96 N R-onsetColumn3_0M96 N R*onsetColumn5_4M96 N R) + (onsetColumn4_1M96 N R*onsetColumn4_3M96 N R-onsetColumn3_1M96 N R*onsetColumn5_3M96 N R)) + ((onsetColumn4_2M96 N R*onsetColumn4_2M96 N R-onsetColumn3_2M96 N R*onsetColumn5_2M96 N R) + ((onsetColumn4_3M96 N R*onsetColumn4_1M96 N R-onsetColumn3_3M96 N R*onsetColumn5_1M96 N R) + (onsetColumn4_4M96 N R*onsetColumn4_0M96 N R-onsetColumn3_4M96 N R*onsetColumn5_0M96 N R))))

theorem onsetColumnGap3_4M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_4M96 N R := by
 have he : onsetColumnGap3_4M96 N R=((onsetG3_0_4M96 N*R^0 + onsetG3_1_4M96 N*R^1) + (onsetG3_2_4M96 N*R^2 + (onsetG3_3_4M96 N*R^3 + onsetG3_4_4M96 N*R^4))) := by
  unfold onsetColumnGap3_4M96 onsetColumn3_0M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetG3_0_4M96 onsetG3_1_4M96 onsetG3_2_4M96 onsetG3_3_4M96 onsetG3_4_4M96
  ring
 rw [he]
 have hp0 := onsetG3_0_4M96_nonneg N hN
 have hp1 := onsetG3_1_4M96_nonneg N hN
 have hp2 := onsetG3_2_4M96_nonneg N hN
 have hp3 := onsetG3_3_4M96_nonneg N hN
 have hp4 := onsetG3_4_4M96_nonneg N hN
 positivity

def onsetColumnGap3_5M96 (N R : ℤ) : ℤ := (((onsetColumn4_1M96 N R*onsetColumn4_4M96 N R-onsetColumn3_1M96 N R*onsetColumn5_4M96 N R) + (onsetColumn4_2M96 N R*onsetColumn4_3M96 N R-onsetColumn3_2M96 N R*onsetColumn5_3M96 N R)) + ((onsetColumn4_3M96 N R*onsetColumn4_2M96 N R-onsetColumn3_3M96 N R*onsetColumn5_2M96 N R) + (onsetColumn4_4M96 N R*onsetColumn4_1M96 N R-onsetColumn3_4M96 N R*onsetColumn5_1M96 N R)))

theorem onsetColumnGap3_5M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap3_5M96 N R := by
 have he : onsetColumnGap3_5M96 N R=((onsetG3_0_5M96 N*R^0 + onsetG3_1_5M96 N*R^1) + (onsetG3_2_5M96 N*R^2 + onsetG3_3_5M96 N*R^3)) := by
  unfold onsetColumnGap3_5M96 onsetColumn3_1M96 onsetColumn3_2M96 onsetColumn3_3M96 onsetColumn3_4M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetG3_0_5M96 onsetG3_1_5M96 onsetG3_2_5M96 onsetG3_3_5M96
  ring
 rw [he]
 have hp0 := onsetG3_0_5M96_nonneg N hN
 have hp1 := onsetG3_1_5M96_nonneg N hN
 have hp2 := onsetG3_2_5M96_nonneg N hN
 have hp3 := onsetG3_3_5M96_nonneg N hN
 positivity
end
end MathGKM.Markov
