import MarkovSmallFactor3FD
/-! Machine-authored fd72158c: exact chamber gap certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem small_gap3_A1_0FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 0*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 2 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 1)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 1)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 0*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 2=291707136 + 464675328*w + 307961748*w^2 + 108688224*w^3 + 21543504*w^4 + 2273856*w^5 + 99840*w^6 := by
  simp only [smallCoeff3FD,small3_0FD,small3_1FD,small3_2FD]
  ring
 have hp : 0 ≤ 291707136 + 464675328*w + 307961748*w^2 + 108688224*w^3 + 21543504*w^4 + 2273856*w^5 + 99840*w^6 := by positivity
 omega
theorem small_gap3_A1_1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 1*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 3 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 2)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 2)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 1*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 3=2075037696 + 3298203936*w + 2179765584*w^2 + 766670166*w^3 + 151348050*w^4 + 15899220*w^5 + 694368*w^6 := by
  simp only [smallCoeff3FD,small3_1FD,small3_2FD,small3_3FD]
  ring
 have hp : 0 ≤ 2075037696 + 3298203936*w + 2179765584*w^2 + 766670166*w^3 + 151348050*w^4 + 15899220*w^5 + 694368*w^6 := by positivity
 omega
theorem small_gap3_A1_2FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 2*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 4 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 3)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 3)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 2*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 4=6169688064 + 9878673600*w + 6578618220*w^2 + 2332248084*w^3 + 464235741*w^4 + 49193334*w^5 + 2168145*w^6 := by
  simp only [smallCoeff3FD,small3_2FD,small3_3FD,small3_4FD]
  ring
 have hp : 0 ≤ 6169688064 + 9878673600*w + 6578618220*w^2 + 2332248084*w^3 + 464235741*w^4 + 49193334*w^5 + 2168145*w^6 := by positivity
 omega
theorem small_gap3_A1_3FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 3*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 5 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 4)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 4)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 3*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 5=9345106944 + 15221985840*w + 10310310432*w^2 + 3715339428*w^3 + 750915756*w^4 + 80686476*w^5 + 3601044*w^6 := by
  simp only [smallCoeff3FD,small3_3FD,small3_4FD,small3_5FD]
  ring
 have hp : 0 ≤ 9345106944 + 15221985840*w + 10310310432*w^2 + 3715339428*w^3 + 750915756*w^4 + 80686476*w^5 + 3601044*w^6 := by positivity
 omega
theorem small_gap3_A1_4FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 4*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 6 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 5)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 5)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 4*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 6=8080997184 + 13449218976*w + 9280059552*w^2 + 3392371872*w^3 + 691988784*w^4 + 74642976*w^5 + 3330192*w^6 := by
  simp only [smallCoeff3FD,small3_4FD,small3_5FD,small3_6FD]
  ring
 have hp : 0 ≤ 8080997184 + 13449218976*w + 9280059552*w^2 + 3392371872*w^3 + 691988784*w^4 + 74642976*w^5 + 3330192*w^6 := by positivity
 omega
theorem small_gap3_A1_5FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 5*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 7 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 6)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 6)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 5*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 7=4258378368 + 7230882336*w + 5055175216*w^2 + 1855767360*w^3 + 376421296*w^4 + 40017024*w^5 + 1753024*w^6 := by
  simp only [smallCoeff3FD,small3_5FD,small3_6FD,small3_7FD]
  ring
 have hp : 0 ≤ 4258378368 + 7230882336*w + 5055175216*w^2 + 1855767360*w^3 + 376421296*w^4 + 40017024*w^5 + 1753024*w^6 := by positivity
 omega
theorem small_gap3_A1_6FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 6*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 8 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 7)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 7)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 6*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 8=1428265728 + 2464563936*w + 1725775392*w^2 + 623010528*w^3 + 121711392*w^4 + 12231168*w^5 + 506112*w^6 := by
  simp only [smallCoeff3FD,small3_6FD,small3_7FD,small3_8FD]
  ring
 have hp : 0 ≤ 1428265728 + 2464563936*w + 1725775392*w^2 + 623010528*w^3 + 121711392*w^4 + 12231168*w^5 + 506112*w^6 := by positivity
 omega
theorem small_gap3_A1_7FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 7*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 9 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 8)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 8)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 7*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 9=317327616 + 547833984*w + 372751680*w^2 + 126318720*w^3 + 22246848*w^4 + 1935360*w^5 + 70656*w^6 := by
  simp only [smallCoeff3FD,small3_7FD,small3_8FD,small3_9FD]
  ring
 have hp : 0 ≤ 317327616 + 547833984*w + 372751680*w^2 + 126318720*w^3 + 22246848*w^4 + 1935360*w^5 + 70656*w^6 := by positivity
 omega
theorem small_gap3_A1_8FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 8*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 10 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 9)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 9)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 8*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 10=47969280 + 79162752*w + 49224064*w^2 + 14488704*w^3 + 2083072*w^4 + 135168*w^5 + 4096*w^6 := by
  simp only [smallCoeff3FD,small3_8FD,small3_9FD,small3_10FD]
  ring
 have hp : 0 ≤ 47969280 + 79162752*w + 49224064*w^2 + 14488704*w^3 + 2083072*w^4 + 135168*w^5 + 4096*w^6 := by positivity
 omega
theorem small_gap3_A1_9FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 9*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 11 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 10)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 10)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 9*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 11=4822272 + 7002240*w + 3565248*w^2 + 763392*w^3 + 62976*w^4 := by
  simp only [smallCoeff3FD,small3_9FD,small3_10FD,small3_11FD]
  ring
 have hp : 0 ≤ 4822272 + 7002240*w + 3565248*w^2 + 763392*w^3 + 62976*w^4 := by positivity
 omega
theorem small_gap3_A1_10FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 10*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 12 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 11)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 11)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 10*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 12=271872 + 288000*w + 76608*w^2 := by
  simp only [smallCoeff3FD,small3_10FD,small3_11FD,small3_12FD]
  ring
 have hp : 0 ≤ 271872 + 288000*w + 76608*w^2 := by positivity
 omega
theorem small_gap3_A1_11FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 11*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 13 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 12)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 12)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 11*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 13=5184 := by
  simp only [smallCoeff3FD,small3_11FD,small3_12FD,small3_13FD]
  ring
 have hp : 0 ≤ 5184 := by positivity
 omega
theorem small_gap3_A1_12FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 12*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 14 ≤ (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 13)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 13)^2-smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 12*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) 14=0 := by
  simp only [smallCoeff3FD,small3_12FD,small3_13FD,small3_14FD]
  ring
 have hp : 0 ≤ 0 := by positivity
 omega
theorem small_chamber3_A1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w)
 (j : ℕ) (hj : j ≤ 12) :
 smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) j*smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) (j+2) ≤
 (smallCoeff3FD (4 + 1*w) (1) (0) (0) (0) (j+1))^2 := by
 interval_cases j
 · exact small_gap3_A1_0FD v w hv hw
 · exact small_gap3_A1_1FD v w hv hw
 · exact small_gap3_A1_2FD v w hv hw
 · exact small_gap3_A1_3FD v w hv hw
 · exact small_gap3_A1_4FD v w hv hw
 · exact small_gap3_A1_5FD v w hv hw
 · exact small_gap3_A1_6FD v w hv hw
 · exact small_gap3_A1_7FD v w hv hw
 · exact small_gap3_A1_8FD v w hv hw
 · exact small_gap3_A1_9FD v w hv hw
 · exact small_gap3_A1_10FD v w hv hw
 · exact small_gap3_A1_11FD v w hv hw
 · exact small_gap3_A1_12FD v w hv hw
end
end MathGKM.Markov
