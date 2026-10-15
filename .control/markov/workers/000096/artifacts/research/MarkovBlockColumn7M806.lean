import MarkovBlockColumnsM806
import MarkovSplitLG07M042
import MarkovSplitLG17M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap7M806 (J E R : ℤ) : ℤ := ((blockColumn13M806 J E R*blockColumn14M806 J E R-blockColumn03M806 J E R*blockColumn24M806 J E R) + (blockColumn14M806 J E R*blockColumn13M806 J E R-blockColumn04M806 J E R*blockColumn23M806 J E R))

theorem blockColumnGap7M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap7M806 J E R := by
 have he : blockColumnGap7M806 J E R=(blockLG07M042 J E*R^0 + blockLG17M042 J E*R^1) := by
  unfold blockColumnGap7M806 blockColumn03M806 blockColumn04M806 blockColumn13M806 blockColumn14M806 blockColumn23M806 blockColumn24M806 blockLG07M042 blockLG17M042
  ring
 rw [he]
 have hp0 := blockLG07M042_nonneg J E hJ hE
 have hp1 := blockLG17M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
