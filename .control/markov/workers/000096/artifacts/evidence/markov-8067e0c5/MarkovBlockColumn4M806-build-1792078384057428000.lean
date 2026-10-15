import MarkovBlockColumnsM806
import MarkovSplitLG04M042
import MarkovSplitLG14M042
import MarkovSplitLG24M042
import MarkovSplitLG34M042
import MarkovBlockLGap4M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap4M806 (J E R : ℤ) : ℤ := (((blockColumn10M806 J E R*blockColumn14M806 J E R-blockColumn00M806 J E R*blockColumn24M806 J E R) + (blockColumn11M806 J E R*blockColumn13M806 J E R-blockColumn01M806 J E R*blockColumn23M806 J E R)) + ((blockColumn12M806 J E R*blockColumn12M806 J E R-blockColumn02M806 J E R*blockColumn22M806 J E R) + ((blockColumn13M806 J E R*blockColumn11M806 J E R-blockColumn03M806 J E R*blockColumn21M806 J E R) + (blockColumn14M806 J E R*blockColumn10M806 J E R-blockColumn04M806 J E R*blockColumn20M806 J E R))))

theorem blockColumnGap4M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap4M806 J E R := by
 have he : blockColumnGap4M806 J E R=((blockLG04M042 J E*R^0 + blockLG14M042 J E*R^1) + (blockLG24M042 J E*R^2 + (blockLG34M042 J E*R^3 + blockLG44M042 J E*R^4))) := by
  unfold blockColumnGap4M806 blockColumn00M806 blockColumn01M806 blockColumn02M806 blockColumn03M806 blockColumn04M806 blockColumn10M806 blockColumn11M806 blockColumn12M806 blockColumn13M806 blockColumn14M806 blockColumn20M806 blockColumn21M806 blockColumn22M806 blockColumn23M806 blockColumn24M806 blockLG04M042 blockLG14M042 blockLG24M042 blockLG34M042 blockLG44M042
  ring
 rw [he]
 have hp0 := blockLG04M042_nonneg J E hJ hE
 have hp1 := blockLG14M042_nonneg J E hJ hE
 have hp2 := blockLG24M042_nonneg J E hJ hE
 have hp3 := blockLG34M042_nonneg J E hJ hE
 have hp4 := blockLG44M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
