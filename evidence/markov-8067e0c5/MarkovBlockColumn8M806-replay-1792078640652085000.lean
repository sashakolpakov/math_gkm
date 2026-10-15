import MarkovBlockColumnsM806
import MarkovSplitLG08M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap8M806 (J E R : ℤ) : ℤ := (blockColumn14M806 J E R*blockColumn14M806 J E R-blockColumn04M806 J E R*blockColumn24M806 J E R)

theorem blockColumnGap8M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap8M806 J E R := by
 have he : blockColumnGap8M806 J E R=blockLG08M042 J E*R^0 := by
  unfold blockColumnGap8M806 blockColumn04M806 blockColumn14M806 blockColumn24M806 blockLG08M042
  ring
 rw [he]
 have hp0 := blockLG08M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
