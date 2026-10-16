import MarkovThirdSmallCoeff21MF8
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
theorem sThird21finite2MF8 (j : ℤ) (h0 : 2≤j) (hN : j≤11) :
 sThird21EMF8 2 (j-1)*sThird21EMF8 2 (j+1) ≤ sThird21EMF8 2 j^2 := by
 interval_cases j <;> norm_num [sThird21EMF8,sThird21c1_2MF8,sThird21c1_3MF8,sThird21c1_4MF8,sThird21c2_3MF8,sThird21c2_4MF8,sThird21c2_5MF8,sThird21c3_3MF8,sThird21c3_4MF8,sThird21c3_5MF8,sThird21c3_6MF8,sThird21c3_7MF8,vFallM115]
end
end MathGKM.Markov
