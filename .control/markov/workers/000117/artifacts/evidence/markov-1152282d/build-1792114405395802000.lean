import MarkovThirdRegionsM115
/-! Machine-authored 1152282d. Explicit all-run gap/support predicate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

def vAllBoundsM115 (a b c d e : ℤ) : Prop := ∀ q : ℤ, 5 ≤ q →
 (∀ j, vEM115 a b c d e q (j-1)*vEM115 a b c d e q (j+1) ≤ vEM115 a b c d e q j^2) ∧
 (∀ j, 3 ≤ j → j ≤ 3*q+6 → 0 < vEM115 a b c d e q j)
end
end MathGKM.Markov
