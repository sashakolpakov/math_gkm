import MathGKM.Round73EncodingA
import MathGKM.Markov
def MathGKM.Target6aa2c19a263f7b7d489494b1.Interface :=
  (
    True
  )
def MathGKM.Target6aa2c19a263f7b7d489494b1.Transport (StudyInterface : MathGKM.Target6aa2c19a263f7b7d489494b1.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target6aa2c19a263f7b7d489494b1.Goal (StudyInterface : MathGKM.Target6aa2c19a263f7b7d489494b1.Interface) : Prop :=
  (
    ∀ N sigma i j : ℕ, (∀ z : ℤ, KernelEncodingR73.E N sigma i j z = ParityKernelR72.K N sigma i j z) ∧ (KernelEncodingR73.E N sigma i j).support ⊆ Finset.Icc 0 (N : ℤ) ∧ MidpointMarginalR36.mass (KernelEncodingR73.E N sigma i j) = Finset.sum (Finset.range (N+1)) (fun a => ParityKernelR72.K N sigma i j (a : ℤ))
  )
