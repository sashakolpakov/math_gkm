import MathGKM.Round20RawA
import MathGKM.Markov
def MathGKM.Targetd524f74aea36c34ca7f8318c.Interface :=
  (
    True
  )
def MathGKM.Targetd524f74aea36c34ca7f8318c.Transport (StudyInterface : MathGKM.Targetd524f74aea36c34ca7f8318c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetd524f74aea36c34ca7f8318c.Goal (StudyInterface : MathGKM.Targetd524f74aea36c34ca7f8318c.Interface) : Prop :=
  (
    (∀ (P : MathGKM.Markov.BiPoly) (d r i j : ℕ),
      MathGKM.Markov.coeff (ClearedLayersR20.rawLayer P d r) i j=
        if i+j+r=d then MathGKM.Markov.coeff P i j else 0) ∧
    (∀ (P : MathGKM.Markov.BiPoly) (d r i j : ℕ),
      MathGKM.Markov.coeff (ClearedLayersR20.rawLayer P d r) i j≠0 → i+j+r=d)
  )
