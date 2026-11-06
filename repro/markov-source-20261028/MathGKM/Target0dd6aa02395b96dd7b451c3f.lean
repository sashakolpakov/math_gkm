import MathGKM.Round93Submission3A
import MathGKM.Markov
def MathGKM.Target0dd6aa02395b96dd7b451c3f.Interface :=
  (
    True
  )
def MathGKM.Target0dd6aa02395b96dd7b451c3f.Transport (StudyInterface : MathGKM.Target0dd6aa02395b96dd7b451c3f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target0dd6aa02395b96dd7b451c3f.Goal (StudyInterface : MathGKM.Target0dd6aa02395b96dd7b451c3f.Interface) : Prop :=
  (
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
        MathGKM.Markov.WeakLC E.a E.b E.p
  )
