import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn2M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then 96 else 72
theorem source_third_column2M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 2 (thirdJM964 d r):ℚ)=thirdColumn2M964 d r := by
 rw [source_third_lowM964 d 2 r (by omega)]
 cases r <;> norm_num [thirdColumn2M964,thirdCM964]

end
end MathGKM.Markov
