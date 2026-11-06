import MathGKM.Markov
def MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Interface :=
  (
    True
  )
def MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Transport (StudyInterface : MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Goal (StudyInterface : MathGKM.Target2b2131ae2d71b3d5b42c2bc0.Interface) : Prop :=
  (
    ∀ path : List Bool,
        let f := MathGKM.Markov.frame path
        f.mid.a = f.lo.a + f.hi.a ∧
        f.mid.b = f.lo.b + f.hi.b ∧
        f.hi.a * f.lo.b = f.lo.a * f.hi.b + 1 ∧
        0 < f.lo.b ∧ 0 < f.hi.b ∧
        0 < f.mid.a ∧ f.mid.a < f.mid.b ∧ Nat.Coprime f.mid.a f.mid.b
  )
