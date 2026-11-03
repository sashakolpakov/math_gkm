import MathGKM.QuotientReciprocity
import MathGKM.GaussianQuotient
def MathGKM.Target2fdf850f377242b7e261ad69.Interface :=
  (
    True
  )
def MathGKM.Target2fdf850f377242b7e261ad69.Transport (StudyInterface : MathGKM.Target2fdf850f377242b7e261ad69.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2fdf850f377242b7e261ad69.Goal (StudyInterface : MathGKM.Target2fdf850f377242b7e261ad69.Interface) : Prop :=
  (
    ∀ n k l : ℕ, ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → H.reverse = H
  )
