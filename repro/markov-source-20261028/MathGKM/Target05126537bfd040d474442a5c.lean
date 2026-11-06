import MathGKM.Round24ShiftA
import MathGKM.Markov
def MathGKM.Target05126537bfd040d474442a5c.Interface :=
  (
    True
  )
def MathGKM.Target05126537bfd040d474442a5c.Transport (StudyInterface : MathGKM.Target05126537bfd040d474442a5c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target05126537bfd040d474442a5c.Goal (StudyInterface : MathGKM.Target05126537bfd040d474442a5c.Interface) : Prop :=
  (
    (∀ (P : MathGKM.Markov.BiPoly) (d a b s r : ℕ), RawDeficitR24.Bounded P d →
      ClearedLayersR20.rawLayer (MathGKM.Markov.U^a*MathGKM.Markov.V^b*P) (d+a+b+s) r =
        if s≤r then MathGKM.Markov.U^a*MathGKM.Markov.V^b*ClearedLayersR20.rawLayer P d (r-s) else 0) ∧
    (ClearedLayersR20.rawLayer (MathGKM.Markov.U*1) (0+1) 0 ≠
      (∑ hk ∈ Finset.HasAntidiagonal.antidiagonal (0 : ℕ),
        ClearedLayersR20.rawLayer MathGKM.Markov.U 0 hk.1*ClearedLayersR20.rawLayer 1 1 hk.2) ∧
     ClearedLayersR20.rawLayer (MathGKM.Markov.U^0*MathGKM.Markov.V^0*1) (0+0+0+1) 0 ≠ MathGKM.Markov.U^0*MathGKM.Markov.V^0*ClearedLayersR20.rawLayer 1 0 (0-1))
  )
