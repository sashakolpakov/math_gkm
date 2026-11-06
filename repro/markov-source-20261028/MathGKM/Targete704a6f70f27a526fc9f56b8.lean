import MathGKM.Accepted13c39de6e1dbb404698c5095
import MathGKM.Markov
def MathGKM.Targete704a6f70f27a526fc9f56b8.Interface :=
  (
    True
  )
def MathGKM.Targete704a6f70f27a526fc9f56b8.Transport (StudyInterface : MathGKM.Targete704a6f70f27a526fc9f56b8.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targete704a6f70f27a526fc9f56b8.Goal (StudyInterface : MathGKM.Targete704a6f70f27a526fc9f56b8.Interface) : Prop :=
  (
    ∀ path : List Bool, let f := MathGKM.Markov.frame path; ∀ E ∈ [f.lo,f.mid,f.hi], (∀ i j, i+j=E.a+E.b-1 → MathGKM.Markov.coeff E.p i j = ((E.a+E.b-1).choose i : ℤ))
  )
