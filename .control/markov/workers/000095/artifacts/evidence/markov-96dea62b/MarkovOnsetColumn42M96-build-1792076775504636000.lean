import MarkovOnsetColumnsM96
import MarkovOnsetGap40M96
import MarkovOnsetGap41M96
import MarkovOnsetGap42M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetColumnGap4_6M96 (N R : ℤ) : ℤ := ((onsetColumn5_2M96 N R*onsetColumn5_4M96 N R-onsetColumn4_2M96 N R*onsetColumn6_4M96 N R) + ((onsetColumn5_3M96 N R*onsetColumn5_3M96 N R-onsetColumn4_3M96 N R*onsetColumn6_3M96 N R) + (onsetColumn5_4M96 N R*onsetColumn5_2M96 N R-onsetColumn4_4M96 N R*onsetColumn6_2M96 N R)))

theorem onsetColumnGap4_6M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_6M96 N R := by
 have he : onsetColumnGap4_6M96 N R=(onsetG4_0_6M96 N*R^0 + (onsetG4_1_6M96 N*R^1 + onsetG4_2_6M96 N*R^2)) := by
  unfold onsetColumnGap4_6M96 onsetColumn4_2M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_2M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetColumn6_2M96 onsetColumn6_3M96 onsetColumn6_4M96 onsetG4_0_6M96 onsetG4_1_6M96 onsetG4_2_6M96
  ring
 rw [he]
 have hp0 := onsetG4_0_6M96_nonneg N hN
 have hp1 := onsetG4_1_6M96_nonneg N hN
 have hp2 := onsetG4_2_6M96_nonneg N hN
 positivity

def onsetColumnGap4_7M96 (N R : ℤ) : ℤ := ((onsetColumn5_3M96 N R*onsetColumn5_4M96 N R-onsetColumn4_3M96 N R*onsetColumn6_4M96 N R) + (onsetColumn5_4M96 N R*onsetColumn5_3M96 N R-onsetColumn4_4M96 N R*onsetColumn6_3M96 N R))

theorem onsetColumnGap4_7M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_7M96 N R := by
 have he : onsetColumnGap4_7M96 N R=(onsetG4_0_7M96 N*R^0 + onsetG4_1_7M96 N*R^1) := by
  unfold onsetColumnGap4_7M96 onsetColumn4_3M96 onsetColumn4_4M96 onsetColumn5_3M96 onsetColumn5_4M96 onsetColumn6_3M96 onsetColumn6_4M96 onsetG4_0_7M96 onsetG4_1_7M96
  ring
 rw [he]
 have hp0 := onsetG4_0_7M96_nonneg N hN
 have hp1 := onsetG4_1_7M96_nonneg N hN
 positivity

def onsetColumnGap4_8M96 (N R : ℤ) : ℤ := (onsetColumn5_4M96 N R*onsetColumn5_4M96 N R-onsetColumn4_4M96 N R*onsetColumn6_4M96 N R)

theorem onsetColumnGap4_8M96_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :
 0≤onsetColumnGap4_8M96 N R := by
 have he : onsetColumnGap4_8M96 N R=onsetG4_0_8M96 N*R^0 := by
  unfold onsetColumnGap4_8M96 onsetColumn4_4M96 onsetColumn5_4M96 onsetColumn6_4M96 onsetG4_0_8M96
  ring
 rw [he]
 have hp0 := onsetG4_0_8M96_nonneg N hN
 positivity
end
end MathGKM.Markov
