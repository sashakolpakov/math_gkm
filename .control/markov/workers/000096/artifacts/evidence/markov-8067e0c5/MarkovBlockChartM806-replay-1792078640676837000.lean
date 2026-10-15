import MarkovBlockColumn0M806
import MarkovBlockColumn1M806
import MarkovBlockColumn2M806
import MarkovBlockColumn3M806
import MarkovBlockColumn4M806
import MarkovBlockColumn5M806
import MarkovBlockColumn6M806
import MarkovBlockColumn7M806
import MarkovBlockColumn8M806
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

theorem blockLChartM806 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) :
 0≤(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+11)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+6))^2-(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+10)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+5))*(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+12)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+7)) := by
 rw [block_columns0M806,block_columns1M806,block_columns2M806]
 have he : ((blockColumn10M806 J E R*C^0 + blockColumn11M806 J E R*C^1) + (blockColumn12M806 J E R*C^2 + (blockColumn13M806 J E R*C^3 + blockColumn14M806 J E R*C^4)))^2-((blockColumn00M806 J E R*C^0 + blockColumn01M806 J E R*C^1) + (blockColumn02M806 J E R*C^2 + (blockColumn03M806 J E R*C^3 + blockColumn04M806 J E R*C^4)))*((blockColumn20M806 J E R*C^0 + blockColumn21M806 J E R*C^1) + (blockColumn22M806 J E R*C^2 + (blockColumn23M806 J E R*C^3 + blockColumn24M806 J E R*C^4)))=(((blockColumnGap0M806 J E R*C^0 + blockColumnGap1M806 J E R*C^1) + (blockColumnGap2M806 J E R*C^2 + blockColumnGap3M806 J E R*C^3)) + ((blockColumnGap4M806 J E R*C^4 + blockColumnGap5M806 J E R*C^5) + (blockColumnGap6M806 J E R*C^6 + (blockColumnGap7M806 J E R*C^7 + blockColumnGap8M806 J E R*C^8)))) := by
  unfold blockColumnGap0M806 blockColumnGap1M806 blockColumnGap2M806 blockColumnGap3M806 blockColumnGap4M806 blockColumnGap5M806 blockColumnGap6M806 blockColumnGap7M806 blockColumnGap8M806
  ring
 rw [he]
 have hp0 := blockColumnGap0M806_nonneg J E R hJ hE hR
 have hp1 := blockColumnGap1M806_nonneg J E R hJ hE hR
 have hp2 := blockColumnGap2M806_nonneg J E R hJ hE hR
 have hp3 := blockColumnGap3M806_nonneg J E R hJ hE hR
 have hp4 := blockColumnGap4M806_nonneg J E R hJ hE hR
 have hp5 := blockColumnGap5M806_nonneg J E R hJ hE hR
 have hp6 := blockColumnGap6M806_nonneg J E R hJ hE hR
 have hp7 := blockColumnGap7M806_nonneg J E R hJ hE hR
 have hp8 := blockColumnGap8M806_nonneg J E R hJ hE hR
 positivity
end
end MathGKM.Markov
