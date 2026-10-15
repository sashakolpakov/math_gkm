import MarkovOnsetColumnsM96
import MarkovOnsetGap40M96
import MarkovOnsetGap41M96
import MarkovOnsetGap42M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap4_3M96 (N R : ℤ) : ℤ := (((onsetColumn5_0M96 N R*onsetColumn5_3M96 N R-onsetColumn4_0M96 N R*onsetColumn6_3M96 N R) + (onsetColumn5_1M96 N R*onsetColumn5_2M96 N R-onsetColumn4_1M96 N R*onsetColumn6_2M96 N R)) + ((onsetColumn5_2M96 N R*onsetColumn5_1M96 N R-onsetColumn4_2M96 N R*onsetColumn6_1M96 N R) + (onsetColumn5_3M96 N R*onsetColumn5_0M96 N R-onsetColumn4_3M96 N R*onsetColumn6_0M96 N R)))

theorem onsetColumnGap4_3M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_3M96 N R := by
 have he : onsetColumnGap4_3M96 N R=((onsetG4_0_3M96 N*R^0 + (onsetG4_1_3M96 N*R^1 + onsetG4_2_3M96 N*R^2)) + (onsetG4_3_3M96 N*R^3 + (onsetG4_4_3M96 N*R^4 + onsetG4_5_3M96 N*R^5))) := by
  unfold onsetColumnGap4_3M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn6_0M96 onsetColumn6_1M96 onsetColumn6_2M96 onsetColumn6_3M96 onsetG4_0_3M96 onsetG4_1_3M96 onsetG4_2_3M96 onsetG4_3_3M96 onsetG4_4_3M96 onsetG4_5_3M96
  ring
 rw [he]
 have hp0 := onsetG4_0_3M96_nonneg N hN
 have hp1 := onsetG4_1_3M96_nonneg N hN
 have hp2 := onsetG4_2_3M96_nonneg N hN
 have hp3 := onsetG4_3_3M96_nonneg N hN
 have hp4 := onsetG4_4_3M96_nonneg N hN
 have hp5 := onsetG4_5_3M96_nonneg N hN
 positivity

def onsetColumnGap4_4M96 (N R : ℤ) : ℤ := (((onsetColumn5_0M96 N R*onsetColumn5_4M96 N R-onsetColumn4_0M96 N R*onsetColumn6_4M96 N R) + (onsetColumn5_1M96 N R*onsetColumn5_3M96 N R-onsetColumn4_1M96 N R*onsetColumn6_3M96 N R)) + ((onsetColumn5_2M96 N R*onsetColumn5_2M96 N R-onsetColumn4_2M96 N R*onsetColumn6_2M96 N R) + ((onsetColumn5_3M96 N R*onsetColumn5_1M96 N R-onsetColumn4_3M96 N R*onsetColumn6_1M96 N R) + (onsetColumn5_4M96 N R*onsetColumn5_0M96 N R-onsetColumn4_4M96 N R*onsetColumn6_0M96 N R))))

theorem onsetColumnGap4_4M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_4M96 N R := by
 have he : onsetColumnGap4_4M96 N R=((onsetG4_0_4M96 N*R^0 + onsetG4_1_4M96 N*R^1) + (onsetG4_2_4M96 N*R^2 + (onsetG4_3_4M96 N*R^3 + onsetG4_4_4M96 N*R^4))) := by
  unfold onsetColumnGap4_4M96 onsetColumn4_0M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_0M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetColumn6_0M96 onsetColumn6_1M96 onsetColumn6_2M96 onsetColumn6_3M96 onsetColumn6_4M96 onsetG4_0_4M96 onsetG4_1_4M96 onsetG4_2_4M96 onsetG4_3_4M96 onsetG4_4_4M96
  ring
 rw [he]
 have hp0 := onsetG4_0_4M96_nonneg N hN
 have hp1 := onsetG4_1_4M96_nonneg N hN
 have hp2 := onsetG4_2_4M96_nonneg N hN
 have hp3 := onsetG4_3_4M96_nonneg N hN
 have hp4 := onsetG4_4_4M96_nonneg N hN
 positivity

def onsetColumnGap4_5M96 (N R : ℤ) : ℤ := (((onsetColumn5_1M96 N R*onsetColumn5_4M96 N R-onsetColumn4_1M96 N R*onsetColumn6_4M96 N R) + (onsetColumn5_2M96 N R*onsetColumn5_3M96 N R-onsetColumn4_2M96 N R*onsetColumn6_3M96 N R)) + ((onsetColumn5_3M96 N R*onsetColumn5_2M96 N R-onsetColumn4_3M96 N R*onsetColumn6_2M96 N R) + (onsetColumn5_4M96 N R*onsetColumn5_1M96 N R-onsetColumn4_4M96 N R*onsetColumn6_1M96 N R)))

theorem onsetColumnGap4_5M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_5M96 N R := by
 have he : onsetColumnGap4_5M96 N R=((onsetG4_0_5M96 N*R^0 + onsetG4_1_5M96 N*R^1) + (onsetG4_2_5M96 N*R^2 + onsetG4_3_5M96 N*R^3)) := by
  unfold onsetColumnGap4_5M96 onsetColumn4_1M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_1M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetColumn6_1M96 onsetColumn6_2M96 onsetColumn6_3M96 onsetColumn6_4M96 onsetG4_0_5M96 onsetG4_1_5M96 onsetG4_2_5M96 onsetG4_3_5M96
  ring
 rw [he]
 have hp0 := onsetG4_0_5M96_nonneg N hN
 have hp1 := onsetG4_1_5M96_nonneg N hN
 have hp2 := onsetG4_2_5M96_nonneg N hN
 have hp3 := onsetG4_3_5M96_nonneg N hN
 positivity
end
end MathGKM.Markov
