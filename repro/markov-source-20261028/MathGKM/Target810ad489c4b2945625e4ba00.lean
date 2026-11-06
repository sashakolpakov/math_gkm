import MathGKM.Round38MixtureInterfaceA
import MathGKM.Markov
def MathGKM.Target810ad489c4b2945625e4ba00.Interface :=
  (
    True
  )
def MathGKM.Target810ad489c4b2945625e4ba00.Transport (StudyInterface : MathGKM.Target810ad489c4b2945625e4ba00.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target810ad489c4b2945625e4ba00.Goal (StudyInterface : MathGKM.Target810ad489c4b2945625e4ba00.Interface) : Prop :=
  (
    ∀ (a b : ℤ →₀ ℤ) (α β : ℕ),
      (∀ x, 0 ≤ a x) → (∀ x, 0 ≤ b x) →
      (∀ x, a x*a (x+2) ≤ a (x+1)^2) →
      (∀ x, b x*b (x+2) ≤ b (x+1)^2) →
      (∀ x, a x*b (x+2) ≤ a (x+1)*b (x+1) ∧
        b x*a (x+2) ≤ a (x+1)*b (x+1)) →
      ∀ x, ((α : ℤ)*a x+(β : ℤ)*b x)*((α : ℤ)*a (x+2)+(β : ℤ)*b (x+2)) ≤
        ((α : ℤ)*a (x+1)+(β : ℤ)*b (x+1))^2
  )
