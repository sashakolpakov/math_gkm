import MathGKM.Round52RowA
import MathGKM.Markov
def MathGKM.Targeta8c44b5d4bf223487eed81d2.Interface :=
  (
    True
  )
def MathGKM.Targeta8c44b5d4bf223487eed81d2.Transport (StudyInterface : MathGKM.Targeta8c44b5d4bf223487eed81d2.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targeta8c44b5d4bf223487eed81d2.Goal (StudyInterface : MathGKM.Targeta8c44b5d4bf223487eed81d2.Interface) : Prop :=
  (
    ∀ (n : ℕ), 1≤n →
      (∀ j, RealRowR52.Factorized (RealRowR52.realRow
        (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p j)) →
      let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
      ∀ i j, MathGKM.Markov.InPolygon E.a E.b i j →
        MathGKM.Markov.InPolygon E.a E.b (i+1) j →
        MathGKM.Markov.InPolygon E.a E.b (i+2) j →
        MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j≤
          MathGKM.Markov.coeff E.p (i+1) j^2
  )
