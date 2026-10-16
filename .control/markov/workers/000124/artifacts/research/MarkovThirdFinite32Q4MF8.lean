import MarkovThirdSmallCoeff32MF8
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
theorem sThird32finite4MF8 (j : ℤ) (h0 : 2≤j) (hN : j≤17) :
 sThird32EMF8 4 (j-1)*sThird32EMF8 4 (j+1) ≤ sThird32EMF8 4 j^2 := by
 interval_cases j <;> norm_num [sThird32EMF8,sThird32c0_1MF8,sThird32c0_2MF8,sThird32c0_3MF8,sThird32c1_2MF8,sThird32c1_3MF8,sThird32c1_4MF8,sThird32c2_3MF8,sThird32c2_4MF8,sThird32c2_5MF8,sThird32c2_6MF8,sThird32c3_3MF8,sThird32c3_4MF8,sThird32c3_5MF8,sThird32c3_6MF8,sThird32c3_7MF8,sThird32c3_8MF8,vFallM115]
end
end MathGKM.Markov
