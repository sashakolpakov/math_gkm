import MathGKM.Round91PositiveConsumerA
import MathGKM.Markov
def MathGKM.Target625905275377f8a2be3a04ec.Interface :=
  (
    True
  )
def MathGKM.Target625905275377f8a2be3a04ec.Transport (StudyInterface : MathGKM.Target625905275377f8a2be3a04ec.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target625905275377f8a2be3a04ec.Goal (StudyInterface : MathGKM.Target625905275377f8a2be3a04ec.Interface) : Prop :=
  (
    ∀ (n : ℕ) (hn : 1≤n)
        (hH : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j →
          ∀ a b, 1≤a → (PairConvolutionR78.P (2*n) 0 j (2*i+2) a b i).card ≤ (PairConvolutionR78.P (2*n) 0 j (2*i+2) a b (i+1)).card)
        (hV : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+1) →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+2) →
          ∀ a b, 1≤a → (PairConvolutionR78.P (2*n) 1 i (2*j+2) a b j).card ≤ (PairConvolutionR78.P (2*n) 1 i (2*j+2) a b (j+1)).card),
        let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
        MathGKM.Markov.WeakLC E.a E.b E.p
  )
