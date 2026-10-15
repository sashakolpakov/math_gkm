import MarkovBlockColumnsM806
import MarkovSplitLG01M042
import MarkovSplitLG11M042
import MarkovSplitLG21M042
import MarkovSplitLG31M042
import MarkovBlockLGap4M042
import MarkovBlockLGap5M042
import MarkovBlockLGap6M042
import MarkovBlockLGap7M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap1M806 (J E R : ℤ) : ℤ := ((blockColumn10M806 J E R*blockColumn11M806 J E R-blockColumn00M806 J E R*blockColumn21M806 J E R) + (blockColumn11M806 J E R*blockColumn10M806 J E R-blockColumn01M806 J E R*blockColumn20M806 J E R))

theorem blockColumnGap1M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap1M806 J E R := by
 have he : blockColumnGap1M806 J E R=(((blockLG01M042 J E*R^0 + blockLG11M042 J E*R^1) + (blockLG21M042 J E*R^2 + blockLG31M042 J E*R^3)) + ((blockLG41M042 J E*R^4 + blockLG51M042 J E*R^5) + (blockLG61M042 J E*R^6 + blockLG71M042 J E*R^7))) := by
  unfold blockColumnGap1M806 blockColumn00M806 blockColumn01M806 blockColumn10M806 blockColumn11M806 blockColumn20M806 blockColumn21M806 blockLG01M042 blockLG11M042 blockLG21M042 blockLG31M042 blockLG41M042 blockLG51M042 blockLG61M042 blockLG71M042
  ring
 rw [he]
 have hp0 := blockLG01M042_nonneg J E hJ hE
 have hp1 := blockLG11M042_nonneg J E hJ hE
 have hp2 := blockLG21M042_nonneg J E hJ hE
 have hp3 := blockLG31M042_nonneg J E hJ hE
 have hp4 := blockLG41M042_nonneg J E hJ hE
 have hp5 := blockLG51M042_nonneg J E hJ hE
 have hp6 := blockLG61M042_nonneg J E hJ hE
 have hp7 := blockLG71M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
