import MathGKM.Round74ConsumerA
import MathGKM.Accepted61ec248d2a26123ff46e7928
/-! Machine-authored round74. Counting and every individual Compatible premise remain assumptions. -/
namespace KernelCountingConsumerR74
open KernelEncodingR73 MatchingProjectionR64 MathGKM.Markov
noncomputable section

theorem horizontal_counting (n i j : ℕ) (hn : 1 ≤ n)
    (hcount : KernelRecoveryR73.Counting)
    (hp0 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i j)
    (hp1 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b (i+1) j)
    (hp2 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b (i+2) j)
    (hc : MidpointMarginalR36.Compatible (E (2*n) 0 i j)
      (E (2*n) 0 (i+2) j) (E (2*n) 0 (i+1) j)) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j *
      coeff (frame (List.replicate (n-1) true)).mid.p (i+2) j ≤
      coeff (frame (List.replicate (n-1) true)).mid.p (i+1) j ^ 2 := by
  exact KernelConsumerR74.horizontal n i j hn hp0 hp1 hp2
    (Accepted61ec248d2a26123ff46e7928.obligation hcount (2*n) 0 i j (by decide))
    (Accepted61ec248d2a26123ff46e7928.obligation hcount (2*n) 0 (i+1) j (by decide))
    (Accepted61ec248d2a26123ff46e7928.obligation hcount (2*n) 0 (i+2) j (by decide)) hc

theorem vertical_counting (n i j : ℕ) (hn : 1 ≤ n)
    (hcount : KernelRecoveryR73.Counting)
    (hp0 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i j)
    (hp1 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i (j+1))
    (hp2 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i (j+2))
    (hc : MidpointMarginalR36.Compatible (E (2*n) 1 j i)
      (E (2*n) 1 (j+2) i) (E (2*n) 1 (j+1) i)) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j *
      coeff (frame (List.replicate (n-1) true)).mid.p i (j+2) ≤
      coeff (frame (List.replicate (n-1) true)).mid.p i (j+1) ^ 2 := by
  exact KernelConsumerR74.vertical n i j hn hp0 hp1 hp2
    (Accepted61ec248d2a26123ff46e7928.obligation hcount (2*n) 1 j i (by decide))
    (Accepted61ec248d2a26123ff46e7928.obligation hcount (2*n) 1 (j+1) i (by decide))
    (Accepted61ec248d2a26123ff46e7928.obligation hcount (2*n) 1 (j+2) i (by decide)) hc
end
end KernelCountingConsumerR74

#print axioms KernelCountingConsumerR74.horizontal_counting
#print axioms KernelCountingConsumerR74.vertical_counting
