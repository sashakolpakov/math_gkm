import MathGKM.Round93CompensationA
import MathGKM.Round93SmallA
import MathGKM.Accepted2daf99e453e96324edca0dcf
import MathGKM.Acceptedcab29878f59978c1115c16e1
import MathGKM.Accepted4b3e8f6038531f10e4cbc50a

/- Machine-authored round93. Fixed-weight compensation and both higher-alpha
premises remain explicit. Every original polygon guard is preserved. -/
theorem BoundaryConsumerR93.compensation_weakLC :
∀ (n : ℕ) (hn : 1≤n)
    (hH : ∀ i j,
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j →
      ∀ a b, 2≤a → (PairConvolutionR78.P (2*n) 0 j (2*i+2) a b i).card ≤ (PairConvolutionR78.P (2*n) 0 j (2*i+2) a b (i+1)).card)
    (hV : ∀ i j,
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+1) →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+2) →
      ∀ a b, 2≤a → (PairConvolutionR78.P (2*n) 1 i (2*j+2) a b j).card ≤ (PairConvolutionR78.P (2*n) 1 i (2*j+2) a b (j+1)).card)
    (hW : ∀ i j,
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j →
      ∀ b, 3≤n →
        0 ≤ (n : ℤ)*(BoundaryPolarisationR92.bulk (n-3) j (2*i+2) b (i+1)-BoundaryPolarisationR92.bulk (n-3) j (2*i+2) b i)+
          2*(BoundaryPolarisationR92.endpoint (n-3) j (2*i+2) b (i+1)-BoundaryPolarisationR92.endpoint (n-3) j (2*i+2) b i)),
    let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
    MathGKM.Markov.WeakLC E.a E.b E.p := by
  intro n hn hH hV hW
  apply Accepted4b3e8f6038531f10e4cbc50a.obligation n hn
  · intro i j hp0 hp1 hp2 a b
    by_cases ha0 : a=0
    · subst a
      exact (Accepted2daf99e453e96324edca0dcf.obligation n i j b).1
    by_cases ha1 : a=1
    · subst a
      by_cases hn3 : n<3
      · exact BoundarySmallR93.alpha_one_small n j i b hn3
      · have hng : 3≤n := by omega
        have hw := hW i j hp0 hp1 hp2 b hng
        have he : n-3+3=n := by omega
        have hez : ((n-3 : ℕ) : ℤ)+3=(n : ℤ) := by omega
        have hh := (BoundaryCompensationR93.central_iff (n-3) j i b).1
        rw [he] at hh
        apply hh
        simpa only [hez] using hw
    · exact hH i j hp0 hp1 hp2 a b (by omega)
  · intro i j hp0 hp1 hp2 a b
    by_cases ha0 : a=0
    · subst a
      exact (Accepted2daf99e453e96324edca0dcf.obligation n i j b).2
    by_cases ha1 : a=1
    · subst a
      exact Acceptedcab29878f59978c1115c16e1.obligation n i j b
    · exact hV i j hp0 hp1 hp2 a b (by omega)

#print axioms BoundaryConsumerR93.compensation_weakLC
