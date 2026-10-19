import MathGKM.MarkovTripleTransport
import MathGKM.Markov
def MathGKM.Target4fe3181ffc85917dc2486060.Interface :=
  (
    True
  )
def MathGKM.Target4fe3181ffc85917dc2486060.Transport (StudyInterface : MathGKM.Target4fe3181ffc85917dc2486060.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target4fe3181ffc85917dc2486060.Goal (StudyInterface : MathGKM.Target4fe3181ffc85917dc2486060.Interface) : Prop :=
  (
    (∀ d i j, i+j≤d → MathGKM.Markov.latticeIndex d i j = ![((d-i-j:ℕ):ℤ),i,j]) ∧
        (∀ d i j,
          MathGKM.Markov.latticeIndex d (i+1) j = MathGKM.Markov.latticeIndex d i j + ![-1,1,0] ∧
          MathGKM.Markov.latticeIndex d i (j+1) = MathGKM.Markov.latticeIndex d i j + ![-1,0,1] ∧
          MathGKM.Markov.latticeIndex d (i+1) j = MathGKM.Markov.latticeIndex d i (j+1) + ![0,1,-1]) ∧
        (∀ a b P, MathGKM.Markov.SupportBound P (a+b-1) →
          (MathGKM.Markov.WeakLC a b P ↔ MathGKM.Markov.TriWeakLC a b (MathGKM.Markov.homogeneousLift P (a+b-1)))) ∧
        (∀ i j, MathGKM.Markov.InPolygon 0 1 i j ↔ i=0 ∧ j=0) ∧
        (∀ i j, MathGKM.Markov.InPolygon 1 1 i j ↔ i+j=1) ∧
        MathGKM.Markov.WeakLC 0 1 1 ∧ MathGKM.Markov.WeakLC 1 1 (MathGKM.Markov.U+MathGKM.Markov.V)
  )
