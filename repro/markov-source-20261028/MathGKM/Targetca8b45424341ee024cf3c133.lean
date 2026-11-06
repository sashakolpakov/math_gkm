import MathGKM.Round24ProductA
import MathGKM.Markov
def MathGKM.Targetca8b45424341ee024cf3c133.Interface :=
  (
    True
  )
def MathGKM.Targetca8b45424341ee024cf3c133.Transport (StudyInterface : MathGKM.Targetca8b45424341ee024cf3c133.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetca8b45424341ee024cf3c133.Goal (StudyInterface : MathGKM.Targetca8b45424341ee024cf3c133.Interface) : Prop :=
  (
    (∀ (P Q : MathGKM.Markov.BiPoly) (d e r : ℕ),
      RawDeficitR24.Bounded P d → RawDeficitR24.Bounded Q e →
      ClearedLayersR20.rawLayer (P*Q) (d+e) r =
        ∑ hk ∈ Finset.HasAntidiagonal.antidiagonal r, ClearedLayersR20.rawLayer P d hk.1*ClearedLayersR20.rawLayer Q e hk.2) ∧
    (∀ (P Q : MathGKM.Markov.BiPoly) (d r : ℕ), ClearedLayersR20.rawLayer (P+Q) d r=ClearedLayersR20.rawLayer P d r+ClearedLayersR20.rawLayer Q d r) ∧
    (∀ (P Q : MathGKM.Markov.BiPoly) (d r : ℕ), ClearedLayersR20.rawLayer (P-Q) d r=ClearedLayersR20.rawLayer P d r-ClearedLayersR20.rawLayer Q d r)
  )
