import MathGKM.Accepted2daf99e453e96324edca0dcf
import MathGKM.Accepted4b3e8f6038531f10e4cbc50a

/- Machine-authored round91: exact positive-alpha conditional consumer. -/
theorem SparseConsumerR91.positive_weakLC :
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
    MathGKM.Markov.WeakLC E.a E.b E.p :=
by
  intro n hn hH hV
  apply Accepted4b3e8f6038531f10e4cbc50a.obligation n hn
  · intro i j hp0 hp1 hp2 a b
    by_cases ha : a=0
    · subst a
      exact (Accepted2daf99e453e96324edca0dcf.obligation n i j b).1
    · exact hH i j hp0 hp1 hp2 a b (by omega)
  · intro i j hp0 hp1 hp2 a b
    by_cases ha : a=0
    · subst a
      exact (Accepted2daf99e453e96324edca0dcf.obligation n i j b).2
    · exact hV i j hp0 hp1 hp2 a b (by omega)

#print axioms SparseConsumerR91.positive_weakLC
