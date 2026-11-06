import MathGKM.Targete6e00a0879d6228698a0796b
import MathGKM.Markov
import Lean
def Accepted4120a49954bd61a3f32a14c2.interface : MathGKM.Targete6e00a0879d6228698a0796b.Interface :=
  (
    True.intro
  )
theorem Accepted4120a49954bd61a3f32a14c2.transport : MathGKM.Targete6e00a0879d6228698a0796b.Transport Accepted4120a49954bd61a3f32a14c2.interface :=
  (
    True.intro
  )
theorem Accepted4120a49954bd61a3f32a14c2.obligation : MathGKM.Targete6e00a0879d6228698a0796b.Goal Accepted4120a49954bd61a3f32a14c2.interface :=
  (
    by
      intro a b A B h v d good hH hV hD
      have subLC (x0 x1 x2 y0 y1 y2 : ℤ)
          (hy : 0 ≤ y1^2-y0*y2)
          (hx : 0 ≤ (x1^2-x0*x2)-(2*x1*y1-x0*y2-x2*y0)) :
          (x0-y0)*(x2-y2) ≤ (x1-y1)^2 := by
        nlinarith
      have coeff_sub (i j : ℕ) :
          MathGKM.Markov.coeff (A-B) i j =
          MathGKM.Markov.coeff A i j - MathGKM.Markov.coeff B i j := by
        simp only [MathGKM.Markov.coeff, Polynomial.coeff_sub]
      refine ⟨?_, ?_, ?_⟩
      · intro i j p0 p1 p2
        have hg := hH j i p0 p1 p2
        dsimp only [good, h] at hg
        simp only [coeff_sub]
        exact subLC _ _ _ _ _ _ hg.1 hg.2
      · intro i j p0 p1 p2
        have hg := hV i j p0 p1 p2
        dsimp only [good, v] at hg
        simp only [coeff_sub]
        exact subLC _ _ _ _ _ _ hg.1 hg.2
      · intro i j p0 p1 p2
        let n := i+j+2
        have bound : i+2 ≤ n := by omega
        have e0 : n-i = j+2 := by omega
        have e1 : n-(i+1) = j+1 := by omega
        have e2 : n-(i+2) = j := by omega
        have hg := hD n i bound (e0.symm ▸ p0) (e1.symm ▸ p1) (e2.symm ▸ p2)
        dsimp only [good, d] at hg
        rw [e0, e1, e2] at hg
        simp only [coeff_sub]
        exact subLC _ _ _ _ _ _ hg.1 hg.2
  )
