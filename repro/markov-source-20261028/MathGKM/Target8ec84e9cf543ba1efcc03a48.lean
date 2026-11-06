import MathGKM.Round74CountingConsumerA
import MathGKM.Markov
def MathGKM.Target8ec84e9cf543ba1efcc03a48.Interface :=
  (
    True
  )
def MathGKM.Target8ec84e9cf543ba1efcc03a48.Transport (StudyInterface : MathGKM.Target8ec84e9cf543ba1efcc03a48.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target8ec84e9cf543ba1efcc03a48.Goal (StudyInterface : MathGKM.Target8ec84e9cf543ba1efcc03a48.Interface) : Prop :=
  (
    (∀ (n i j : ℕ) (hn : 1 ≤ n)
        (hcount : KernelRecoveryR73.Counting)
        (hp0 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j)
        (hp1 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+1) j)
        (hp2 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b (i+2) j)
        (hc : MidpointMarginalR36.Compatible (KernelEncodingR73.E (2*n) 0 i j)
          (KernelEncodingR73.E (2*n) 0 (i+2) j) (KernelEncodingR73.E (2*n) 0 (i+1) j)),
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j *
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+2) j ≤
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+1) j ^ 2) ∧
    (∀ (n i j : ℕ) (hn : 1 ≤ n)
        (hcount : KernelRecoveryR73.Counting)
        (hp0 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i j)
        (hp1 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+1))
        (hp2 : MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.a
          (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.b i (j+2))
        (hc : MidpointMarginalR36.Compatible (KernelEncodingR73.E (2*n) 1 j i)
          (KernelEncodingR73.E (2*n) 1 (j+2) i) (KernelEncodingR73.E (2*n) 1 (j+1) i)),
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j *
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i (j+2) ≤
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i (j+1) ^ 2)
  )
