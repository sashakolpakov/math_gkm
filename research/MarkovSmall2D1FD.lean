import MarkovSmallFactor2FD
/-! Machine-authored fd72158c: exact chamber gap certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem small_gap2_D1_0FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 0*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 0*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2=114932736 + 213634944*w + 165271920*w^2 + 68111712*w^3 + 15770736*w^4 + 1945152*w^5 + 99840*w^6 := by
  simp only [smallCoeff2FD,small2_0FD,small2_1FD,small2_2FD]
  ring
 have hp : 0 ≤ 114932736 + 213634944*w + 165271920*w^2 + 68111712*w^3 + 15770736*w^4 + 1945152*w^5 + 99840*w^6 := by positivity
 omega
theorem small_gap2_D1_1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 1*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3=749554560 + 1408380912*w + 1101412944*w^2 + 458846964*w^3 + 107389944*w^4 + 13386996*w^5 + 694368*w^6 := by
  simp only [smallCoeff2FD,small2_1FD,small2_2FD,small2_3FD]
  ring
 have hp : 0 ≤ 749554560 + 1408380912*w + 1101412944*w^2 + 458846964*w^3 + 107389944*w^4 + 13386996*w^5 + 694368*w^6 := by positivity
 omega
theorem small_gap2_D1_2FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 2*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4=1979606016 + 3807224640*w + 3052178100*w^2 + 1305730908*w^3 + 314443197*w^4 + 40424994*w^5 + 2168145*w^6 := by
  simp only [smallCoeff2FD,small2_2FD,small2_3FD,small2_4FD]
  ring
 have hp : 0 ≤ 1979606016 + 3807224640*w + 3052178100*w^2 + 1305730908*w^3 + 314443197*w^4 + 40424994*w^5 + 2168145*w^6 := by positivity
 omega
theorem small_gap2_D1_3FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 3*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5=2528729856 + 5047798608*w + 4210096032*w^2 + 1878588756*w^3 + 473161788*w^4 + 63808812*w^5 + 3601044*w^6 := by
  simp only [smallCoeff2FD,small2_3FD,small2_4FD,small2_5FD]
  ring
 have hp : 0 ≤ 2528729856 + 5047798608*w + 4210096032*w^2 + 1878588756*w^3 + 473161788*w^4 + 63808812*w^5 + 3601044*w^6 := by positivity
 omega
theorem small_gap2_D1_4FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 4*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6=1713034368 + 3588702624*w + 3146296944*w^2 + 1477980960*w^3 + 392437056*w^4 + 55856640*w^5 + 3330192*w^6 := by
  simp only [smallCoeff2FD,small2_4FD,small2_5FD,small2_6FD]
  ring
 have hp : 0 ≤ 1713034368 + 3588702624*w + 3146296944*w^2 + 1477980960*w^3 + 392437056*w^4 + 55856640*w^5 + 3330192*w^6 := by positivity
 omega
theorem small_gap2_D1_5FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 5*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7=644315904 + 1424128224*w + 1317905056*w^2 + 654128160*w^3 + 183758368*w^4 + 27711360*w^5 + 1753024*w^6 := by
  simp only [smallCoeff2FD,small2_5FD,small2_6FD,small2_7FD]
  ring
 have hp : 0 ≤ 644315904 + 1424128224*w + 1317905056*w^2 + 654128160*w^3 + 183758368*w^4 + 27711360*w^5 + 1753024*w^6 := by positivity
 omega
theorem small_gap2_D1_6FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 6*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8=138348288 + 321764352*w + 312806976*w^2 + 163005312*w^3 + 48072768*w^4 + 7612416*w^5 + 506112*w^6 := by
  simp only [smallCoeff2FD,small2_6FD,small2_7FD,small2_8FD]
  ring
 have hp : 0 ≤ 138348288 + 321764352*w + 312806976*w^2 + 163005312*w^3 + 48072768*w^4 + 7612416*w^5 + 506112*w^6 := by positivity
 omega
theorem small_gap2_D1_7FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 7*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9=17510400 + 42011520*w + 41841984*w^2 + 22171008*w^3 + 6600384*w^4 + 1050624*w^5 + 70656*w^6 := by
  simp only [smallCoeff2FD,small2_7FD,small2_8FD,small2_9FD]
  ring
 have hp : 0 ≤ 17510400 + 42011520*w + 41841984*w^2 + 22171008*w^3 + 6600384*w^4 + 1050624*w^5 + 70656*w^6 := by positivity
 omega
theorem small_gap2_D1_8FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 8*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10=1315584 + 3117312*w + 3018496*w^2 + 1520256*w^3 + 419584*w^4 + 61440*w^5 + 4096*w^6 := by
  simp only [smallCoeff2FD,small2_8FD,small2_9FD,small2_10FD]
  ring
 have hp : 0 ≤ 1315584 + 3117312*w + 3018496*w^2 + 1520256*w^3 + 419584*w^4 + 61440*w^5 + 4096*w^6 := by positivity
 omega
theorem small_gap2_D1_9FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11 ≤ (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 10)^2-smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 9*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) 11=50688 + 109824*w + 101184*w^2 + 44544*w^3 + 7680*w^4 := by
  simp only [smallCoeff2FD,small2_9FD,small2_10FD,small2_11FD]
  ring
 have hp : 0 ≤ 50688 + 109824*w + 101184*w^2 + 44544*w^3 + 7680*w^4 := by positivity
 omega
theorem small_chamber2_D1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w)
 (j : ℕ) (hj : j ≤ 9) :
 smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) j*smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) (j+2) ≤
 (smallCoeff2FD (4 + 1*w) (3 + 1*w) (2 + 1*w) (1) (1 + 1*w) (j+1))^2 := by
 interval_cases j
 · exact small_gap2_D1_0FD v w hv hw
 · exact small_gap2_D1_1FD v w hv hw
 · exact small_gap2_D1_2FD v w hv hw
 · exact small_gap2_D1_3FD v w hv hw
 · exact small_gap2_D1_4FD v w hv hw
 · exact small_gap2_D1_5FD v w hv hw
 · exact small_gap2_D1_6FD v w hv hw
 · exact small_gap2_D1_7FD v w hv hw
 · exact small_gap2_D1_8FD v w hv hw
 · exact small_gap2_D1_9FD v w hv hw
end
end MathGKM.Markov
