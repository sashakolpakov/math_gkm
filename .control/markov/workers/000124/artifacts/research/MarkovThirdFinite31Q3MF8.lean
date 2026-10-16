import MarkovThirdSmallCoeff31MF8
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
theorem sThird31finite3MF8 (j : ℤ) (h0 : 2≤j) (hN : j≤14) :
 sThird31EMF8 3 (j-1)*sThird31EMF8 3 (j+1) ≤ sThird31EMF8 3 j^2 := by
 interval_cases j <;> norm_num [sThird31EMF8,sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8,vFallM115]
end
end MathGKM.Markov
