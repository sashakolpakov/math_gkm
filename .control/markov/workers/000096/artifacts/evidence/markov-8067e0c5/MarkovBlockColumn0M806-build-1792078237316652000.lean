import MarkovBlockColumnsM806
import MarkovSplitLG00M042
import MarkovSplitLG10M042
import MarkovSplitLG20M042
import MarkovSplitLG30M042
import MarkovBlockLGap4M042
import MarkovBlockLGap5M042
import MarkovBlockLGap6M042
import MarkovBlockLGap7M042
import MarkovBlockLGap8M042
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumnGap0M806 (J E R : ℤ) : ℤ := (blockColumn10M806 J E R*blockColumn10M806 J E R-blockColumn00M806 J E R*blockColumn20M806 J E R)

theorem blockColumnGap0M806_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockColumnGap0M806 J E R := by
 have he : blockColumnGap0M806 J E R=(((blockLG00M042 J E*R^0 + blockLG10M042 J E*R^1) + (blockLG20M042 J E*R^2 + blockLG30M042 J E*R^3)) + ((blockLG40M042 J E*R^4 + blockLG50M042 J E*R^5) + (blockLG60M042 J E*R^6 + (blockLG70M042 J E*R^7 + blockLG80M042 J E*R^8)))) := by
  unfold blockColumnGap0M806 blockColumn00M806 blockColumn10M806 blockColumn20M806 blockLG00M042 blockLG10M042 blockLG20M042 blockLG30M042 blockLG40M042 blockLG50M042 blockLG60M042 blockLG70M042 blockLG80M042
  ring
 rw [he]
 have hp0 := blockLG00M042_nonneg J E hJ hE
 have hp1 := blockLG10M042_nonneg J E hJ hE
 have hp2 := blockLG20M042_nonneg J E hJ hE
 have hp3 := blockLG30M042_nonneg J E hJ hE
 have hp4 := blockLG40M042_nonneg J E hJ hE
 have hp5 := blockLG50M042_nonneg J E hJ hE
 have hp6 := blockLG60M042_nonneg J E hJ hE
 have hp7 := blockLG70M042_nonneg J E hJ hE
 have hp8 := blockLG80M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
