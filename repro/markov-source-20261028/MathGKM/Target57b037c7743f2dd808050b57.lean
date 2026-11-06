import MathGKM.Accepted0d2b83c94b4594d717e36331
import MathGKM.Markov
def MathGKM.Target57b037c7743f2dd808050b57.Interface :=
  (
    True
  )
def MathGKM.Target57b037c7743f2dd808050b57.Transport (StudyInterface : MathGKM.Target57b037c7743f2dd808050b57.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target57b037c7743f2dd808050b57.Goal (StudyInterface : MathGKM.Target57b037c7743f2dd808050b57.Interface) : Prop :=
  (
    let H := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => P.support.sum (fun i => Polynomial.monomial i ((P.coeff i).support.sum (fun j => Polynomial.monomial j (Polynomial.monomial (d-i-j) (MathGKM.Markov.coeff P i j))))); let bd := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => ∀ i j : ℕ, d < i+j → MathGKM.Markov.coeff P i j = 0; let Uh : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.X; let Vh : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.C Polynomial.X; let W : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.C (Polynomial.C Polynomial.X); (∀ P d i j, ((H P d).coeff i).coeff j = Polynomial.monomial (d-i-j) (MathGKM.Markov.coeff P i j)) ∧ (∀ P d, bd P d → ∀ i j k, ((((H P d).coeff i).coeff j).coeff k ≠ 0 → i+j+k=d)) ∧ (∀ P d, (H P d).map (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ))) = P) ∧ (∀ P Q d, H (P-Q) d = H P d-H Q d) ∧ (∀ P Q d e, bd P d → bd Q e → H (P*Q) (d+e) = H P d*H Q e) ∧ (H 1 0=1 ∧ H ((MathGKM.Markov.U+MathGKM.Markov.V)^2+MathGKM.Markov.U) 2=(Uh+Vh)^2+Uh*W ∧ H (MathGKM.Markov.U+MathGKM.Markov.V) 1=Uh+Vh) ∧ (∀ path : List Bool, ∀ branch : Bool, let f := MathGKM.Markov.frame path; let F := if branch then f.hi else f.lo; let O := if branch then f.lo else f.hi; let Q := (MathGKM.Markov.advance f branch).mid; H Q.p (Q.a+Q.b-1) = (Uh+Vh+W)*H F.p (F.a+F.b-1)*H f.mid.p (f.mid.a+f.mid.b-1)- Uh^F.a*Vh^F.b*W^(F.a+F.b)*H O.p (O.a+O.b-1))
  )
