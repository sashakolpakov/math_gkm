import MarkovTopThirdGapMEB6
/-! Machine-authored 80fb7777. Auxiliary real-parameter obstruction only.
These nonintegral parameters are not a source-family witness. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
set_option maxRecDepth 30000

theorem fractional_gap_exactM80F :
 topShortQMEB6 (1/2) (9/2) 6^2-
 topShortQMEB6 (1/2) (9/2) 5*topShortQMEB6 (1/2) (9/2) 7=
 -(522352793324732739191537:ℚ)/288230376151711744 := by
 norm_num [topShortQMEB6,sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]

theorem fractional_unrestricted_falseM80F :
 ¬(∀ x : ℚ, 0 ≤ x → ∀ i : ℕ,
 topShortQMEB6 x (x+4) i*topShortQMEB6 x (x+4) (i+2) ≤
 topShortQMEB6 x (x+4) (i+1)^2) := by
 intro h
 have hh := h (1/2) (by norm_num) 5
 norm_num only [show (1/2:ℚ)+4=9/2 by norm_num] at hh
 have he := fractional_gap_exactM80F
 linarith

end
end MathGKM.Markov
