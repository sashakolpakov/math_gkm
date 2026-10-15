import MarkovSecondParts07F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem second_gap_9_nonneg07F1 (t u v : ℤ) (ht : 0 ≤ t) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 0 ≤ secondGap907F1 t u v := by
 have he : secondGap907F1 t u v=0 := by
   unfold secondGap907F1 secondL407F1 secondL507F1 secondC407F1 secondC507F1 secondR407F1 secondR507F1
   ring
 rw [he]
 positivity
end
end MathGKM.Markov
