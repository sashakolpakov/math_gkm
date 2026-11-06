import MathGKM.Round73EncodingA
import MathGKM.Accepted1a1659ea961c83a916e1ec7c
import MathGKM.Acceptedb63003712f84c5edfae19488

/-! Machine-authored round74 recovery of unchanged round73 propositions. Every missing recovery equation and each
individual triple's compatibility premise are retained explicitly. -/
namespace KernelConsumerR74
open KernelEncodingR73 MatchingProjectionR64 MathGKM.Markov
noncomputable section

theorem horizontal (n i j : ℕ) (hn : 1 ≤ n)
    (hp0 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i j)
    (hp1 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b (i+1) j)
    (hp2 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b (i+2) j)
    (r0 : MidpointMarginalR36.mass (E (2*n) 0 i j) = unit (B (2*n) 0 i j))
    (r1 : MidpointMarginalR36.mass (E (2*n) 0 (i+1) j) = unit (B (2*n) 0 (i+1) j))
    (r2 : MidpointMarginalR36.mass (E (2*n) 0 (i+2) j) = unit (B (2*n) 0 (i+2) j))
    (hc : MidpointMarginalR36.Compatible (E (2*n) 0 i j)
      (E (2*n) 0 (i+2) j) (E (2*n) 0 (i+1) j)) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j *
      coeff (frame (List.replicate (n-1) true)).mid.p (i+2) j ≤
      coeff (frame (List.replicate (n-1) true)).mid.p (i+1) j ^ 2 := by
  have h := Accepted1a1659ea961c83a916e1ec7c.obligation _ _ _ hc
  rw [r0, r1, r2] at h
  simpa only [(Acceptedb63003712f84c5edfae19488.obligation.1 n hn i j).1,
    (Acceptedb63003712f84c5edfae19488.obligation.1 n hn (i+1) j).1,
    (Acceptedb63003712f84c5edfae19488.obligation.1 n hn (i+2) j).1] using h

theorem vertical (n i j : ℕ) (hn : 1 ≤ n)
    (hp0 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i j)
    (hp1 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i (j+1))
    (hp2 : InPolygon (frame (List.replicate (n-1) true)).mid.a
      (frame (List.replicate (n-1) true)).mid.b i (j+2))
    (r0 : MidpointMarginalR36.mass (E (2*n) 1 j i) = unit (B (2*n) 1 j i))
    (r1 : MidpointMarginalR36.mass (E (2*n) 1 (j+1) i) = unit (B (2*n) 1 (j+1) i))
    (r2 : MidpointMarginalR36.mass (E (2*n) 1 (j+2) i) = unit (B (2*n) 1 (j+2) i))
    (hc : MidpointMarginalR36.Compatible (E (2*n) 1 j i)
      (E (2*n) 1 (j+2) i) (E (2*n) 1 (j+1) i)) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j *
      coeff (frame (List.replicate (n-1) true)).mid.p i (j+2) ≤
      coeff (frame (List.replicate (n-1) true)).mid.p i (j+1) ^ 2 := by
  have h := Accepted1a1659ea961c83a916e1ec7c.obligation _ _ _ hc
  rw [r0, r1, r2] at h
  simpa only [(Acceptedb63003712f84c5edfae19488.obligation.1 n hn i j).2,
    (Acceptedb63003712f84c5edfae19488.obligation.1 n hn i (j+1)).2,
    (Acceptedb63003712f84c5edfae19488.obligation.1 n hn i (j+2)).2] using h
end
end KernelConsumerR74

#print axioms KernelConsumerR74.horizontal
#print axioms KernelConsumerR74.vertical
