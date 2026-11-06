import MathGKM.Targete704a6f70f27a526fc9f56b8
import MathGKM.Accepted13c39de6e1dbb404698c5095
import Lean
def Accepted10f5df6c49aadbaab7c023ce.interface : MathGKM.Targete704a6f70f27a526fc9f56b8.Interface :=
  (
    True.intro
  )
theorem Accepted10f5df6c49aadbaab7c023ce.transport : MathGKM.Targete704a6f70f27a526fc9f56b8.Transport Accepted10f5df6c49aadbaab7c023ce.interface :=
  (
    True.intro
  )
theorem Accepted10f5df6c49aadbaab7c023ce.obligation : MathGKM.Targete704a6f70f27a526fc9f56b8.Goal Accepted10f5df6c49aadbaab7c023ce.interface :=
  (
    (show (∀ path : List Bool, let f := MathGKM.Markov.frame path; ∀ E ∈ [f.lo,f.mid,f.hi], (∀ i j, i+j=E.a+E.b-1 → MathGKM.Markov.coeff E.p i j = ((E.a+E.b-1).choose i : ℤ))) from
    by
      classical
      let H := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => P.support.sum (fun i => Polynomial.monomial i ((P.coeff i).support.sum (fun j => Polynomial.monomial j (Polynomial.monomial (d-i-j) (MathGKM.Markov.coeff P i j)))))
      let Uh : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.X
      let Vh : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.C Polynomial.X
      let W : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.C (Polynomial.C Polynomial.X)
      let proj : Polynomial (Polynomial (Polynomial ℤ)) →+* MathGKM.Markov.BiPoly :=
        Polynomial.mapRingHom (Polynomial.mapRingHom (Polynomial.evalRingHom (0 : ℤ)))
      let top := fun E : MathGKM.Markov.Label => proj (H E.p (E.a+E.b-1))
      have ht := Accepted13c39de6e1dbb404698c5095.obligation
      have hc : ∀ P d i j, ((H P d).coeff i).coeff j = Polynomial.monomial (d-i-j) (MathGKM.Markov.coeff P i j) := ht.1
      have ini : H 1 0=1 ∧ H ((MathGKM.Markov.U+MathGKM.Markov.V)^2+MathGKM.Markov.U) 2=(Uh+Vh)^2+Uh*W ∧ H (MathGKM.Markov.U+MathGKM.Markov.V) 1=Uh+Vh := ht.2.2.2.2.2.1
      have upd : ∀ path : List Bool, ∀ branch : Bool,
          let f := MathGKM.Markov.frame path;
          let F := if branch then f.hi else f.lo;
          let O := if branch then f.lo else f.hi;
          let Q := (MathGKM.Markov.advance f branch).mid;
          H Q.p (Q.a+Q.b-1) = (Uh+Vh+W)*H F.p (F.a+F.b-1)*H f.mid.p (f.mid.a+f.mid.b-1)- Uh^F.a*Vh^F.b*W^(F.a+F.b)*H O.p (O.a+O.b-1) := ht.2.2.2.2.2.2
      have pu : proj Uh=MathGKM.Markov.U := by simp [proj,Uh,MathGKM.Markov.U]
      have pv : proj Vh=MathGKM.Markov.V := by simp [proj,Vh,MathGKM.Markov.V]
      have pw : proj W=0 := by simp [proj,W]
      have update (path : List Bool) (branch : Bool) :
          top (MathGKM.Markov.advance (MathGKM.Markov.frame path) branch).mid =
            (MathGKM.Markov.U+MathGKM.Markov.V)*top (if branch then (MathGKM.Markov.frame path).hi else (MathGKM.Markov.frame path).lo)*top (MathGKM.Markov.frame path).mid := by
        have ar := Accepted0d2b83c94b4594d717e36331.obligation path
        have hp : 0<(if branch then (MathGKM.Markov.frame path).hi else (MathGKM.Markov.frame path).lo).a+
            (if branch then (MathGKM.Markov.frame path).hi else (MathGKM.Markov.frame path).lo).b := by
          cases branch <;> simp only [Bool.false_eq_true,↓reduceIte] <;> omega
        have h := congrArg proj (upd path branch)
        simpa only [proj, Polynomial.coe_mapRingHom, Polynomial.map_sub, Polynomial.map_mul, Polynomial.map_add, Polynomial.map_pow, Uh, Vh, W, Polynomial.map_X, Polynomial.map_C, Polynomial.coe_evalRingHom, Polynomial.eval_X, Polynomial.C_0, zero_pow (by omega : (if branch then (MathGKM.Markov.frame path).hi else (MathGKM.Markov.frame path).lo).a+(if branch then (MathGKM.Markov.frame path).hi else (MathGKM.Markov.frame path).lo).b≠0),mul_zero,zero_mul,sub_zero,add_zero,MathGKM.Markov.U,MathGKM.Markov.V,top] using h
      have inv : ∀ path : List Bool, let f := MathGKM.Markov.frame path;
          top f.lo=(MathGKM.Markov.U+MathGKM.Markov.V)^(f.lo.a+f.lo.b-1) ∧
          top f.mid=(MathGKM.Markov.U+MathGKM.Markov.V)^(f.mid.a+f.mid.b-1) ∧
          top f.hi=(MathGKM.Markov.U+MathGKM.Markov.V)^(f.hi.a+f.hi.b-1) := by
        intro path
        induction path using List.reverseRecOn with
        | nil =>
          change proj (H 1 0)=(MathGKM.Markov.U+MathGKM.Markov.V)^0 ∧ proj (H ((MathGKM.Markov.U+MathGKM.Markov.V)^2+MathGKM.Markov.U) 2)=(MathGKM.Markov.U+MathGKM.Markov.V)^2 ∧ proj (H (MathGKM.Markov.U+MathGKM.Markov.V) 1)=(MathGKM.Markov.U+MathGKM.Markov.V)^1
          rw [ini.1,ini.2.1,ini.2.2]
          simp [map_add,map_pow,map_mul,pu,pv,pw]
        | append_singleton path branch ih =>
          have step : MathGKM.Markov.frame (path++[branch])=MathGKM.Markov.advance (MathGKM.Markov.frame path) branch := by simp [MathGKM.Markov.frame,List.foldl_append]
          have ar := Accepted0d2b83c94b4594d717e36331.obligation path
          change (MathGKM.Markov.frame path).mid.a=(MathGKM.Markov.frame path).lo.a+(MathGKM.Markov.frame path).hi.a ∧
            (MathGKM.Markov.frame path).mid.b=(MathGKM.Markov.frame path).lo.b+(MathGKM.Markov.frame path).hi.b ∧ _ at ar
          dsimp only at ih ⊢
          rw [step]
          have h := update path branch
          cases branch <;> simp only [MathGKM.Markov.advance,Bool.false_eq_true,↓reduceIte] at h ⊢
          · refine ⟨ih.1,?_,ih.2.1⟩
            rw [h,ih.1,ih.2.1,← pow_succ',← pow_add]
            congr 1
            omega
          · refine ⟨ih.2.1,?_,ih.2.2⟩
            rw [h,ih.2.2,ih.2.1,← pow_succ',← pow_add]
            congr 1
            omega
      have binomial (d i j : ℕ) (hij : i+j=d) : MathGKM.Markov.coeff ((MathGKM.Markov.U+MathGKM.Markov.V)^d) i j=(d.choose i : ℤ) := by
        dsimp [MathGKM.Markov.coeff,MathGKM.Markov.U,MathGKM.Markov.V]
        rw [Polynomial.coeff_X_add_C_pow]
        simp only [Polynomial.coeff_mul_natCast]
        have he : d-i=j := by omega
        rw [he]
        simp
      intro path
      dsimp only
      intro E hE
      have hi := inv path
      have htop : top E=(MathGKM.Markov.U+MathGKM.Markov.V)^(E.a+E.b-1) := by
        simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
        rcases hE with rfl|rfl|rfl
        · exact hi.1
        · exact hi.2.1
        · exact hi.2.2
      intro i j hij
      have he := congrArg (fun P : MathGKM.Markov.BiPoly => MathGKM.Markov.coeff P i j) htop
      have htcoeff : MathGKM.Markov.coeff (top E) i j=MathGKM.Markov.coeff E.p i j := by
        dsimp only [top,proj,Polynomial.coe_mapRingHom,MathGKM.Markov.coeff]
        simp only [Polynomial.coeff_map,Polynomial.coe_mapRingHom]
        rw [hc]
        have hexp : E.a+E.b-1-i-j=0 := by omega
        simp [hexp,MathGKM.Markov.coeff]
      rw [htcoeff,binomial _ _ _ hij] at he
      exact he

    )
  )
