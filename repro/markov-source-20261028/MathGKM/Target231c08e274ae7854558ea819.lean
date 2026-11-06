import MathGKM.Markov
def MathGKM.Target231c08e274ae7854558ea819.Interface :=
  (
    True
  )
def MathGKM.Target231c08e274ae7854558ea819.Transport (StudyInterface : MathGKM.Target231c08e274ae7854558ea819.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target231c08e274ae7854558ea819.Goal (StudyInterface : MathGKM.Target231c08e274ae7854558ea819.Interface) : Prop :=
  (
    ∀ path : List Bool,
        let f := MathGKM.Markov.frame path
        f.mid.p^2 + MathGKM.Markov.U^f.lo.a * MathGKM.Markov.V^f.lo.b * f.hi.p^2 +
          MathGKM.Markov.U^f.hi.a * MathGKM.Markov.V^f.hi.b * f.lo.p^2 -
          MathGKM.Markov.S*f.lo.p*f.mid.p*f.hi.p = 0 ∧
        ∀ branch : Bool,
          let F := if branch then f.hi else f.lo
          let O := if branch then f.lo else f.hi
          O.p * (MathGKM.Markov.advance f branch).mid.p =
            f.mid.p^2 + MathGKM.Markov.U^O.a*MathGKM.Markov.V^O.b*F.p^2
  )
