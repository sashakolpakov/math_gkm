import MathGKM.HomogeneousBridgeR2
import MathGKM.Markov
def MathGKM.Target49a048f469bee2b91a031b4c.Interface :=
  (
    True
  )
def MathGKM.Target49a048f469bee2b91a031b4c.Transport (StudyInterface : MathGKM.Target49a048f469bee2b91a031b4c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target49a048f469bee2b91a031b4c.Goal (StudyInterface : MathGKM.Target49a048f469bee2b91a031b4c.Interface) : Prop :=
  (
    ∀ path : List Bool, let f := MathGKM.HomogeneousBridgeR2.frame path;
      (f.lo.p.IsHomogeneous (f.lo.a+f.lo.b-1) ∧
       f.mid.p.IsHomogeneous (f.mid.a+f.mid.b-1) ∧
       f.hi.p.IsHomogeneous (f.hi.a+f.hi.b-1)) ∧
      ∀ l ∈ [f.lo, f.mid, f.hi], ∀ i j k : ℕ,
        MathGKM.HomogeneousBridgeR2.coeff l.p i j k ≠ 0 → i+j+k = l.a+l.b-1
  )
