import MarkovBlockColumnsM806
import MarkovSplitLG02M042
import MarkovSplitLG12M042
import MarkovSplitLG22M042
import MarkovSplitLG32M042
import MarkovBlockLGap4M042
import MarkovBlockLGap5M042
import MarkovBlockLGap6M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap2M806 (J E R : ℤ) : ℤ := ((blockColumn10M806 J E R*blockColumn12M806 J E R-blockColumn00M806 J E R*blockColumn22M806 J E R) + ((blockColumn11M806 J E R*blockColumn11M806 J E R-blockColumn01M806 J E R*blockColumn21M806 J E R) + (blockColumn12M806 J E R*blockColumn10M806 J E R-blockColumn02M806 J E R*blockColumn20M806 J E R)))

theorem blockColumnGap2M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap2M806 J E R := by
 have he : blockColumnGap2M806 J E R=((blockLG02M042 J E*R^0 + (blockLG12M042 J E*R^1 + blockLG22M042 J E*R^2)) + ((blockLG32M042 J E*R^3 + blockLG42M042 J E*R^4) + (blockLG52M042 J E*R^5 + blockLG62M042 J E*R^6))) := by
  unfold blockColumnGap2M806 blockColumn00M806 blockColumn01M806 blockColumn02M806 blockColumn10M806 blockColumn11M806 blockColumn12M806 blockColumn20M806 blockColumn21M806 blockColumn22M806 blockLG02M042 blockLG12M042 blockLG22M042 blockLG32M042 blockLG42M042 blockLG52M042 blockLG62M042
  ring
 rw [he]
 have hp0 := blockLG02M042_nonneg J E hJ hE
 have hp1 := blockLG12M042_nonneg J E hJ hE
 have hp2 := blockLG22M042_nonneg J E hJ hE
 have hp3 := blockLG32M042_nonneg J E hJ hE
 have hp4 := blockLG42M042_nonneg J E hJ hE
 have hp5 := blockLG52M042_nonneg J E hJ hE
 have hp6 := blockLG62M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
