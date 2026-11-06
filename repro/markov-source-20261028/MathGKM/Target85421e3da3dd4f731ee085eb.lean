import MathGKM.Accepted0d2b83c94b4594d717e36331
import MathGKM.Markov
def MathGKM.Target85421e3da3dd4f731ee085eb.Interface :=
  (
    True
  )
def MathGKM.Target85421e3da3dd4f731ee085eb.Transport (StudyInterface : MathGKM.Target85421e3da3dd4f731ee085eb.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target85421e3da3dd4f731ee085eb.Goal (StudyInterface : MathGKM.Target85421e3da3dd4f731ee085eb.Interface) : Prop :=
  (
    let bd := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => ∀ i j : ℕ, d < i+j → MathGKM.Markov.coeff P i j = 0; (∀ path : List Bool, let f := MathGKM.Markov.frame path; bd f.lo.p (f.lo.a+f.lo.b-1) ∧ bd f.mid.p (f.mid.a+f.mid.b-1) ∧ bd f.hi.p (f.hi.a+f.hi.b-1)) ∧ bd (1 : MathGKM.Markov.BiPoly) 0 ∧ bd (MathGKM.Markov.U+MathGKM.Markov.V) 1
  )
