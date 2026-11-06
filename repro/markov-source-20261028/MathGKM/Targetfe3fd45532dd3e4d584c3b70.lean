import MathGKM.Round61FiniteA
import MathGKM.Markov
def MathGKM.Targetfe3fd45532dd3e4d584c3b70.Interface :=
  (
    True
  )
def MathGKM.Targetfe3fd45532dd3e4d584c3b70.Transport (StudyInterface : MathGKM.Targetfe3fd45532dd3e4d584c3b70.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetfe3fd45532dd3e4d584c3b70.Goal (StudyInterface : MathGKM.Targetfe3fd45532dd3e4d584c3b70.Interface) : Prop :=
  (
    (∀ (N : ℕ) (M : Finset ℕ), FiniteMatchingR61.Match N M → 2*M.card ≤ N) ∧
    (∀ (n : ℕ) (M : Finset ℕ), FiniteMatchingR61.Match (n+2) M ↔
      (FiniteMatchingR61.Match (n+1) M ∧ n ∉ M) ∨
      (FiniteMatchingR61.Match n (M.erase n) ∧ n ∈ M)) ∧
    (∀ (R : Type) [CommRing R] (t : R) (c : ℕ → R),
      FiniteMatchingR61.finiteSum t c 0=1 ∧ FiniteMatchingR61.finiteSum t c 1=t)
  )
