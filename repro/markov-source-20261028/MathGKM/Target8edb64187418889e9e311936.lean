import MathGKM.Markov
def MathGKM.Target8edb64187418889e9e311936.Interface :=
  (
    True
  )
def MathGKM.Target8edb64187418889e9e311936.Transport (StudyInterface : MathGKM.Target8edb64187418889e9e311936.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target8edb64187418889e9e311936.Goal (StudyInterface : MathGKM.Target8edb64187418889e9e311936.Interface) : Prop :=
  (
    ∀ k : ℕ,
    let f := MathGKM.Markov.frame (List.replicate k false)
    f.lo = ⟨0,1,1⟩ ∧ f.mid.a = 1 ∧ f.mid.b = k+2 ∧
    f.hi.a = 1 ∧ f.hi.b = k+1 ∧
    f.mid.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X * (1+Polynomial.X)^(k+1) ∧
    f.hi.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X * (1+Polynomial.X)^k
  )
