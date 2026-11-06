import MathGKM.Target85744a4de2c666e2dc2e2948
import MathGKM.Markov
import Lean
def Accepted9a1ebbca07e887b5d25a8614.interface : MathGKM.Target85744a4de2c666e2dc2e2948.Interface :=
  (
    True.intro
  )
theorem Accepted9a1ebbca07e887b5d25a8614.transport : MathGKM.Target85744a4de2c666e2dc2e2948.Transport Accepted9a1ebbca07e887b5d25a8614.interface :=
  (
    True.intro
  )
theorem Accepted9a1ebbca07e887b5d25a8614.obligation : MathGKM.Target85744a4de2c666e2dc2e2948.Goal Accepted9a1ebbca07e887b5d25a8614.interface :=
  (
    by
      intro f branch F O r q H G P R g Fnew Onew rnew qnew Hnew Gnew nn
      have hF : Fnew = f.mid := by cases branch <;> rfl
      have hO : Onew = F := by cases branch <;> rfl
      have hQ : g.mid.p = P+R := by
        cases branch <;> dsimp [g, MathGKM.Markov.advance, P, R, H, G, r, q, F, O] <;> ring
      have hH : Hnew = MathGKM.Markov.S*f.mid.p-rnew-qnew := by
        dsimp only [Hnew]
        rw [hF]
      have hG : Gnew = P+R-rnew*F.p := by
        dsimp only [Gnew]
        rw [hQ,hO]
      refine ⟨hF,hO,hQ,hH,hG,?_⟩
      dsimp only [nn]
      rw [hH,hG]
      simp only [MathGKM.Markov.coeff,Polynomial.coeff_sub,Polynomial.coeff_add]
      constructor
      · rintro ⟨hh,hg⟩
        constructor
        · intro i j
          have h := hh i j
          omega
        · intro i j
          have h := hg i j
          omega
      · rintro ⟨hh,hg⟩
        constructor
        · intro i j
          have h := hh i j
          omega
        · intro i j
          have h := hg i j
          omega
  )
