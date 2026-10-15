import MarkovSmallFactor3FD
/-! Machine-authored fd72158c: exact chamber gap certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem small_gap3_D1_0FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 0*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 0*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2=653889024 + 1158078816*w + 853950000*w^2 + 335575410*w^3 + 74118750*w^4 + 8724000*w^5 + 427500*w^6 := by
  simp only [smallCoeff3FD,small3_0FD,small3_1FD,small3_2FD]
  ring
 have hp : 0 ≤ 653889024 + 1158078816*w + 853950000*w^2 + 335575410*w^3 + 74118750*w^4 + 8724000*w^5 + 427500*w^6 := by positivity
 omega
theorem small_gap3_D1_1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3=4969638144 + 8861961024*w + 6579005436*w^2 + 2602643040*w^3 + 578635704*w^4 + 68548320*w^5 + 3380400*w^6 := by
  simp only [smallCoeff3FD,small3_1FD,small3_2FD,small3_3FD]
  ring
 have hp : 0 ≤ 4969638144 + 8861961024*w + 6579005436*w^2 + 2602643040*w^3 + 578635704*w^4 + 68548320*w^5 + 3380400*w^6 := by positivity
 omega
theorem small_gap3_D1_2FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4=16032904704 + 29031480576*w + 21890433816*w^2 + 8797406400*w^3 + 1987342056*w^4 + 239257584*w^5 + 11992464*w^6 := by
  simp only [smallCoeff3FD,small3_2FD,small3_3FD,small3_4FD]
  ring
 have hp : 0 ≤ 16032904704 + 29031480576*w + 21890433816*w^2 + 8797406400*w^3 + 1987342056*w^4 + 239257584*w^5 + 11992464*w^6 := by positivity
 omega
theorem small_gap3_D1_3FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5=27207189504 + 50674586112*w + 39350463696*w^2 + 16307496576*w^3 + 3804116832*w^4 + 473660352*w^5 + 24596496*w^6 := by
  simp only [smallCoeff3FD,small3_3FD,small3_4FD,small3_5FD]
  ring
 have hp : 0 ≤ 27207189504 + 50674586112*w + 39350463696*w^2 + 16307496576*w^3 + 3804116832*w^4 + 473660352*w^5 + 24596496*w^6 := by positivity
 omega
theorem small_gap3_D1_4FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6=27995558400 + 54393719616*w + 44144398656*w^2 + 19156704768*w^3 + 4688881344*w^4 + 613869120*w^5 + 33591168*w^6 := by
  simp only [smallCoeff3FD,small3_4FD,small3_5FD,small3_6FD]
  ring
 have hp : 0 ≤ 27995558400 + 54393719616*w + 44144398656*w^2 + 19156704768*w^3 + 4688881344*w^4 + 613869120*w^5 + 33591168*w^6 := by positivity
 omega
theorem small_gap3_D1_5FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7=18984220416 + 38791866240*w + 33139489536*w^2 + 15148927872*w^3 + 3908136960*w^4 + 539520768*w^5 + 31140864*w^6 := by
  simp only [smallCoeff3FD,small3_5FD,small3_6FD,small3_7FD]
  ring
 have hp : 0 ≤ 18984220416 + 38791866240*w + 33139489536*w^2 + 15148927872*w^3 + 3908136960*w^4 + 539520768*w^5 + 31140864*w^6 := by positivity
 omega
theorem small_gap3_D1_6FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8=8792489664 + 18938884608*w + 17045525376*w^2 + 8203466880*w^3 + 2226429504*w^4 + 323096832*w^5 + 19588608*w^6 := by
  simp only [smallCoeff3FD,small3_6FD,small3_7FD,small3_8FD]
  ring
 have hp : 0 ≤ 8792489664 + 18938884608*w + 17045525376*w^2 + 8203466880*w^3 + 2226429504*w^4 + 323096832*w^5 + 19588608*w^6 := by positivity
 omega
theorem small_gap3_D1_7FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9=2860217856 + 6499423488*w + 6163157568*w^2 + 3123426432*w^3 + 892724544*w^4 + 136501248*w^5 + 8726784*w^6 := by
  simp only [smallCoeff3FD,small3_7FD,small3_8FD,small3_9FD]
  ring
 have hp : 0 ≤ 2860217856 + 6499423488*w + 6163157568*w^2 + 3123426432*w^3 + 892724544*w^4 + 136501248*w^5 + 8726784*w^6 := by positivity
 omega
theorem small_gap3_D1_8FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10=677889792 + 1611513984*w + 1594852672*w^2 + 842602368*w^3 + 250992832*w^4 + 40005120*w^5 + 2667520*w^6 := by
  simp only [smallCoeff3FD,small3_8FD,small3_9FD,small3_10FD]
  ring
 have hp : 0 ≤ 677889792 + 1611513984*w + 1594852672*w^2 + 842602368*w^3 + 250992832*w^4 + 40005120*w^5 + 2667520*w^6 := by positivity
 omega
theorem small_gap3_D1_9FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11=119752704 + 290102400*w + 291583488*w^2 + 155913984*w^3 + 46844928*w^4 + 7511040*w^5 + 503808*w^6 := by
  simp only [smallCoeff3FD,small3_9FD,small3_10FD,small3_11FD]
  ring
 have hp : 0 ≤ 119752704 + 290102400*w + 291583488*w^2 + 155913984*w^3 + 46844928*w^4 + 7511040*w^5 + 503808*w^6 := by positivity
 omega
theorem small_gap3_D1_10FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 12 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 12=15489792 + 37190784*w + 36972480*w^2 + 19511040*w^3 + 5778432*w^4 + 915456*w^5 + 61440*w^6 := by
  simp only [smallCoeff3FD,small3_10FD,small3_11FD,small3_12FD]
  ring
 have hp : 0 ≤ 15489792 + 37190784*w + 36972480*w^2 + 19511040*w^3 + 5778432*w^4 + 915456*w^5 + 61440*w^6 := by positivity
 omega
theorem small_gap3_D1_11FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 13 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 12)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 12)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 13=1285632 + 3025152*w + 2922304*w^2 + 1477632*w^3 + 412672*w^4 + 61440*w^5 + 4096*w^6 := by
  simp only [smallCoeff3FD,small3_11FD,small3_12FD,small3_13FD]
  ring
 have hp : 0 ≤ 1285632 + 3025152*w + 2922304*w^2 + 1477632*w^3 + 412672*w^4 + 61440*w^5 + 4096*w^6 := by positivity
 omega
theorem small_gap3_D1_12FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 12*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 14 ≤ (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 13)^2 := by
 have he : (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 13)^2-smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 12*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 14=50688 + 109824*w + 101184*w^2 + 44544*w^3 + 7680*w^4 := by
  simp only [smallCoeff3FD,small3_12FD,small3_13FD,small3_14FD]
  ring
 have hp : 0 ≤ 50688 + 109824*w + 101184*w^2 + 44544*w^3 + 7680*w^4 := by positivity
 omega
theorem small_chamber3_D1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w)
 (j : ℕ) (hj : j ≤ 12) :
 smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) j*smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) (j+2) ≤
 (smallCoeff3FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) (j+1))^2 := by
 interval_cases j
 · exact small_gap3_D1_0FD v w hv hw
 · exact small_gap3_D1_1FD v w hv hw
 · exact small_gap3_D1_2FD v w hv hw
 · exact small_gap3_D1_3FD v w hv hw
 · exact small_gap3_D1_4FD v w hv hw
 · exact small_gap3_D1_5FD v w hv hw
 · exact small_gap3_D1_6FD v w hv hw
 · exact small_gap3_D1_7FD v w hv hw
 · exact small_gap3_D1_8FD v w hv hw
 · exact small_gap3_D1_9FD v w hv hw
 · exact small_gap3_D1_10FD v w hv hw
 · exact small_gap3_D1_11FD v w hv hw
 · exact small_gap3_D1_12FD v w hv hw
end
end MathGKM.Markov
