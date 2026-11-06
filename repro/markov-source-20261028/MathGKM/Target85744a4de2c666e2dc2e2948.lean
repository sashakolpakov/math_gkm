import MathGKM.Markov
def MathGKM.Target85744a4de2c666e2dc2e2948.Interface :=
  (
    True
  )
def MathGKM.Target85744a4de2c666e2dc2e2948.Transport (StudyInterface : MathGKM.Target85744a4de2c666e2dc2e2948.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target85744a4de2c666e2dc2e2948.Goal (StudyInterface : MathGKM.Target85744a4de2c666e2dc2e2948.Interface) : Prop :=
  (
    ∀ (f : MathGKM.Markov.Frame) (branch : Bool),
    let F := if branch then f.hi else f.lo
    let O := if branch then f.lo else f.hi
    let r := if branch then MathGKM.Markov.U^F.a else MathGKM.Markov.V^F.b
    let q := if branch then MathGKM.Markov.V^F.b else MathGKM.Markov.U^F.a
    let H := MathGKM.Markov.S*F.p-r-q
    let G := f.mid.p-r*O.p
    let P := (H+r)*f.mid.p
    let R := q*G
    let g := MathGKM.Markov.advance f branch
    let Fnew := if !branch then g.hi else g.lo
    let Onew := if !branch then g.lo else g.hi
    let rnew := if !branch then MathGKM.Markov.U^Fnew.a else MathGKM.Markov.V^Fnew.b
    let qnew := if !branch then MathGKM.Markov.V^Fnew.b else MathGKM.Markov.U^Fnew.a
    let Hnew := MathGKM.Markov.S*Fnew.p-rnew-qnew
    let Gnew := g.mid.p-rnew*Onew.p
    let nn := fun B : MathGKM.Markov.BiPoly => ∀ i j : ℕ, 0 ≤ MathGKM.Markov.coeff B i j
    Fnew = f.mid ∧ Onew = F ∧ g.mid.p = P+R ∧
    Hnew = MathGKM.Markov.S*f.mid.p-rnew-qnew ∧
    Gnew = P+R-rnew*F.p ∧
    ((nn Hnew ∧ nn Gnew) ↔
      (∀ i j : ℕ, MathGKM.Markov.coeff rnew i j+MathGKM.Markov.coeff qnew i j ≤ MathGKM.Markov.coeff (MathGKM.Markov.S*f.mid.p) i j) ∧
      (∀ i j : ℕ, MathGKM.Markov.coeff (rnew*F.p) i j ≤ MathGKM.Markov.coeff P i j+MathGKM.Markov.coeff R i j))
  )
