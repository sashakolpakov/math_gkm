import MathGKM.Round40SubmissionA
import MathGKM.Markov
def MathGKM.Targetb53d3c2d983a605bf4eba7e4.Interface :=
  (
    True
  )
def MathGKM.Targetb53d3c2d983a605bf4eba7e4.Transport (StudyInterface : MathGKM.Targetb53d3c2d983a605bf4eba7e4.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb53d3c2d983a605bf4eba7e4.Goal (StudyInterface : MathGKM.Targetb53d3c2d983a605bf4eba7e4.Interface) : Prop :=
  (
    ∀ (k : ℕ)
        (hH : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b (i+1) j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b (i+2) j →
          ∀ l, l≤2*(k+1) → 0≤GroupedR40.group (k+1) i j 1 0 l)
        (hV : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i (j+1) →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i (j+2) →
          ∀ l, l≤2*(k+1) → 0≤GroupedR40.group (k+1) i j 0 1 l),
        let E := (MathGKM.Markov.frame (List.replicate k true)).mid
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b (i+1) j →
          MathGKM.Markov.InPolygon E.a E.b (i+2) j →
          MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j≤MathGKM.Markov.coeff E.p (i+1) j^2) ∧
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b i (j+1) →
          MathGKM.Markov.InPolygon E.a E.b i (j+2) →
          MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2)≤MathGKM.Markov.coeff E.p i (j+1)^2)
  )
