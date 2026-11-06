import MathGKM.Round74ConsumerA
import MathGKM.Markov
def MathGKM.Targeta8d25a19a3fc6eda7f39dc61.Interface :=
  (
    True
  )
def MathGKM.Targeta8d25a19a3fc6eda7f39dc61.Transport (StudyInterface : MathGKM.Targeta8d25a19a3fc6eda7f39dc61.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targeta8d25a19a3fc6eda7f39dc61.Goal (StudyInterface : MathGKM.Targeta8d25a19a3fc6eda7f39dc61.Interface) : Prop :=
  (
    (∀ (n i j : ℕ) (hn : 1 ≤ n)
        (hp0 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j)
        (hp1 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j)
        (hp2 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j)
        (r0 : MidpointMarginalR36.mass (KernelEncodingR73.E (2*n) 0 i j) = MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 0 i j))
        (r1 : MidpointMarginalR36.mass (KernelEncodingR73.E (2*n) 0 (i+1) j) = MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 0 (i+1) j))
        (r2 : MidpointMarginalR36.mass (KernelEncodingR73.E (2*n) 0 (i+2) j) = MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 0 (i+2) j))
        (hc : MidpointMarginalR36.Compatible (KernelEncodingR73.E (2*n) 0 i j)
          (KernelEncodingR73.E (2*n) 0 (i+2) j) (KernelEncodingR73.E (2*n) 0 (i+1) j)),
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j *
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+2) j ≤
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+1) j ^ 2) ∧
    (∀ (n i j : ℕ) (hn : 1 ≤ n)
        (hp0 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j)
        (hp1 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+1))
        (hp2 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+2))
        (r0 : MidpointMarginalR36.mass (KernelEncodingR73.E (2*n) 1 j i) = MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 1 j i))
        (r1 : MidpointMarginalR36.mass (KernelEncodingR73.E (2*n) 1 (j+1) i) = MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 1 (j+1) i))
        (r2 : MidpointMarginalR36.mass (KernelEncodingR73.E (2*n) 1 (j+2) i) = MatchingProjectionR64.unit (MatchingProjectionR64.B (2*n) 1 (j+2) i))
        (hc : MidpointMarginalR36.Compatible (KernelEncodingR73.E (2*n) 1 j i)
          (KernelEncodingR73.E (2*n) 1 (j+2) i) (KernelEncodingR73.E (2*n) 1 (j+1) i)),
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j *
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i (j+2) ≤
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i (j+1) ^ 2)
  )
