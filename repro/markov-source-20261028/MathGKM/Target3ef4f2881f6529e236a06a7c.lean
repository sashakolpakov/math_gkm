import MathGKM.Round62DeletionA
import MathGKM.Markov
def MathGKM.Target3ef4f2881f6529e236a06a7c.Interface :=
  (
    True
  )
def MathGKM.Target3ef4f2881f6529e236a06a7c.Transport (StudyInterface : MathGKM.Target3ef4f2881f6529e236a06a7c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3ef4f2881f6529e236a06a7c.Goal (StudyInterface : MathGKM.Target3ef4f2881f6529e236a06a7c.Interface) : Prop :=
  (
    ∀ (R : Type) [CommRing R] (t : R) (c : ℕ → R) (n : ℕ), FiniteMatchingR61.finiteSum t c (n+2) = t*FiniteMatchingR61.finiteSum t c (n+1)+c n*FiniteMatchingR61.finiteSum t c n
  )
