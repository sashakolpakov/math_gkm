import MathGKM.Round87PositiveA
import MathGKM.Markov
def MathGKM.Targetacb02b3aa2dea975becd3153.Interface :=
  (
    True
  )
def MathGKM.Targetacb02b3aa2dea975becd3153.Transport (StudyInterface : MathGKM.Targetacb02b3aa2dea975becd3153.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetacb02b3aa2dea975becd3153.Goal (StudyInterface : MathGKM.Targetacb02b3aa2dea975becd3153.Interface) : Prop :=
  (
    (∀ r : ℕ, (PairConvolutionR78.P 10 1 5 4 0 6 r).card =
          if r=0 then 350 else if r=1 then 2000 else if r=2 then 3600 else
          if r=3 then 2000 else if r=4 then 350 else 0) ∧
        (∀ r, r≤4 → (FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff r=(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff (4-r)) ∧
        (∀ r, 0≤(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff r) ∧
        (∀ r, 0<(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff r ↔ r≤4) ∧
        (∀ i j k : ℕ, i<j → j<k → 0<(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff i → 0<(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff k → 0<(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff j) ∧
        (∀ r, (FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff r*(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff (r+2)≤(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff (r+1)^2) ∧
        (∀ r, 2*r<4 → (FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff r≤(FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff (r+1)) ∧
        (∀ r, 4<r → (FullFiberRankR80.rankPoly 10 1 5 4 0 6).coeff r=0)
  )
