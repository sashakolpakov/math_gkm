import MathGKM.Markov
def MathGKM.Targete53fdd001b2c1f5675b1eab5.Interface :=
  (
    True
  )
def MathGKM.Targete53fdd001b2c1f5675b1eab5.Transport (StudyInterface : MathGKM.Targete53fdd001b2c1f5675b1eab5.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targete53fdd001b2c1f5675b1eab5.Goal (StudyInterface : MathGKM.Targete53fdd001b2c1f5675b1eab5.Interface) : Prop :=
  (
    ∀ path : List Bool, let f := MathGKM.Markov.frame path;
      f.mid.a = f.lo.a + f.hi.a ∧
      f.mid.b = f.lo.b + f.hi.b ∧
      f.lo.b * f.hi.a = f.lo.a * f.hi.b + 1 ∧
      0 < f.lo.b ∧ 0 < f.hi.b ∧
      f.lo.a ≤ f.lo.b ∧ f.hi.a ≤ f.hi.b
  )
