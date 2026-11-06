import MathGKM.Round79ConsumerA
import MathGKM.Markov
def MathGKM.Target6dc18506d8e4b8ed348b8a49.Interface :=
  (
    True
  )
def MathGKM.Target6dc18506d8e4b8ed348b8a49.Transport (StudyInterface : MathGKM.Target6dc18506d8e4b8ed348b8a49.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target6dc18506d8e4b8ed348b8a49.Goal (StudyInterface : MathGKM.Target6dc18506d8e4b8ed348b8a49.Interface) : Prop :=
  (
    ∀ (n : ℕ) (hn : 1≤n)
        (hH : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j →
          ∀ a b, (PairConvolutionR78.P (2*n) 0 j (2*i+2) a b i).card ≤ (PairConvolutionR78.P (2*n) 0 j (2*i+2) a b (i+1)).card)
        (hV : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+1) →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+2) →
          ∀ a b, (PairConvolutionR78.P (2*n) 1 i (2*j+2) a b j).card ≤ (PairConvolutionR78.P (2*n) 1 i (2*j+2) a b (j+1)).card),
        let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b (i+1) j →
          MathGKM.Markov.InPolygon E.a E.b (i+2) j → MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j≤MathGKM.Markov.coeff E.p (i+1) j^2) ∧
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b i (j+1) →
          MathGKM.Markov.InPolygon E.a E.b i (j+2) → MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2)≤MathGKM.Markov.coeff E.p i (j+1)^2)
  )
