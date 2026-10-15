import MarkovBlockColumnsM806
import MarkovSplitLG03M042
import MarkovSplitLG13M042
import MarkovSplitLG23M042
import MarkovSplitLG33M042
import MarkovBlockLGap4M042
import MarkovBlockLGap5M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap3M806 (J E R : ℤ) : ℤ := (((blockColumn10M806 J E R*blockColumn13M806 J E R-blockColumn00M806 J E R*blockColumn23M806 J E R) + (blockColumn11M806 J E R*blockColumn12M806 J E R-blockColumn01M806 J E R*blockColumn22M806 J E R)) + ((blockColumn12M806 J E R*blockColumn11M806 J E R-blockColumn02M806 J E R*blockColumn21M806 J E R) + (blockColumn13M806 J E R*blockColumn10M806 J E R-blockColumn03M806 J E R*blockColumn20M806 J E R)))

theorem blockColumnGap3M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap3M806 J E R := by
 have he : blockColumnGap3M806 J E R=((blockLG03M042 J E*R^0 + (blockLG13M042 J E*R^1 + blockLG23M042 J E*R^2)) + (blockLG33M042 J E*R^3 + (blockLG43M042 J E*R^4 + blockLG53M042 J E*R^5))) := by
  unfold blockColumnGap3M806 blockColumn00M806 blockColumn01M806 blockColumn02M806 blockColumn03M806 blockColumn10M806 blockColumn11M806 blockColumn12M806 blockColumn13M806 blockColumn20M806 blockColumn21M806 blockColumn22M806 blockColumn23M806 blockLG03M042 blockLG13M042 blockLG23M042 blockLG33M042 blockLG43M042 blockLG53M042
  ring
 rw [he]
 have hp0 := blockLG03M042_nonneg J E hJ hE
 have hp1 := blockLG13M042_nonneg J E hJ hE
 have hp2 := blockLG23M042_nonneg J E hJ hE
 have hp3 := blockLG33M042_nonneg J E hJ hE
 have hp4 := blockLG43M042_nonneg J E hJ hE
 have hp5 := blockLG53M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
