import MathGKM.Round72ParityKernelA
import MathGKM.Markov
def MathGKM.Target96f7bc3772cbf20bc091439a.Interface :=
  (
    True
  )
def MathGKM.Target96f7bc3772cbf20bc091439a.Transport (StudyInterface : MathGKM.Target96f7bc3772cbf20bc091439a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target96f7bc3772cbf20bc091439a.Goal (StudyInterface : MathGKM.Target96f7bc3772cbf20bc091439a.Interface) : Prop :=
  (
    (∀ (N sigma i j : ℕ) (p : ℤ), 0 ≤ ParityKernelR72.K N sigma i j p) ∧
    (∀ (N sigma i j : ℕ) (p : ℤ), p < 0 → ParityKernelR72.K N sigma i j p = 0) ∧
    (∀ (N sigma i j : ℕ) (p : ℤ), (N : ℤ) < p → ParityKernelR72.K N sigma i j p = 0) ∧
    (∀ (N sigma i j : ℕ) (p : ℤ), N < i+j → ParityKernelR72.K N sigma i j p = 0)
  )
