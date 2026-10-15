import MarkovBlockColumnsM806
import MarkovSplitLG06M042
import MarkovSplitLG16M042
import MarkovSplitLG26M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap6M806 (J E R : ℤ) : ℤ := ((blockColumn12M806 J E R*blockColumn14M806 J E R-blockColumn02M806 J E R*blockColumn24M806 J E R) + ((blockColumn13M806 J E R*blockColumn13M806 J E R-blockColumn03M806 J E R*blockColumn23M806 J E R) + (blockColumn14M806 J E R*blockColumn12M806 J E R-blockColumn04M806 J E R*blockColumn22M806 J E R)))

theorem blockColumnGap6M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap6M806 J E R := by
 have he : blockColumnGap6M806 J E R=(blockLG06M042 J E*R^0 + (blockLG16M042 J E*R^1 + blockLG26M042 J E*R^2)) := by
  unfold blockColumnGap6M806 blockColumn02M806 blockColumn03M806 blockColumn04M806 blockColumn12M806 blockColumn13M806 blockColumn14M806 blockColumn22M806 blockColumn23M806 blockColumn24M806 blockLG06M042 blockLG16M042 blockLG26M042
  ring
 rw [he]
 have hp0 := blockLG06M042_nonneg J E hJ hE
 have hp1 := blockLG16M042_nonneg J E hJ hE
 have hp2 := blockLG26M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
