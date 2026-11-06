import MathGKM.Markov
def MathGKM.Target44dd5e9971774f444cb3be6c.Interface :=
  (
    True
  )
def MathGKM.Target44dd5e9971774f444cb3be6c.Transport (StudyInterface : MathGKM.Target44dd5e9971774f444cb3be6c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target44dd5e9971774f444cb3be6c.Goal (StudyInterface : MathGKM.Target44dd5e9971774f444cb3be6c.Interface) : Prop :=
  (
    ∀ (H r q : MathGKM.Markov.BiPoly),
    let phi := fun z : MathGKM.Markov.BiPoly × MathGKM.Markov.BiPoly =>
      (z.1, z.1-r*z.2)
    let T := fun z : MathGKM.Markov.BiPoly × MathGKM.Markov.BiPoly =>
      ((H+r+q)*z.1-r*q*z.2, z.1)
    let A := fun z : MathGKM.Markov.BiPoly × MathGKM.Markov.BiPoly =>
      ((H+r)*z.1+q*z.2, H*z.1+q*z.2)
    let nn := fun P : MathGKM.Markov.BiPoly =>
      ∀ i j : ℕ, 0 ≤ MathGKM.Markov.coeff P i j
    (∀ z, phi (T z) = A (phi z)) ∧
    (∀ (n : ℕ) z, phi (T^[n] z) = A^[n] (phi z)) ∧
    (∀ z, nn H → nn r → nn q → nn z.1 → nn (z.1-r*z.2) →
      ∀ n : ℕ, nn (T^[n] z).1 ∧ nn (phi (T^[n] z)).2)
  )
