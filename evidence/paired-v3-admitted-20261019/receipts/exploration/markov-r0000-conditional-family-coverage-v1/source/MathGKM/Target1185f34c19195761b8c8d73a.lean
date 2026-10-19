import MathGKM.MarkovRecurrence
import MathGKM.Markov
def MathGKM.Target1185f34c19195761b8c8d73a.Interface :=
  (
    True
  )
def MathGKM.Target1185f34c19195761b8c8d73a.Transport (StudyInterface : MathGKM.Target1185f34c19195761b8c8d73a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target1185f34c19195761b8c8d73a.Goal (StudyInterface : MathGKM.Target1185f34c19195761b8c8d73a.Interface) : Prop :=
  (
    ∀ Q : ℕ → ℕ → MathGKM.Markov.BiPoly, Q 0 1 = 1 → Q 1 1 = MathGKM.Markov.U + MathGKM.Markov.V → Q 1 2 = (MathGKM.Markov.U + MathGKM.Markov.V)^2 + MathGKM.Markov.U → MathGKM.Markov.FareyNumeratorRecurrence Q → ∀ a b : ℕ, 0 < a → a ≤ b → Nat.Coprime a b → ((a = 1 ∧ b = 1) ∧ Q a b = MathGKM.Markov.U + MathGKM.Markov.V) ∨ ∃ path : List Bool, (MathGKM.Markov.frame path).mid.a = a ∧ (MathGKM.Markov.frame path).mid.b = b ∧ Q a b = (MathGKM.Markov.frame path).mid.p
  )
