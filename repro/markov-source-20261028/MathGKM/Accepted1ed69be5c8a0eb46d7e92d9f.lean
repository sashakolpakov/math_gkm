import MathGKM.Target710651987c4eae27a96fc5e7
import MathGKM.Accepted0d2b83c94b4594d717e36331
import Lean
def Accepted1ed69be5c8a0eb46d7e92d9f.interface : MathGKM.Target710651987c4eae27a96fc5e7.Interface :=
  (
    True.intro
  )
theorem Accepted1ed69be5c8a0eb46d7e92d9f.transport : MathGKM.Target710651987c4eae27a96fc5e7.Transport Accepted1ed69be5c8a0eb46d7e92d9f.interface :=
  (
    True.intro
  )
theorem Accepted1ed69be5c8a0eb46d7e92d9f.obligation : MathGKM.Target710651987c4eae27a96fc5e7.Goal Accepted1ed69be5c8a0eb46d7e92d9f.interface :=
  (
    (show (∀ path : List Bool, let f := MathGKM.Markov.frame path; f.lo.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X^f.lo.a*(1+Polynomial.X)^(f.lo.b-1) ∧ f.mid.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X^f.mid.a*(1+Polynomial.X)^(f.mid.b-1) ∧ f.hi.p.map (Polynomial.evalRingHom (0 : ℤ)) = Polynomial.X^f.hi.a*(1+Polynomial.X)^(f.hi.b-1)) from
    by
      let ev := fun P : MathGKM.Markov.BiPoly => P.map (Polynomial.evalRingHom (0 : ℤ))
      have transform (F M O : MathGKM.Markov.Label) (hf : 0<F.b) (hm : 0<M.b)
          (hF : ev F.p = Polynomial.X^F.a*(1+Polynomial.X)^(F.b-1))
          (hM : ev M.p = Polynomial.X^M.a*(1+Polynomial.X)^(M.b-1)) :
          ev (MathGKM.Markov.S*F.p*M.p-MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*O.p) =
            Polynomial.X^(F.a+M.a)*(1+Polynomial.X)^(F.b+M.b-1) := by
        have hz : (0 : Polynomial ℤ)^F.b = 0 := zero_pow (by omega)
        simp only [ev, Polynomial.map_sub, Polynomial.map_mul, Polynomial.map_pow,
          MathGKM.Markov.S, Polynomial.map_add, Polynomial.map_one, MathGKM.Markov.U, MathGKM.Markov.V, Polynomial.map_X,
          Polynomial.map_C, Polynomial.coe_evalRingHom, Polynomial.eval_X,
          Polynomial.C_0, hz, mul_zero, zero_mul, sub_zero, add_zero]
        change (Polynomial.X+1)*ev F.p*ev M.p = _
        rw [hF,hM]
        have he : F.b+M.b-1 = (F.b-1)+(M.b-1)+1 := by omega
        rw [he, pow_add, pow_add, pow_add]
        ring
      intro path
      induction path using List.reverseRecOn with
      | nil =>
        norm_num [MathGKM.Markov.frame,MathGKM.Markov.initial,MathGKM.Markov.U,MathGKM.Markov.V]
        ring
      | append_singleton path branch ih =>
        have step : MathGKM.Markov.frame (path++[branch]) = MathGKM.Markov.advance (MathGKM.Markov.frame path) branch := by
          simp [MathGKM.Markov.frame,List.foldl_append]
        have ar := Accepted0d2b83c94b4594d717e36331.obligation path
        change (MathGKM.Markov.frame path).mid.a = (MathGKM.Markov.frame path).lo.a+(MathGKM.Markov.frame path).hi.a ∧
          (MathGKM.Markov.frame path).mid.b = (MathGKM.Markov.frame path).lo.b+(MathGKM.Markov.frame path).hi.b ∧ _ at ar
        dsimp only at ih ⊢
        rw [step]
        have hm : 0<(MathGKM.Markov.frame path).mid.b := by omega
        cases branch <;> simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte]
        · exact ⟨ih.1,transform _ _ _ ar.2.2.2.1 hm ih.1 ih.2.1,ih.2.1⟩
        · refine ⟨ih.2.1,?_,ih.2.2⟩
          convert transform _ _ _ ar.2.2.2.2.1 hm ih.2.2 ih.2.1 using 1 <;>
            congr 2 <;> omega
    )
  )
