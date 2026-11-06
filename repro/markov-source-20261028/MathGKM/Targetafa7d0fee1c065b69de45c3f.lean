import MathGKM.Round34DiagonalA
import MathGKM.Markov
def MathGKM.Targetafa7d0fee1c065b69de45c3f.Interface :=
  (
    True
  )
def MathGKM.Targetafa7d0fee1c065b69de45c3f.Transport (StudyInterface : MathGKM.Targetafa7d0fee1c065b69de45c3f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetafa7d0fee1c065b69de45c3f.Goal (StudyInterface : MathGKM.Targetafa7d0fee1c065b69de45c3f.Interface) : Prop :=
  (
    ∀ k : ℕ,
        let E := (MathGKM.Markov.frame (List.replicate k true)).mid
        ∀ i j : ℕ,
          MathGKM.Markov.InPolygon E.a E.b i (j+2) →
          MathGKM.Markov.InPolygon E.a E.b (i+1) (j+1) →
          MathGKM.Markov.InPolygon E.a E.b (i+2) j →
          MathGKM.Markov.coeff E.p i (j+2)*MathGKM.Markov.coeff E.p (i+2) j≤
            MathGKM.Markov.coeff E.p (i+1) (j+1)^2
  )
