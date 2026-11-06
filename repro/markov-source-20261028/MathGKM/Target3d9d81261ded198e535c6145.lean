import MathGKM.Round64ConsumerA
import MathGKM.Markov
def MathGKM.Target3d9d81261ded198e535c6145.Interface :=
  (
    True
  )
def MathGKM.Target3d9d81261ded198e535c6145.Transport (StudyInterface : MathGKM.Target3d9d81261ded198e535c6145.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3d9d81261ded198e535c6145.Goal (StudyInterface : MathGKM.Target3d9d81261ded198e535c6145.Interface) : Prop :=
  (
    (∀ (n : ℕ), 1≤n → ∀ i j : ℕ,
      MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 0 i j)=
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j ∧
      MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 1 j i)=
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j) ∧
    (∀ (n : ℕ) (hn : 1≤n)
        (hH : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j →
          ∀ a b, 0≤((MatchingProjectionR64.defect (2*n) 0 i j).coeff a).coeff b)
        (hV : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+1) →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+2) →
          ∀ a b, 0≤((MatchingProjectionR64.defect (2*n) 1 j i).coeff a).coeff b),
        let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b (i+1) j →
          MathGKM.Markov.InPolygon E.a E.b (i+2) j → MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j≤MathGKM.Markov.coeff E.p (i+1) j^2) ∧
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b i (j+1) →
          MathGKM.Markov.InPolygon E.a E.b i (j+2) → MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2)≤MathGKM.Markov.coeff E.p i (j+1)^2))
  )
