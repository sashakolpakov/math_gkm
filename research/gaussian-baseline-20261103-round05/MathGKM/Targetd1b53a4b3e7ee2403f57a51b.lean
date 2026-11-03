import MathGKM.QuotientReciprocity
import MathGKM.GaussianQuotient
def MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Interface :=
  (
    True
  )
def MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Transport (StudyInterface : MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Goal (StudyInterface : MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Interface) : Prop :=
  (
    ∀ (D N H : Polynomial ℚ) (c : ℚ), D ≠ 0 → c ≠ 0 → D.reverse = Polynomial.C c * D → N.reverse = Polynomial.C c * N → H * D = N → H.reverse = H
  )
