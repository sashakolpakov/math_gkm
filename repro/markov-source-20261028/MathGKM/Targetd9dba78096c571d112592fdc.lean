import MathGKM.Accepted0d2b83c94b4594d717e36331
import MathGKM.Markov
def MathGKM.Targetd9dba78096c571d112592fdc.Interface :=
  (
    True
  )
def MathGKM.Targetd9dba78096c571d112592fdc.Transport (StudyInterface : MathGKM.Targetd9dba78096c571d112592fdc.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetd9dba78096c571d112592fdc.Goal (StudyInterface : MathGKM.Targetd9dba78096c571d112592fdc.Interface) : Prop :=
  (
    ∀ path : List Bool, let f := MathGKM.Markov.frame path; (∀ E ∈ [f.lo,f.mid,f.hi], E.p.eval 0 = if E.a=0 then (1 : Polynomial ℤ) else Polynomial.X^E.b*(1+Polynomial.X)^(E.a-1))
  )
