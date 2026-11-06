import MathGKM.Round9Faces
import MathGKM.Markov
def MathGKM.Targete2ebb9631e504664d8198c86.Interface :=
  (
    True
  )
def MathGKM.Targete2ebb9631e504664d8198c86.Transport (StudyInterface : MathGKM.Targete2ebb9631e504664d8198c86.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targete2ebb9631e504664d8198c86.Goal (StudyInterface : MathGKM.Targete2ebb9631e504664d8198c86.Interface) : Prop :=
  (
    MathGKM.Markov.WeakLC 0 1 1 ∧ MathGKM.Markov.WeakLC 1 1 (MathGKM.Markov.U+MathGKM.Markov.V) ∧ ∀ path : List Bool, let f := MathGKM.Markov.frame path; ∀ E ∈ [f.lo,f.mid,f.hi], (∀ i, MathGKM.Markov.InPolygon E.a E.b i 0 → MathGKM.Markov.InPolygon E.a E.b (i+1) 0 → MathGKM.Markov.InPolygon E.a E.b (i+2) 0 → MathGKM.Markov.coeff E.p i 0*MathGKM.Markov.coeff E.p (i+2) 0 ≤ MathGKM.Markov.coeff E.p (i+1) 0^2) ∧ (∀ j, MathGKM.Markov.InPolygon E.a E.b 0 j → MathGKM.Markov.InPolygon E.a E.b 0 (j+1) → MathGKM.Markov.InPolygon E.a E.b 0 (j+2) → MathGKM.Markov.coeff E.p 0 j*MathGKM.Markov.coeff E.p 0 (j+2) ≤ MathGKM.Markov.coeff E.p 0 (j+1)^2) ∧ (∀ i j, i+j+2=E.a+E.b-1 → MathGKM.Markov.InPolygon E.a E.b i (j+2) → MathGKM.Markov.InPolygon E.a E.b (i+1) (j+1) → MathGKM.Markov.InPolygon E.a E.b (i+2) j → MathGKM.Markov.coeff E.p i (j+2)*MathGKM.Markov.coeff E.p (i+2) j ≤ MathGKM.Markov.coeff E.p (i+1) (j+1)^2)
  )
