import MathGKM.Acceptedd41b10d26d5356a8a854a527
import MathGKM.Markov
def MathGKM.Target74be273e7633368ae67a137d.Interface :=
  (
    True
  )
def MathGKM.Target74be273e7633368ae67a137d.Transport (StudyInterface : MathGKM.Target74be273e7633368ae67a137d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target74be273e7633368ae67a137d.Goal (StudyInterface : MathGKM.Target74be273e7633368ae67a137d.Interface) : Prop :=
  (
    ∀ (f : MathGKM.Markov.Frame) (branch : Bool),
    let fixed := fun g : MathGKM.Markov.Frame => if branch then g.hi else g.lo
    let other := fun g : MathGKM.Markov.Frame => if branch then g.lo else g.hi
    let F := fixed f
    let r := if branch then MathGKM.Markov.U^F.a else MathGKM.Markov.V^F.b
    let q := if branch then MathGKM.Markov.V^F.b else MathGKM.Markov.U^F.a
    let H := MathGKM.Markov.S*F.p-r-q
    let run := fun n : ℕ => (fun g : MathGKM.Markov.Frame => MathGKM.Markov.advance g branch)^[n] f
    let phi := fun z : MathGKM.Markov.BiPoly × MathGKM.Markov.BiPoly => (z.1,z.1-r*z.2)
    let T := fun z : MathGKM.Markov.BiPoly × MathGKM.Markov.BiPoly => ((H+r+q)*z.1-r*q*z.2,z.1)
    let A := fun z : MathGKM.Markov.BiPoly × MathGKM.Markov.BiPoly => ((H+r)*z.1+q*z.2,H*z.1+q*z.2)
    let nn := fun P : MathGKM.Markov.BiPoly => ∀ i j : ℕ, 0 ≤ MathGKM.Markov.coeff P i j
    let z := (f.mid.p,(other f).p)
    (∀ n : ℕ, fixed (run n) = F ∧
      ((run n).mid.p,(other (run n)).p) = T^[n] z ∧
      phi ((run n).mid.p,(other (run n)).p) = A^[n] (phi z)) ∧
    (nn H → nn r → nn q → nn f.mid.p → nn (f.mid.p-r*(other f).p) →
      ∀ n : ℕ, nn (run n).mid.p ∧ nn ((run n).mid.p-r*(other (run n)).p))
  )
