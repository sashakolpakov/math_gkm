import MathGKM.Round79ConsumerA
import MathGKM.Accepted7444de3b0a95eefb7df0f208

/- Machine-authored round79 conditional WeakLC. -/
theorem CardinalityConsumerR79.conditional_weakLC :
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
    MathGKM.Markov.WeakLC E.a E.b E.p :=
by
  intro n hn hH hV
  obtain ⟨horiz, vert⟩ := CardinalityConsumerR79.original_directions n hn hH hV
  exact ⟨horiz, vert, Accepted7444de3b0a95eefb7df0f208.obligation (n-1)⟩

#print axioms CardinalityConsumerR79.conditional_weakLC
