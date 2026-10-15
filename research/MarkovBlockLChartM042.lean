import MarkovBlockLValue0M042
import MarkovBlockLValue1M042
import MarkovBlockLValue2M042
import MarkovBlockLGap0M042
import MarkovBlockLGap1M042
import MarkovBlockLGap2M042
import MarkovBlockLGap3M042
import MarkovBlockLGap4M042
import MarkovBlockLGap5M042
import MarkovBlockLGap6M042
import MarkovBlockLGap7M042
import MarkovBlockLGap8M042
/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

theorem blockLChartM042 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) :
 0≤(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+11)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+6))^2-(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+10)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+5))*(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+12)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+7)) := by
 rw [blockLValue0M042,blockLValue1M042,blockLValue2M042]
 have he : (((blockLP100M042 J E*R^0*C^0 + (blockLP101M042 J E*R^0*C^1 + blockLP102M042 J E*R^0*C^2)) + ((blockLP103M042 J E*R^0*C^3 + blockLP104M042 J E*R^0*C^4) + (blockLP110M042 J E*R^1*C^0 + blockLP111M042 J E*R^1*C^1))) + (((blockLP112M042 J E*R^1*C^2 + blockLP113M042 J E*R^1*C^3) + (blockLP120M042 J E*R^2*C^0 + blockLP121M042 J E*R^2*C^1)) + ((blockLP122M042 J E*R^2*C^2 + blockLP130M042 J E*R^3*C^0) + (blockLP131M042 J E*R^3*C^1 + blockLP140M042 J E*R^4*C^0))))^2-(((blockLP000M042 J E*R^0*C^0 + (blockLP001M042 J E*R^0*C^1 + blockLP002M042 J E*R^0*C^2)) + ((blockLP003M042 J E*R^0*C^3 + blockLP004M042 J E*R^0*C^4) + (blockLP010M042 J E*R^1*C^0 + blockLP011M042 J E*R^1*C^1))) + (((blockLP012M042 J E*R^1*C^2 + blockLP013M042 J E*R^1*C^3) + (blockLP020M042 J E*R^2*C^0 + blockLP021M042 J E*R^2*C^1)) + ((blockLP022M042 J E*R^2*C^2 + blockLP030M042 J E*R^3*C^0) + (blockLP031M042 J E*R^3*C^1 + blockLP040M042 J E*R^4*C^0))))*(((blockLP200M042 J E*R^0*C^0 + (blockLP201M042 J E*R^0*C^1 + blockLP202M042 J E*R^0*C^2)) + ((blockLP203M042 J E*R^0*C^3 + blockLP204M042 J E*R^0*C^4) + (blockLP210M042 J E*R^1*C^0 + blockLP211M042 J E*R^1*C^1))) + (((blockLP212M042 J E*R^1*C^2 + blockLP213M042 J E*R^1*C^3) + (blockLP220M042 J E*R^2*C^0 + blockLP221M042 J E*R^2*C^1)) + ((blockLP222M042 J E*R^2*C^2 + blockLP230M042 J E*R^3*C^0) + (blockLP231M042 J E*R^3*C^1 + blockLP240M042 J E*R^4*C^0))))=
 (((((blockLG00M042 J E*R^0*C^0 + blockLG01M042 J E*R^0*C^1) + (blockLG02M042 J E*R^0*C^2 + (blockLG03M042 J E*R^0*C^3 + blockLG04M042 J E*R^0*C^4))) + ((blockLG05M042 J E*R^0*C^5 + (blockLG06M042 J E*R^0*C^6 + blockLG07M042 J E*R^0*C^7)) + (blockLG08M042 J E*R^0*C^8 + (blockLG10M042 J E*R^1*C^0 + blockLG11M042 J E*R^1*C^1)))) + (((blockLG12M042 J E*R^1*C^2 + blockLG13M042 J E*R^1*C^3) + (blockLG14M042 J E*R^1*C^4 + (blockLG15M042 J E*R^1*C^5 + blockLG16M042 J E*R^1*C^6))) + ((blockLG17M042 J E*R^1*C^7 + (blockLG20M042 J E*R^2*C^0 + blockLG21M042 J E*R^2*C^1)) + (blockLG22M042 J E*R^2*C^2 + (blockLG23M042 J E*R^2*C^3 + blockLG24M042 J E*R^2*C^4))))) + ((((blockLG25M042 J E*R^2*C^5 + blockLG26M042 J E*R^2*C^6) + (blockLG30M042 J E*R^3*C^0 + (blockLG31M042 J E*R^3*C^1 + blockLG32M042 J E*R^3*C^2))) + ((blockLG33M042 J E*R^3*C^3 + (blockLG34M042 J E*R^3*C^4 + blockLG35M042 J E*R^3*C^5)) + (blockLG40M042 J E*R^4*C^0 + (blockLG41M042 J E*R^4*C^1 + blockLG42M042 J E*R^4*C^2)))) + (((blockLG43M042 J E*R^4*C^3 + (blockLG44M042 J E*R^4*C^4 + blockLG50M042 J E*R^5*C^0)) + (blockLG51M042 J E*R^5*C^1 + (blockLG52M042 J E*R^5*C^2 + blockLG53M042 J E*R^5*C^3))) + ((blockLG60M042 J E*R^6*C^0 + (blockLG61M042 J E*R^6*C^1 + blockLG62M042 J E*R^6*C^2)) + (blockLG70M042 J E*R^7*C^0 + (blockLG71M042 J E*R^7*C^1 + blockLG80M042 J E*R^8*C^0)))))) := by
  unfold blockLG00M042 blockLG01M042 blockLG02M042 blockLG03M042 blockLG04M042 blockLG05M042 blockLG06M042 blockLG07M042 blockLG08M042 blockLG10M042 blockLG11M042 blockLG12M042 blockLG13M042 blockLG14M042 blockLG15M042 blockLG16M042 blockLG17M042 blockLG20M042 blockLG21M042 blockLG22M042 blockLG23M042 blockLG24M042 blockLG25M042 blockLG26M042 blockLG30M042 blockLG31M042 blockLG32M042 blockLG33M042 blockLG34M042 blockLG35M042 blockLG40M042 blockLG41M042 blockLG42M042 blockLG43M042 blockLG44M042 blockLG50M042 blockLG51M042 blockLG52M042 blockLG53M042 blockLG60M042 blockLG61M042 blockLG62M042 blockLG70M042 blockLG71M042 blockLG80M042
  ring
 rw [he]
 have hp00 := blockLG00M042_nonneg J E hJ hE
 have hp01 := blockLG01M042_nonneg J E hJ hE
 have hp02 := blockLG02M042_nonneg J E hJ hE
 have hp03 := blockLG03M042_nonneg J E hJ hE
 have hp04 := blockLG04M042_nonneg J E hJ hE
 have hp05 := blockLG05M042_nonneg J E hJ hE
 have hp06 := blockLG06M042_nonneg J E hJ hE
 have hp07 := blockLG07M042_nonneg J E hJ hE
 have hp08 := blockLG08M042_nonneg J E hJ hE
 have hp10 := blockLG10M042_nonneg J E hJ hE
 have hp11 := blockLG11M042_nonneg J E hJ hE
 have hp12 := blockLG12M042_nonneg J E hJ hE
 have hp13 := blockLG13M042_nonneg J E hJ hE
 have hp14 := blockLG14M042_nonneg J E hJ hE
 have hp15 := blockLG15M042_nonneg J E hJ hE
 have hp16 := blockLG16M042_nonneg J E hJ hE
 have hp17 := blockLG17M042_nonneg J E hJ hE
 have hp20 := blockLG20M042_nonneg J E hJ hE
 have hp21 := blockLG21M042_nonneg J E hJ hE
 have hp22 := blockLG22M042_nonneg J E hJ hE
 have hp23 := blockLG23M042_nonneg J E hJ hE
 have hp24 := blockLG24M042_nonneg J E hJ hE
 have hp25 := blockLG25M042_nonneg J E hJ hE
 have hp26 := blockLG26M042_nonneg J E hJ hE
 have hp30 := blockLG30M042_nonneg J E hJ hE
 have hp31 := blockLG31M042_nonneg J E hJ hE
 have hp32 := blockLG32M042_nonneg J E hJ hE
 have hp33 := blockLG33M042_nonneg J E hJ hE
 have hp34 := blockLG34M042_nonneg J E hJ hE
 have hp35 := blockLG35M042_nonneg J E hJ hE
 have hp40 := blockLG40M042_nonneg J E hJ hE
 have hp41 := blockLG41M042_nonneg J E hJ hE
 have hp42 := blockLG42M042_nonneg J E hJ hE
 have hp43 := blockLG43M042_nonneg J E hJ hE
 have hp44 := blockLG44M042_nonneg J E hJ hE
 have hp50 := blockLG50M042_nonneg J E hJ hE
 have hp51 := blockLG51M042_nonneg J E hJ hE
 have hp52 := blockLG52M042_nonneg J E hJ hE
 have hp53 := blockLG53M042_nonneg J E hJ hE
 have hp60 := blockLG60M042_nonneg J E hJ hE
 have hp61 := blockLG61M042_nonneg J E hJ hE
 have hp62 := blockLG62M042_nonneg J E hJ hE
 have hp70 := blockLG70M042_nonneg J E hJ hE
 have hp71 := blockLG71M042_nonneg J E hJ hE
 have hp80 := blockLG80M042_nonneg J E hJ hE
 positivity
end
end MathGKM.Markov
