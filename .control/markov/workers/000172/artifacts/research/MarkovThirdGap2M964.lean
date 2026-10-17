import MarkovThirdColumn2M964
import MarkovThirdColumn3M964
import MarkovThirdColumn4M964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdGap2M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (23299696+x*((2377580392/105)+x*((2168850784/225)+x*((108092348/45)+x*((1956801/5)+x*((653908/15)+x*((755872/225)+x*((18538/105)+x*((121/20)+x*((11/90)+x*(1/900))))))))))) else (8999001+x*((337064199/35)+x*((4057470481/900)+x*((55564108/45)+x*((663380/3)+x*((135398/5)+x*((1032659/450)+x*((13928/105)+x*(5+x*((1/9)+x*(1/900)))))))))))
theorem third_gap_identity2M964 (x : ℚ) (r : Bool) :
 thirdColumn3M964 x r^2-thirdColumn2M964 x r*thirdColumn4M964 x r=thirdGap2M964 x r := by
 cases r <;> simp only [thirdColumn2M964,thirdColumn3M964,thirdColumn4M964,
   thirdGap2M964,Bool.false_eq_true,if_false,if_true] <;> ring
theorem third_gap_nonneg2M964 (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ thirdGap2M964 x r := by
 cases r <;> simp only [thirdGap2M964,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_third_horizontal2M964 (d : ℕ) (r : Bool) :
 threeRawM9E2 (thirdQM964 d r) r 2 (thirdJM964 d r)*
 threeRawM9E2 (thirdQM964 d r) r 4 (thirdJM964 d r) ≤
 threeRawM9E2 (thirdQM964 d r) r 3 (thirdJM964 d r)^2 := by
 have h : (threeRawM9E2 (thirdQM964 d r) r 2 (thirdJM964 d r):ℚ)*
     (threeRawM9E2 (thirdQM964 d r) r 4 (thirdJM964 d r):ℚ) ≤
     (threeRawM9E2 (thirdQM964 d r) r 3 (thirdJM964 d r):ℚ)^2 := by
   rw [source_third_column2M964,source_third_column3M964,source_third_column4M964]
   have he := third_gap_identity2M964 (d:ℚ) r
   have hp := third_gap_nonneg2M964 (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h
end
end MathGKM.Markov
