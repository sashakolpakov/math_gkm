import MathGKM.Round120BridgeA
import MathGKM.Markov
def MathGKM.Targeta8a47c309d60eee5f2c40745.Interface :=
  (
    True
  )
def MathGKM.Targeta8a47c309d60eee5f2c40745.Transport (StudyInterface : MathGKM.Targeta8a47c309d60eee5f2c40745.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targeta8a47c309d60eee5f2c40745.Goal (StudyInterface : MathGKM.Targeta8a47c309d60eee5f2c40745.Interface) : Prop :=
  (
    ∀ (n : ℕ) (hn : 1≤n)
        (hH : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
            (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
            (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
            (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j →
          PacketBridgeR120.Injection (2*n) 0 i j)
        (hV : ∀ i j,
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
            (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
            (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+1) →
          MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
            (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+2) →
          PacketBridgeR120.Injection (2*n) 1 j i),
    let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid;
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b (i+1) j →
          MathGKM.Markov.InPolygon E.a E.b (i+2) j →
          MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j ≤ MathGKM.Markov.coeff E.p (i+1) j^2) ∧
        (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b i (j+1) →
          MathGKM.Markov.InPolygon E.a E.b i (j+2) →
          MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2) ≤ MathGKM.Markov.coeff E.p i (j+1)^2)
  )
