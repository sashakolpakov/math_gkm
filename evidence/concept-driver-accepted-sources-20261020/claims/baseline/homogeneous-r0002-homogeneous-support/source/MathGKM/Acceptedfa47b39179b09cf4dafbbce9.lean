import MathGKM.Target49a048f469bee2b91a031b4c
import MathGKM.HomogeneousBridgeR2
import Lean
def Acceptedfa47b39179b09cf4dafbbce9.interface : MathGKM.Target49a048f469bee2b91a031b4c.Interface :=
  (
    True.intro
  )
theorem Acceptedfa47b39179b09cf4dafbbce9.transport : MathGKM.Target49a048f469bee2b91a031b4c.Transport Acceptedfa47b39179b09cf4dafbbce9.interface :=
  (
    True.intro
  )
theorem Acceptedfa47b39179b09cf4dafbbce9.obligation : MathGKM.Target49a048f469bee2b91a031b4c.Goal Acceptedfa47b39179b09cf4dafbbce9.interface :=
  (
    by
      have all_homogeneous : ∀ path : List Bool, let f := MathGKM.HomogeneousBridgeR2.frame path;
        f.lo.p.IsHomogeneous (f.lo.a+f.lo.b-1) ∧
        f.mid.p.IsHomogeneous (f.mid.a+f.mid.b-1) ∧
        f.hi.p.IsHomogeneous (f.hi.a+f.hi.b-1) :=
        by
          let Inv : MathGKM.HomogeneousBridgeR2.Frame → Prop := fun f =>
            f.mid.a = f.lo.a+f.hi.a ∧ f.mid.b = f.lo.b+f.hi.b ∧
            0 < f.lo.a+f.lo.b ∧ 0 < f.hi.a+f.hi.b ∧
            f.lo.p.IsHomogeneous (f.lo.a+f.lo.b-1) ∧
            f.mid.p.IsHomogeneous (f.mid.a+f.mid.b-1) ∧
            f.hi.p.IsHomogeneous (f.hi.a+f.hi.b-1)
          have initial_inv : Inv MathGKM.HomogeneousBridgeR2.initial :=
            by
              have hu : MathGKM.HomogeneousBridgeR2.U.IsHomogeneous 1 := MvPolynomial.isHomogeneous_X _ _
              have hv : MathGKM.HomogeneousBridgeR2.V.IsHomogeneous 1 := MvPolynomial.isHomogeneous_X _ _
              have hw : MathGKM.HomogeneousBridgeR2.W.IsHomogeneous 1 := MvPolynomial.isHomogeneous_X _ _
              refine ⟨rfl, rfl, by decide, by decide, MvPolynomial.isHomogeneous_one _ _, ?_, hu.add hv⟩
              exact ((hu.add hv).pow 2).add (hu.mul hw)
          have step_inv (f : MathGKM.HomogeneousBridgeR2.Frame) (r : Bool) (h : Inv f) : Inv (MathGKM.HomogeneousBridgeR2.advance f r) :=
            by
              rcases h with ⟨ha,hb,hl,hh,hlo,hm,hhi⟩
              have hmid : 0 < f.mid.a+f.mid.b := by omega
              have hs : MathGKM.HomogeneousBridgeR2.S.IsHomogeneous 1 :=
                ((MvPolynomial.isHomogeneous_X ℤ 0).add (MvPolynomial.isHomogeneous_X ℤ 1)).add
                  (MvPolynomial.isHomogeneous_X ℤ 2)
              have left_first : (MathGKM.HomogeneousBridgeR2.S*f.lo.p*f.mid.p).IsHomogeneous
                  (f.lo.a+f.mid.a+(f.lo.b+f.mid.b)-1) := by
                convert (hs.mul hlo).mul hm using 1 <;> first | omega | rfl
              have left_second : (MathGKM.HomogeneousBridgeR2.U^f.lo.a*MathGKM.HomogeneousBridgeR2.V^f.lo.b*MathGKM.HomogeneousBridgeR2.W^(f.lo.a+f.lo.b)*f.hi.p).IsHomogeneous
                  (f.lo.a+f.mid.a+(f.lo.b+f.mid.b)-1) := by
                convert (((MvPolynomial.isHomogeneous_X_pow (R:=ℤ) (0 : Fin 3) f.lo.a).mul
                  (MvPolynomial.isHomogeneous_X_pow (R:=ℤ) (1 : Fin 3) f.lo.b)).mul
                  (MvPolynomial.isHomogeneous_X_pow (R:=ℤ) (2 : Fin 3) (f.lo.a+f.lo.b))).mul hhi using 1 <;> first | omega | rfl
              have right_first : (MathGKM.HomogeneousBridgeR2.S*f.hi.p*f.mid.p).IsHomogeneous
                  (f.mid.a+f.hi.a+(f.mid.b+f.hi.b)-1) := by
                convert (hs.mul hhi).mul hm using 1 <;> first | omega | rfl
              have right_second : (MathGKM.HomogeneousBridgeR2.U^f.hi.a*MathGKM.HomogeneousBridgeR2.V^f.hi.b*MathGKM.HomogeneousBridgeR2.W^(f.hi.a+f.hi.b)*f.lo.p).IsHomogeneous
                  (f.mid.a+f.hi.a+(f.mid.b+f.hi.b)-1) := by
                convert (((MvPolynomial.isHomogeneous_X_pow (R:=ℤ) (0 : Fin 3) f.hi.a).mul
                  (MvPolynomial.isHomogeneous_X_pow (R:=ℤ) (1 : Fin 3) f.hi.b)).mul
                  (MvPolynomial.isHomogeneous_X_pow (R:=ℤ) (2 : Fin 3) (f.hi.a+f.hi.b))).mul hlo using 1 <;> first | omega | rfl
              cases r <;> simp only [MathGKM.HomogeneousBridgeR2.advance, Bool.false_eq_true, ↓reduceIte, Inv]
              · exact ⟨True.intro,True.intro,hl,hmid,hlo,left_first.sub left_second,hm⟩
              · exact ⟨True.intro,True.intro,hmid,hh,hm,right_first.sub right_second,hhi⟩
          have lift : ∀ (p : List Bool) (f : MathGKM.HomogeneousBridgeR2.Frame), Inv f → Inv (p.foldl MathGKM.HomogeneousBridgeR2.advance f) := by
            intro p
            induction p with
            | nil => intro f h; exact h
            | cons r p ih =>
              intro f h
              exact ih (MathGKM.HomogeneousBridgeR2.advance f r) (step_inv f r h)
          intro path
          exact (lift path MathGKM.HomogeneousBridgeR2.initial initial_inv).2.2.2.2
      intro path
      have hs := all_homogeneous path
      refine ⟨hs, ?_⟩
      intro l hl i j k hc
      have hh : l.p.IsHomogeneous (l.a+l.b-1) := by
        simp only [List.mem_cons, List.not_mem_nil, or_false] at hl
        rcases hl with rfl | rfl | rfl
        · exact hs.1
        · exact hs.2.1
        · exact hs.2.2
      have hd : (MathGKM.HomogeneousBridgeR2.exponent i j k).degree = i+j+k := by
        simp [Finsupp.degree_eq_sum, Fin.sum_univ_three, MathGKM.HomogeneousBridgeR2.exponent]
      by_contra he
      exact hc (hh.coeff_eq_zero (by simpa only [hd] using he))
  )
