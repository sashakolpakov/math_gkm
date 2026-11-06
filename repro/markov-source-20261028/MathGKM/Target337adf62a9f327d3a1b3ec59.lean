import MathGKM.Round10Support
import MathGKM.Markov
def MathGKM.Target337adf62a9f327d3a1b3ec59.Interface :=
  (
    True
  )
def MathGKM.Target337adf62a9f327d3a1b3ec59.Transport (StudyInterface : MathGKM.Target337adf62a9f327d3a1b3ec59.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target337adf62a9f327d3a1b3ec59.Goal (StudyInterface : MathGKM.Target337adf62a9f327d3a1b3ec59.Interface) : Prop :=
  (
    ∀ path : List Bool, let f := MathGKM.Markov.frame path; ∀ E ∈ [f.lo,f.mid,f.hi], ∀ i j, ¬MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.coeff E.p i j=0
  )
