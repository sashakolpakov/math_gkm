import MathGKM.HomogeneousBridgeR2
import MathGKM.Markov
def MathGKM.Targetadef5102f64683848573a50d.Interface :=
  (
    True
  )
def MathGKM.Targetadef5102f64683848573a50d.Transport (StudyInterface : MathGKM.Targetadef5102f64683848573a50d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetadef5102f64683848573a50d.Goal (StudyInterface : MathGKM.Targetadef5102f64683848573a50d.Interface) : Prop :=
  (
    ∀ path : List Bool, let f := MathGKM.HomogeneousBridgeR2.frame path; let g := MathGKM.Markov.frame path;
      (∀ i j : ℕ, MathGKM.Markov.coeff g.lo.p i j =
        if i+j ≤ g.lo.a+g.lo.b-1 then MathGKM.HomogeneousBridgeR2.coeff f.lo.p i j (g.lo.a+g.lo.b-1-i-j) else 0) ∧
      (∀ i j : ℕ, MathGKM.Markov.coeff g.mid.p i j =
        if i+j ≤ g.mid.a+g.mid.b-1 then MathGKM.HomogeneousBridgeR2.coeff f.mid.p i j (g.mid.a+g.mid.b-1-i-j) else 0) ∧
      (∀ i j : ℕ, MathGKM.Markov.coeff g.hi.p i j =
        if i+j ≤ g.hi.a+g.hi.b-1 then MathGKM.HomogeneousBridgeR2.coeff f.hi.p i j (g.hi.a+g.hi.b-1-i-j) else 0)
  )
