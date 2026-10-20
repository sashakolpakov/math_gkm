import MathGKM.Targetadef5102f64683848573a50d
import MathGKM.HomogeneousBridgeR2
import Lean
def Accepted55b975b5d0d65ef8e33f0693.interface : MathGKM.Targetadef5102f64683848573a50d.Interface :=
  (
    True.intro
  )
theorem Accepted55b975b5d0d65ef8e33f0693.transport : MathGKM.Targetadef5102f64683848573a50d.Transport Accepted55b975b5d0d65ef8e33f0693.interface :=
  (
    True.intro
  )
theorem Accepted55b975b5d0d65ef8e33f0693.obligation : MathGKM.Targetadef5102f64683848573a50d.Goal Accepted55b975b5d0d65ef8e33f0693.interface :=
  (
    by
      have specialization : ∀ path : List Bool,
        MathGKM.HomogeneousBridgeR2.specializeFrame (MathGKM.HomogeneousBridgeR2.frame path) = MathGKM.Markov.frame path :=
        by
          have spec_U : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.U = MathGKM.Markov.U :=
            by
              simp [MathGKM.HomogeneousBridgeR2.specialize, MathGKM.HomogeneousBridgeR2.U]

          have spec_V : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.V = MathGKM.Markov.V :=
            by
              simp [MathGKM.HomogeneousBridgeR2.specialize, MathGKM.HomogeneousBridgeR2.V]

          have spec_W : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.W = 1 :=
            by
              simp [MathGKM.HomogeneousBridgeR2.specialize, MathGKM.HomogeneousBridgeR2.W]

          have spec_S : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.S = MathGKM.Markov.S :=
            by
              simp [MathGKM.HomogeneousBridgeR2.S, MathGKM.Markov.S, spec_U, spec_V, spec_W]
          have spec_initial : MathGKM.HomogeneousBridgeR2.specializeFrame MathGKM.HomogeneousBridgeR2.initial = MathGKM.Markov.initial :=
            by
              simp [MathGKM.HomogeneousBridgeR2.specializeFrame, MathGKM.HomogeneousBridgeR2.specializeLabel, MathGKM.HomogeneousBridgeR2.initial, MathGKM.Markov.initial,
                spec_U, spec_V, spec_W]
          have spec_advance (f : MathGKM.HomogeneousBridgeR2.Frame) (r : Bool) :
            MathGKM.HomogeneousBridgeR2.specializeFrame (MathGKM.HomogeneousBridgeR2.advance f r) = MathGKM.Markov.advance (MathGKM.HomogeneousBridgeR2.specializeFrame f) r :=
            by
              cases r <;> simp [MathGKM.HomogeneousBridgeR2.advance, MathGKM.Markov.advance, MathGKM.HomogeneousBridgeR2.specializeFrame, MathGKM.HomogeneousBridgeR2.specializeLabel,
                spec_U, spec_V, spec_W, spec_S]
          have lift : ∀ (p : List Bool) (f : MathGKM.HomogeneousBridgeR2.Frame),
              MathGKM.HomogeneousBridgeR2.specializeFrame (p.foldl MathGKM.HomogeneousBridgeR2.advance f) =
                p.foldl MathGKM.Markov.advance (MathGKM.HomogeneousBridgeR2.specializeFrame f) := by
            intro p
            induction p with
            | nil => intro f; rfl
            | cons r p ih =>
              intro f
              simp only [List.foldl_cons]
              rw [ih, spec_advance]
          intro path
          simpa [MathGKM.HomogeneousBridgeR2.frame, MathGKM.Markov.frame, spec_initial] using lift path MathGKM.HomogeneousBridgeR2.initial
      have homogeneous : ∀ path : List Bool, let f := MathGKM.HomogeneousBridgeR2.frame path;
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
      have coefficient_transport : ∀ (p : MathGKM.HomogeneousBridgeR2.TriPoly) (n : ℕ), p.IsHomogeneous n →
        ∀ i j, MathGKM.Markov.coeff (MathGKM.HomogeneousBridgeR2.specialize p) i j =
          if i+j ≤ n then MathGKM.HomogeneousBridgeR2.coeff p i j (n-i-j) else 0 :=
        by
          intro p n h
          have degree_three (e : Fin 3 →₀ ℕ) : e.degree = e 0 + e 1 + e 2 :=
            by
              rw [Finsupp.degree_eq_sum, Fin.sum_univ_three]
          have exponent_values (i j k : ℕ) :
            MathGKM.HomogeneousBridgeR2.exponent i j k 0 = i ∧ MathGKM.HomogeneousBridgeR2.exponent i j k 1 = j ∧ MathGKM.HomogeneousBridgeR2.exponent i j k 2 = k :=
            by
              simp [MathGKM.HomogeneousBridgeR2.exponent]
          have specialize_monomial (e : Fin 3 →₀ ℕ) (r : ℤ) :
            MathGKM.HomogeneousBridgeR2.specialize (MvPolynomial.monomial e r) =
              Polynomial.monomial (e 0) (Polynomial.monomial (e 1) r) :=
            by
              simp only [MathGKM.HomogeneousBridgeR2.specialize, MvPolynomial.coe_eval₂Hom, MvPolynomial.eval₂_monomial,
                RingHom.coe_comp, Function.comp_apply]
              rw [Finsupp.prod_fintype _ _ (by intro i; simp), Fin.prod_univ_three]
              simp only [ite_true, show (1 : Fin 3) ≠ 0 by decide, show (2 : Fin 3) ≠ 0 by decide,
                show (2 : Fin 3) ≠ 1 by decide, ite_false, one_pow, mul_one]
              simp only [MathGKM.Markov.U, MathGKM.Markov.V, ← Polynomial.C_pow]
              rw [mul_comm (Polynomial.X ^ e 0), ← mul_assoc, ← Polynomial.C_mul,
                Polynomial.C_mul_X_pow_eq_monomial, Polynomial.C_mul_X_pow_eq_monomial]
          have specialize_monomial_coeff (e : Fin 3 →₀ ℕ) (r : ℤ) (i j : ℕ) :
            MathGKM.Markov.coeff (MathGKM.HomogeneousBridgeR2.specialize (MvPolynomial.monomial e r)) i j =
              if i = e 0 ∧ j = e 1 then r else 0 :=
            by
              rw [specialize_monomial]
              simp only [MathGKM.Markov.coeff, Polynomial.coeff_monomial]
              split_ifs <;> simp_all [Polynomial.coeff_monomial, eq_comm]
          classical
          induction h using MvPolynomial.IsWeightedHomogeneous.induction_on with
          | zero =>
            intro i j
            simp [MathGKM.Markov.coeff, MathGKM.HomogeneousBridgeR2.coeff]
          | add p q hp hq ihp ihq =>
            intro i j
            simp only [map_add, MathGKM.Markov.coeff, Polynomial.coeff_add] at *
            rw [ihp i j, ihq i j]
            split_ifs <;> simp [MathGKM.HomogeneousBridgeR2.coeff, MvPolynomial.coeff_add]
          | monomial e r he =>
            intro i j
            have hn : e 0 + e 1 + e 2 = n := by
              change Finsupp.weight (fun _ : Fin 3 => 1) e = n at he
              rw [← Finsupp.degree_eq_weight_one] at he
              simpa [degree_three] using he
            rw [specialize_monomial_coeff]
            by_cases hij : i+j ≤ n
            · rw [if_pos hij]
              simp only [MathGKM.HomogeneousBridgeR2.coeff, MvPolynomial.coeff_monomial]
              have hex : MathGKM.HomogeneousBridgeR2.exponent i j (n-i-j) = e ↔ i = e 0 ∧ j = e 1 := by
                constructor
                · intro hx
                  have h0 := congrArg (fun x : Fin 3 →₀ ℕ => x 0) hx
                  have h1 := congrArg (fun x : Fin 3 →₀ ℕ => x 1) hx
                  simpa [MathGKM.HomogeneousBridgeR2.exponent] using And.intro h0 h1
                · rintro ⟨hi,hj⟩
                  ext x
                  fin_cases x <;> simp [MathGKM.HomogeneousBridgeR2.exponent, hi, hj] <;> omega
              simp only [show (e = MathGKM.HomogeneousBridgeR2.exponent i j (n-i-j) ↔ i = e 0 ∧ j = e 1) from eq_comm.trans hex]
            · rw [if_neg hij, if_neg]
              rintro ⟨hi,hj⟩
              omega
      intro path
      dsimp only
      rw [← specialization path]
      have hs := homogeneous path
      exact ⟨coefficient_transport _ _ hs.1,
        coefficient_transport _ _ hs.2.1, coefficient_transport _ _ hs.2.2⟩
  )
