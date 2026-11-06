import MathGKM.Accepted0d2b83c94b4594d717e36331
import MathGKM.Markov
def MathGKM.Target710651987c4eae27a96fc5e7.Interface :=
  (
    True
  )
def MathGKM.Target710651987c4eae27a96fc5e7.Transport (StudyInterface : MathGKM.Target710651987c4eae27a96fc5e7.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target710651987c4eae27a96fc5e7.Goal (StudyInterface : MathGKM.Target710651987c4eae27a96fc5e7.Interface) : Prop :=
  (
    ∀ path : List Bool, let f := MathGKM.Markov.frame path; f.lo.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X^f.lo.a*(1+Polynomial.X)^(f.lo.b-1) ∧ f.mid.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X^f.mid.a*(1+Polynomial.X)^(f.mid.b-1) ∧ f.hi.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X^f.hi.a*(1+Polynomial.X)^(f.hi.b-1)
  )
