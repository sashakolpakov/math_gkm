import MathGKM.Targetd9dba78096c571d112592fdc
import MathGKM.Accepted0d2b83c94b4594d717e36331
import Lean
def Accepted25cc13a3ad331403dbe48d54.interface : MathGKM.Targetd9dba78096c571d112592fdc.Interface :=
  (
    True.intro
  )
theorem Accepted25cc13a3ad331403dbe48d54.transport : MathGKM.Targetd9dba78096c571d112592fdc.Transport Accepted25cc13a3ad331403dbe48d54.interface :=
  (
    True.intro
  )
theorem Accepted25cc13a3ad331403dbe48d54.obligation : MathGKM.Targetd9dba78096c571d112592fdc.Goal Accepted25cc13a3ad331403dbe48d54.interface :=
  (
    (show (∀ path : List Bool, let f := MathGKM.Markov.frame path; (∀ E ∈ [f.lo,f.mid,f.hi], E.p.eval 0 = if E.a=0 then (1 : Polynomial ℤ) else Polynomial.X^E.b*(1+Polynomial.X)^(E.a-1))) from
    by
      let ev := fun P : MathGKM.Markov.BiPoly => P.eval (0 : Polynomial ℤ)
      let val := fun E : MathGKM.Markov.Label => if E.a=0 then (1 : Polynomial ℤ) else Polynomial.X^E.b*(1+Polynomial.X)^(E.a-1)
      have positive (F M O : MathGKM.Markov.Label) (hf : 0<F.a) (hm : 0<M.a)
          (hF : ev F.p = val F) (hM : ev M.p = val M) :
          ev (MathGKM.Markov.S*F.p*M.p-MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*O.p) =
            Polynomial.X^(F.b+M.b)*(1+Polynomial.X)^(F.a+M.a-1) := by
        have hz : (0 : Polynomial ℤ)^F.a=0 := zero_pow (by omega)
        simp only [ev, Polynomial.eval_sub,Polynomial.eval_mul,Polynomial.eval_pow,
          MathGKM.Markov.S,Polynomial.eval_add,Polynomial.eval_one,MathGKM.Markov.U,MathGKM.Markov.V,Polynomial.eval_X,Polynomial.eval_C,
          hz,zero_mul,sub_zero,zero_add]
        change (Polynomial.X+1)*ev F.p*ev M.p = _
        rw [hF,hM]
        simp only [val,if_neg (by omega : F.a≠0),if_neg (by omega : M.a≠0)]
        have he : F.a+M.a-1=(F.a-1)+(M.a-1)+1 := by omega
        rw [he,pow_add,pow_add,pow_add]
        ring
      have inv : ∀ path : List Bool, let f := MathGKM.Markov.frame path
          (f.lo.a=0 → f.lo=⟨0,1,1⟩) ∧ 0<f.hi.a ∧
          ev f.lo.p=val f.lo ∧ ev f.mid.p=val f.mid ∧ ev f.hi.p=val f.hi := by
        intro path
        induction path using List.reverseRecOn with
        | nil =>
          norm_num [MathGKM.Markov.frame,MathGKM.Markov.initial,ev,val,MathGKM.Markov.U,MathGKM.Markov.V]
        | append_singleton path branch ih =>
          have step : MathGKM.Markov.frame (path++[branch])=MathGKM.Markov.advance (MathGKM.Markov.frame path) branch := by
            simp [MathGKM.Markov.frame,List.foldl_append]
          have ar := Accepted0d2b83c94b4594d717e36331.obligation path
          change (MathGKM.Markov.frame path).mid.a=(MathGKM.Markov.frame path).lo.a+(MathGKM.Markov.frame path).hi.a ∧
            (MathGKM.Markov.frame path).mid.b=(MathGKM.Markov.frame path).lo.b+(MathGKM.Markov.frame path).hi.b ∧ _ at ar
          dsimp only at ih ⊢
          rw [step]
          rcases ih with ⟨he,hh,hl,hmid,hhi⟩
          have hm : 0<(MathGKM.Markov.frame path).mid.a := ar.2.2.2.2.2.1
          cases branch <;> simp only [MathGKM.Markov.advance,Bool.false_eq_true,↓reduceIte]
          · refine ⟨he,hm,hl,?_,hmid⟩
            change ev _ = if _ then _ else _
            dsimp only [MathGKM.Markov.Label.a,MathGKM.Markov.Label.b]
            rw [if_neg (by omega)]
            by_cases hla : (MathGKM.Markov.frame path).lo.a=0
            · have hlo := he hla
              have hma : (MathGKM.Markov.frame path).mid.a=(MathGKM.Markov.frame path).hi.a := by omega
              have hmb : (MathGKM.Markov.frame path).mid.b=1+(MathGKM.Markov.frame path).hi.b := by
                rw [ar.2.1,hlo]
              simp only [hlo]
              simp only [ev,Polynomial.eval_sub,Polynomial.eval_mul,Polynomial.eval_pow,
                MathGKM.Markov.S,Polynomial.eval_add,Polynomial.eval_one,MathGKM.Markov.U,MathGKM.Markov.V,Polynomial.eval_X,Polynomial.eval_C,
                zero_add,pow_zero,pow_one,mul_one,one_mul]
              change (Polynomial.X+1)*ev (MathGKM.Markov.frame path).mid.p-Polynomial.X*ev (MathGKM.Markov.frame path).hi.p = _
              rw [hmid,hhi]
              simp only [val,if_neg (by omega : (MathGKM.Markov.frame path).mid.a≠0),if_neg (by omega : (MathGKM.Markov.frame path).hi.a≠0)]
              rw [hma,hmb]
              simp only [zero_add,Nat.add_comm 1, pow_add,pow_one]
              ring
            · exact positive _ _ _ (by omega) hm hl hmid
          · refine ⟨?_,hh,hmid,?_,hhi⟩
            · intro hz
              omega
            · change ev _ = if _ then _ else _
              dsimp only [MathGKM.Markov.Label.a,MathGKM.Markov.Label.b]
              rw [if_neg (by omega)]
              convert positive _ _ _ hh hm hhi hmid using 1 <;> congr 2 <;> omega
      intro path
      dsimp only
      intro E hE
      have hi := inv path
      simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
      rcases hE with rfl|rfl|rfl
      · exact hi.2.2.1
      · exact hi.2.2.2.1
      · exact hi.2.2.2.2
    )
  )
