import MarkovHorizontalFourthSeedM511
/-! Machine-authored request 5110b3fa. Exact fourth horizontal seed certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false

def H4GoodM511 (a b q t u v w z : ℝ) : Prop :=
 H4BoundsM511 a b q t u v w z ∧
 h4c0M511 a b q t u v w z ≤ h4c1M511 a b q t u v w z ∧
 h4c1M511 a b q t u v w z ≤ h4c2M511 a b q t u v w z
end
end MathGKM.Markov
