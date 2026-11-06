import MathGKM.Accepted80d920c418f583b0badf1f52
import MathGKM.Acceptedb63003712f84c5edfae19488

/- Machine-authored round79 conditional consumer. Both full-fiber comparisons remain assumptions. -/
theorem CardinalityConsumerR79.original_directions :
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
      MathGKM.Markov.InPolygon E.a E.b i (j+2) → MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2)≤MathGKM.Markov.coeff E.p i (j+1)^2) :=
by
  intro n hn hH hV
  apply Acceptedb63003712f84c5edfae19488.obligation.2 n hn
  · intro i j hp0 hp1 hp2 a b
    exact (Accepted80d920c418f583b0badf1f52.obligation.2 (2*n) 0 i j a b).mpr
      (hH i j hp0 hp1 hp2 a b)
  · intro i j hp0 hp1 hp2 a b
    exact (Accepted80d920c418f583b0badf1f52.obligation.2 (2*n) 1 j i a b).mpr
      (hV i j hp0 hp1 hp2 a b)

#print axioms CardinalityConsumerR79.original_directions
