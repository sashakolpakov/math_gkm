import MarkovBlockColumnsM806
import MarkovSplitLG05M042
import MarkovSplitLG15M042
import MarkovSplitLG25M042
import MarkovSplitLG35M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap5M806 (J E R : ℤ) : ℤ := (((blockColumn11M806 J E R*blockColumn14M806 J E R-blockColumn01M806 J E R*blockColumn24M806 J E R) + (blockColumn12M806 J E R*blockColumn13M806 J E R-blockColumn02M806 J E R*blockColumn23M806 J E R)) + ((blockColumn13M806 J E R*blockColumn12M806 J E R-blockColumn03M806 J E R*blockColumn22M806 J E R) + (blockColumn14M806 J E R*blockColumn11M806 J E R-blockColumn04M806 J E R*blockColumn21M806 J E R)))

theorem blockColumnGap5M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap5M806 J E R := by
 have he : blockColumnGap5M806 J E R=((blockLG05M042 J E*R^0 + blockLG15M042 J E*R^1) + (blockLG25M042 J E*R^2 + blockLG35M042 J E*R^3)) := by
  unfold blockColumnGap5M806 blockColumn01M806 blockColumn02M806 blockColumn03M806 blockColumn04M806 blockColumn11M806 blockColumn12M806 blockColumn13M806 blockColumn14M806 blockColumn21M806 blockColumn22M806 blockColumn23M806 blockColumn24M806 blockLG05M042 blockLG15M042 blockLG25M042 blockLG35M042
  ring
 rw [he]
 have hp0 := blockLG05M042_nonneg J E hJ hE
 have hp1 := blockLG15M042_nonneg J E hJ hE
 have hp2 := blockLG25M042_nonneg J E hJ hE
 have hp3 := blockLG35M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
