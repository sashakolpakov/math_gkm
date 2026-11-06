import MathGKM.Round39StencilInterfaceA
import MathGKM.Markov
def MathGKM.Targetb04b5c10774e7c910236aa2c.Interface :=
  (
    True
  )
def MathGKM.Targetb04b5c10774e7c910236aa2c.Transport (StudyInterface : MathGKM.Targetb04b5c10774e7c910236aa2c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb04b5c10774e7c910236aa2c.Goal (StudyInterface : MathGKM.Targetb04b5c10774e7c910236aa2c.Interface) : Prop :=
  (
    (∀ (mid : Bool) (P Q : MathGKM.Markov.BiPoly) (i j dx dy t : ℤ), StateCrossR38.zcoeff (ShiftedR39.output mid P Q) (i+t*dx) (j+t*dy)=Finset.sum Finset.univ (fun r : Fin 5 => (ShiftedR39.weights mid r : ℤ)*ShiftedR39.f P Q i j dx dy r t)) ∧ (∀ P Q : MathGKM.Markov.BiPoly, ShiftedR39.Premises P Q → ShiftedR39.CoordLC (ShiftedR39.output true P Q) ∧ ShiftedR39.CoordLC (ShiftedR39.output false P Q)) ∧ (∀ k : ℕ, RightR30.M (k+1)=ShiftedR39.output true (RightR30.M k) (RightR30.G k) ∧ RightR30.G (k+1)=ShiftedR39.output false (RightR30.M k) (RightR30.G k)) ∧ (∀ k : ℕ, ShiftedR39.Premises (RightR30.M k) (RightR30.G k) → ShiftedR39.CoordLC (RightR30.M (k+1)) ∧ ShiftedR39.CoordLC (RightR30.G (k+1)))
  )
