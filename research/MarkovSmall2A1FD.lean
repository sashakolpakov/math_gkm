import MarkovSmallFactor2FD
/-! Machine-authored fd72158c: exact chamber gap certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem small_gap2_A1_0FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 0*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 2 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 1)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 1)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 0*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 2=38240640 + 62201232*w + 42045552*w^2 + 15117192*w^3 + 3049002*w^4 + 327078*w^5 + 14580*w^6 := by
  simp only [smallCoeff2FD,small2_0FD,small2_1FD,small2_2FD]
  ring
 have hp : 0 ≤ 38240640 + 62201232*w + 42045552*w^2 + 15117192*w^3 + 3049002*w^4 + 327078*w^5 + 14580*w^6 := by positivity
 omega
theorem small_gap2_A1_1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 1*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 3 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 2)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 2)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 1*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 3=221301504 + 358422912*w + 241095744*w^2 + 86212800*w^3 + 17285940*w^4 + 1842912*w^5 + 81648*w^6 := by
  simp only [smallCoeff2FD,small2_1FD,small2_2FD,small2_3FD]
  ring
 have hp : 0 ≤ 221301504 + 358422912*w + 241095744*w^2 + 86212800*w^3 + 17285940*w^4 + 1842912*w^5 + 81648*w^6 := by positivity
 omega
theorem small_gap2_A1_2FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 2*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 4 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 3)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 3)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 2*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 4=491357376 + 794418048*w + 532017792*w^2 + 188776944*w^3 + 37418256*w^4 + 3929472*w^5 + 171072*w^6 := by
  simp only [smallCoeff2FD,small2_2FD,small2_3FD,small2_4FD]
  ring
 have hp : 0 ≤ 491357376 + 794418048*w + 532017792*w^2 + 188776944*w^3 + 37418256*w^4 + 3929472*w^5 + 171072*w^6 := by positivity
 omega
theorem small_gap2_A1_3FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 3*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 5 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 4)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 4)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 3*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 5=483358464 + 778055616*w + 515060352*w^2 + 179037504*w^3 + 34418880*w^4 + 3475008*w^5 + 145152*w^6 := by
  simp only [smallCoeff2FD,small2_3FD,small2_4FD,small2_5FD]
  ring
 have hp : 0 ≤ 483358464 + 778055616*w + 515060352*w^2 + 179037504*w^3 + 34418880*w^4 + 3475008*w^5 + 145152*w^6 := by positivity
 omega
theorem small_gap2_A1_4FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 4*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 6 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 5)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 5)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 4*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 6=223906176 + 355768128*w + 228590400*w^2 + 75398976*w^3 + 13382592*w^4 + 1216512*w^5 + 46080*w^6 := by
  simp only [smallCoeff2FD,small2_4FD,small2_5FD,small2_6FD]
  ring
 have hp : 0 ≤ 223906176 + 355768128*w + 228590400*w^2 + 75398976*w^3 + 13382592*w^4 + 1216512*w^5 + 46080*w^6 := by positivity
 omega
theorem small_gap2_A1_5FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 5*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 7 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 6)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 6)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 5*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 7=50029632 + 76761024*w + 45782272*w^2 + 13304448*w^3 + 1936384*w^4 + 132096*w^5 + 4096*w^6 := by
  simp only [smallCoeff2FD,small2_5FD,small2_6FD,small2_7FD]
  ring
 have hp : 0 ≤ 50029632 + 76761024*w + 45782272*w^2 + 13304448*w^3 + 1936384*w^4 + 132096*w^5 + 4096*w^6 := by positivity
 omega
theorem small_gap2_A1_6FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 6*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 8 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 7)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 7)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 6*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 8=5437440 + 7582848*w + 3736896*w^2 + 782976*w^3 + 62976*w^4 := by
  simp only [smallCoeff2FD,small2_6FD,small2_7FD,small2_8FD]
  ring
 have hp : 0 ≤ 5437440 + 7582848*w + 3736896*w^2 + 782976*w^3 + 62976*w^4 := by positivity
 omega
theorem small_gap2_A1_7FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 7*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 9 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 8)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 8)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 7*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 9=278784 + 294912*w + 76608*w^2 := by
  simp only [smallCoeff2FD,small2_7FD,small2_8FD,small2_9FD]
  ring
 have hp : 0 ≤ 278784 + 294912*w + 76608*w^2 := by positivity
 omega
theorem small_gap2_A1_8FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 8*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 10 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 9)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 9)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 8*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 10=5184 := by
  simp only [smallCoeff2FD,small2_8FD,small2_9FD,small2_10FD]
  ring
 have hp : 0 ≤ 5184 := by positivity
 omega
theorem small_gap2_A1_9FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 9*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 11 ≤ (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 10)^2 := by
 have he : (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 10)^2-smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 9*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) 11=0 := by
  simp only [smallCoeff2FD,small2_9FD,small2_10FD,small2_11FD]
  ring
 have hp : 0 ≤ 0 := by positivity
 omega
theorem small_chamber2_A1FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w)
 (j : ℕ) (hj : j ≤ 9) :
 smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) j*smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) (j+2) ≤
 (smallCoeff2FD (4 + 1*w) (1) (0) (0) (0) (j+1))^2 := by
 interval_cases j
 · exact small_gap2_A1_0FD v w hv hw
 · exact small_gap2_A1_1FD v w hv hw
 · exact small_gap2_A1_2FD v w hv hw
 · exact small_gap2_A1_3FD v w hv hw
 · exact small_gap2_A1_4FD v w hv hw
 · exact small_gap2_A1_5FD v w hv hw
 · exact small_gap2_A1_6FD v w hv hw
 · exact small_gap2_A1_7FD v w hv hw
 · exact small_gap2_A1_8FD v w hv hw
 · exact small_gap2_A1_9FD v w hv hw
end
end MathGKM.Markov
