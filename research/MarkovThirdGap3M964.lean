import MarkovThirdColumn3M964
import MarkovThirdColumn4M964
import MarkovThirdColumn5M964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdGap3M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (2927748217+x*((997978685041/210)+x*((616003327164101/176400)+x*((38877195231493/25200)+x*((416358051691679/907200)+x*((11058608964523/113400)+x*((231330428891/15120)+x*((204574429463/113400)+x*((510896203697/3175200)+x*((204442339/18900)+x*((490079311/907200)+x*((1103203/56700)+x*((144643/302400)+x*((233/32400)+x*(317/6350400))))))))))))))) else (768206884+x*((144823096141/105)+x*((24684456264799/22050)+x*((10310985087029/18900)+x*((1622328732155/9072)+x*((1355339789413/32400)+x*((34656905981/4800)+x*((30330437987/32400)+x*((11655697301/127008)+x*((170827507/25200)+x*((84339361/226800)+x*((476549/32400)+x*((343/864)+x*((743/113400)+x*(317/6350400)))))))))))))))
theorem third_gap_identity3M964 (x : ℚ) (r : Bool) :
 thirdColumn4M964 x r^2-thirdColumn3M964 x r*thirdColumn5M964 x r=thirdGap3M964 x r := by
 cases r <;> simp only [thirdColumn3M964,thirdColumn4M964,thirdColumn5M964,
   thirdGap3M964,Bool.false_eq_true,if_false,if_true] <;> ring
theorem third_gap_nonneg3M964 (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ thirdGap3M964 x r := by
 cases r <;> simp only [thirdGap3M964,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_third_horizontal3M964 (d : ℕ) (r : Bool) :
 threeRawM9E2 (thirdQM964 d r) r 3 (thirdJM964 d r)*
 threeRawM9E2 (thirdQM964 d r) r 5 (thirdJM964 d r) ≤
 threeRawM9E2 (thirdQM964 d r) r 4 (thirdJM964 d r)^2 := by
 have h : (threeRawM9E2 (thirdQM964 d r) r 3 (thirdJM964 d r):ℚ)*
     (threeRawM9E2 (thirdQM964 d r) r 5 (thirdJM964 d r):ℚ) ≤
     (threeRawM9E2 (thirdQM964 d r) r 4 (thirdJM964 d r):ℚ)^2 := by
   rw [source_third_column3M964,source_third_column4M964,source_third_column5M964]
   have he := third_gap_identity3M964 (d:ℚ) r
   have hp := third_gap_nonneg3M964 (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h
end
end MathGKM.Markov
