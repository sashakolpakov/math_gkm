import MathGKM.IntervalBridgeR0000
import MathGKM.GaussianQuotient
def MathGKM.Target5b937df8f25c060df43e0388.Interface :=
  (
    True
  )
def MathGKM.Target5b937df8f25c060df43e0388.Transport (StudyInterface : MathGKM.Target5b937df8f25c060df43e0388.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5b937df8f25c060df43e0388.Goal (StudyInterface : MathGKM.Target5b937df8f25c060df43e0388.Interface) : Prop :=
  (
    (∀ n k l : ℕ, l ≤ k → k ≤ n → MathGKM.GaussianQuotient.B n k / MathGKM.GaussianQuotient.B n l = MathGKM.GaussianQuotient.IntervalBridgeR0000.F l (n-k) (k-l)) ∧ (∀ a b r : ℕ, a+r ≤ b → a ≤ a+r ∧ a+r ≤ a+b+r ∧ 2*(a+r) ≤ a+b+r ∧ MathGKM.GaussianQuotient.B (a+b+r) (a+r) / MathGKM.GaussianQuotient.B (a+b+r) a = MathGKM.GaussianQuotient.IntervalBridgeR0000.F a b r)
  )
