import MathGKM.Target57b037c7743f2dd808050b57
import MathGKM.Accepted0d2b83c94b4594d717e36331
import Lean
def Accepted13c39de6e1dbb404698c5095.interface : MathGKM.Target57b037c7743f2dd808050b57.Interface :=
  (
    True.intro
  )
theorem Accepted13c39de6e1dbb404698c5095.transport : MathGKM.Target57b037c7743f2dd808050b57.Transport Accepted13c39de6e1dbb404698c5095.interface :=
  (
    True.intro
  )
theorem Accepted13c39de6e1dbb404698c5095.obligation : MathGKM.Target57b037c7743f2dd808050b57.Goal Accepted13c39de6e1dbb404698c5095.interface :=
  (
    (show (let H := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => P.support.sum (fun i => Polynomial.monomial i ((P.coeff i).support.sum (fun j => Polynomial.monomial j (Polynomial.monomial (d-i-j) (MathGKM.Markov.coeff P i j))))); let bd := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => ∀ i j : ℕ, d < i+j → MathGKM.Markov.coeff P i j = 0; let Uh : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.X; let Vh : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.C Polynomial.X; let W : Polynomial (Polynomial (Polynomial ℤ)) := Polynomial.C (Polynomial.C Polynomial.X); (∀ P d i j, ((H P d).coeff i).coeff j = Polynomial.monomial (d-i-j) (MathGKM.Markov.coeff P i j)) ∧ (∀ P d, bd P d → ∀ i j k, ((((H P d).coeff i).coeff j).coeff k ≠ 0 → i+j+k=d)) ∧ (∀ P d, (H P d).map (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ))) = P) ∧ (∀ P Q d, H (P-Q) d = H P d-H Q d) ∧ (∀ P Q d e, bd P d → bd Q e → H (P*Q) (d+e) = H P d*H Q e) ∧ (H 1 0=1 ∧ H ((MathGKM.Markov.U+MathGKM.Markov.V)^2+MathGKM.Markov.U) 2=(Uh+Vh)^2+Uh*W ∧ H (MathGKM.Markov.U+MathGKM.Markov.V) 1=Uh+Vh) ∧ (∀ path : List Bool, ∀ branch : Bool, let f := MathGKM.Markov.frame path; let F := if branch then f.hi else f.lo; let O := if branch then f.lo else f.hi; let Q := (MathGKM.Markov.advance f branch).mid; H Q.p (Q.a+Q.b-1) = (Uh+Vh+W)*H F.p (F.a+F.b-1)*H f.mid.p (f.mid.a+f.mid.b-1)- Uh^F.a*Vh^F.b*W^(F.a+F.b)*H O.p (O.a+O.b-1))) from
    by
      classical
      intro H bd Uh Vh W
      have reachable_support : let bd := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => ∀ i j : ℕ, d < i+j → MathGKM.Markov.coeff P i j = 0;
        (∀ path : List Bool, let f := MathGKM.Markov.frame path;
          bd f.lo.p (f.lo.a+f.lo.b-1) ∧
          bd f.mid.p (f.mid.a+f.mid.b-1) ∧
          bd f.hi.p (f.hi.a+f.hi.b-1)) ∧
        bd (1 : MathGKM.Markov.BiPoly) 0 ∧ bd (MathGKM.Markov.U+MathGKM.Markov.V) 1 := by
        intro bd
        have mono (a b : ℕ) : bd (MathGKM.Markov.U^a*MathGKM.Markov.V^b) (a+b) := by
          intro i j h
          simp only [MathGKM.Markov.coeff, MathGKM.Markov.U, MathGKM.Markov.V, ← Polynomial.C_pow, Polynomial.coeff_mul_C,
            Polynomial.coeff_X_pow]
          split_ifs with hi
          · subst i
            have hj : j ≠ b := by omega
            simp [Polynomial.coeff_X_pow, hj]
          · simp
        have one : bd (1 : MathGKM.Markov.BiPoly) 0 := by
          simpa using mono 0 0
        have add (P Q : MathGKM.Markov.BiPoly) (d e : ℕ) (hP : bd P d) (hQ : bd Q e) :
            bd (P+Q) (max d e) := by
          intro i j h
          dsimp [bd, MathGKM.Markov.coeff] at hP hQ
          simp only [MathGKM.Markov.coeff, Polynomial.coeff_add]
          rw [hP i j (by omega), hQ i j (by omega)]
          rfl
        have sub (P Q : MathGKM.Markov.BiPoly) (d e : ℕ) (hP : bd P d) (hQ : bd Q e) :
            bd (P-Q) (max d e) := by
          intro i j h
          dsimp [bd, MathGKM.Markov.coeff] at hP hQ
          simp only [MathGKM.Markov.coeff, Polynomial.coeff_sub]
          rw [hP i j (by omega), hQ i j (by omega)]
          rfl
        have mul (P Q : MathGKM.Markov.BiPoly) (d e : ℕ) (hP : bd P d) (hQ : bd Q e) :
            bd (P*Q) (d+e) := by
          intro i j h
          dsimp [bd, MathGKM.Markov.coeff] at hP hQ
          dsimp [MathGKM.Markov.coeff]
          rw [Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
          apply Finset.sum_eq_zero
          intro uv huv
          rw [Polynomial.coeff_mul]
          apply Finset.sum_eq_zero
          intro st hst
          have huv' := Finset.HasAntidiagonal.mem_antidiagonal.mp huv
          have hst' := Finset.HasAntidiagonal.mem_antidiagonal.mp hst
          by_cases hh : d < uv.1+st.1
          · rw [hP uv.1 st.1 hh, zero_mul]
          · rw [hQ uv.2 st.2 (by omega), mul_zero]
        have weaken (P : MathGKM.Markov.BiPoly) (d e : ℕ) (hP : bd P d) (hde : d ≤ e) : bd P e := by
          intro i j h
          exact hP i j (by omega)
        have uv : bd (MathGKM.Markov.U+MathGKM.Markov.V) 1 := by
          have hu := mono 1 0
          have hv := mono 0 1
          simpa using add MathGKM.Markov.U MathGKM.Markov.V 1 1 (by simpa using hu) (by simpa using hv)
        have s : bd MathGKM.Markov.S 1 := by
          simpa [MathGKM.Markov.S] using add (MathGKM.Markov.U+MathGKM.Markov.V) 1 1 0 uv one
        have inv : ∀ path : List Bool, let f := MathGKM.Markov.frame path
            bd f.lo.p (f.lo.a+f.lo.b-1) ∧
            bd f.mid.p (f.mid.a+f.mid.b-1) ∧
            bd f.hi.p (f.hi.a+f.hi.b-1) := by
          intro path
          induction path using List.reverseRecOn with
          | nil =>
            change bd 1 0 ∧ bd ((MathGKM.Markov.U+MathGKM.Markov.V)^2+MathGKM.Markov.U) 2 ∧ bd (MathGKM.Markov.U+MathGKM.Markov.V) 1
            refine ⟨one, ?_, uv⟩
            have hh : bd ((MathGKM.Markov.U+MathGKM.Markov.V)^2) 2 := by simpa [pow_two] using mul (MathGKM.Markov.U+MathGKM.Markov.V) (MathGKM.Markov.U+MathGKM.Markov.V) 1 1 uv uv
            have hu : bd MathGKM.Markov.U 1 := by simpa using mono 1 0
            simpa using add _ _ 2 1 hh hu
          | append_singleton path branch ih =>
            have step : MathGKM.Markov.frame (path ++ [branch]) = MathGKM.Markov.advance (MathGKM.Markov.frame path) branch := by
              simp [MathGKM.Markov.frame, List.foldl_append]
            have ar := Accepted0d2b83c94b4594d717e36331.obligation path
            change (MathGKM.Markov.frame path).mid.a = (MathGKM.Markov.frame path).lo.a + (MathGKM.Markov.frame path).hi.a ∧
              (MathGKM.Markov.frame path).mid.b = (MathGKM.Markov.frame path).lo.b + (MathGKM.Markov.frame path).hi.b ∧ _ at ar
            dsimp only at ih ⊢
            rw [step]
            rcases ih with ⟨hl,hm,hh⟩
            have hml : 0 < (MathGKM.Markov.frame path).mid.b := by omega
            cases branch <;> simp only [MathGKM.Markov.advance, Bool.false_eq_true, ↓reduceIte]
            · refine ⟨hl, ?_, hm⟩
              apply weaken _ _ _ (sub _ _ _ _
                (mul _ _ _ _ (mul _ _ _ _ s hl) hm)
                (mul _ _ _ _ (mono _ _) hh))
              omega
            · refine ⟨hm, ?_, hh⟩
              apply weaken _ _ _ (sub _ _ _ _
                (mul _ _ _ _ (mul _ _ _ _ s hh) hm)
                (mul _ _ _ _ (mono _ _) hl))
              omega
        exact ⟨inv,one,uv⟩
      have hc (P : MathGKM.Markov.BiPoly) (d i j : ℕ) :
          ((H P d).coeff i).coeff j = Polynomial.monomial (d-i-j) (MathGKM.Markov.coeff P i j) := by
        dsimp [H]
        simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_monomial]
        rw [Finset.sum_eq_single i]
        · simp only [ite_true, Polynomial.finsetSum_coeff, Polynomial.coeff_monomial]
          rw [Finset.sum_eq_single j]
          · simp
          · intro b hb hbj
            simp [hbj]
          · intro hj
            have hz : MathGKM.Markov.coeff P i j = 0 := by
              exact by simpa only [Polynomial.mem_support_iff, not_not, MathGKM.Markov.coeff] using hj
            simp [hz]
        · intro b hb hbi
          simp [hbi]
        · intro hi
          have hz : P.coeff i = 0 := by simpa only [Polynomial.mem_support_iff, not_not] using hi
          simp [MathGKM.Markov.coeff, hz]
      have hom (P : MathGKM.Markov.BiPoly) (d : ℕ) (hp : bd P d) (i j k : ℕ)
          (hne : (((H P d).coeff i).coeff j).coeff k ≠ 0) : i+j+k=d := by
        rw [hc, Polynomial.coeff_monomial] at hne
        by_cases he : d-i-j = k
        · have hb : i+j ≤ d := by
            by_contra h
            have hz := hp i j (by omega)
            simp [he,hz] at hne
          omega
        · simp [he] at hne
      have ev (P : MathGKM.Markov.BiPoly) (d : ℕ) :
          (H P d).map (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ))) = P := by
        apply Polynomial.ext
        intro i
        apply Polynomial.ext
        intro j
        simp only [Polynomial.coeff_map, Polynomial.coe_mapRingHom]
        rw [hc]
        simp [MathGKM.Markov.coeff]
      have sub (P Q : MathGKM.Markov.BiPoly) (d : ℕ) : H (P-Q) d = H P d-H Q d := by
        apply Polynomial.ext
        intro i
        apply Polynomial.ext
        intro j
        simp only [Polynomial.coeff_sub, hc, MathGKM.Markov.coeff, Polynomial.monomial_sub]
      have mul (P Q : MathGKM.Markov.BiPoly) (d e : ℕ) (hp : bd P d) (hq : bd Q e) :
          H (P*Q) (d+e) = H P d*H Q e := by
        apply Polynomial.ext
        intro i
        apply Polynomial.ext
        intro j
        rw [hc]
        simp only [Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
        simp only [hc]
        dsimp [MathGKM.Markov.coeff]
        simp only [Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
        simp only [map_sum]
        apply Finset.sum_congr rfl
        intro uv huv
        apply Finset.sum_congr rfl
        intro st hst
        have hu := Finset.HasAntidiagonal.mem_antidiagonal.mp huv
        have hs := Finset.HasAntidiagonal.mem_antidiagonal.mp hst
        by_cases hP : MathGKM.Markov.coeff P uv.1 st.1 = 0
        · simp only [MathGKM.Markov.coeff] at hP
          simp [hP]
        by_cases hQ : MathGKM.Markov.coeff Q uv.2 st.2 = 0
        · simp only [MathGKM.Markov.coeff] at hQ
          simp [hQ]
        have hd : uv.1+st.1 ≤ d := by
          by_contra h
          exact hP (hp _ _ (by omega))
        have he : uv.2+st.2 ≤ e := by
          by_contra h
          exact hQ (hq _ _ (by omega))
        rw [Polynomial.monomial_mul_monomial]
        have hexp : d+e-i-j = (d-uv.1-st.1)+(e-uv.2-st.2) := by omega
        rw [hexp]
      have add (P Q : MathGKM.Markov.BiPoly) (d : ℕ) : H (P+Q) d = H P d+H Q d := by
        apply Polynomial.ext
        intro i
        apply Polynomial.ext
        intro j
        simp only [Polynomial.coeff_add, hc, MathGKM.Markov.coeff, map_add]
      have shift (P : MathGKM.Markov.BiPoly) (d k : ℕ) (hp : bd P d) :
          H P (d+k) = W^k*H P d := by
        apply Polynomial.ext
        intro i
        apply Polynomial.ext
        intro j
        simp only [W, ← Polynomial.C_pow, Polynomial.coeff_C_mul, hc,
          Polynomial.X_pow_eq_monomial, Polynomial.monomial_mul_monomial, one_mul]
        by_cases hz : MathGKM.Markov.coeff P i j = 0
        · simp [hz]
        have hb : i+j ≤ d := by
          by_contra h
          exact hz (hp i j (by omega))
        have he : d+k-i-j = k+(d-i-j) := by omega
        rw [he]
      have mon (a b d : ℕ) : H (MathGKM.Markov.U^a*MathGKM.Markov.V^b) d = Uh^a*Vh^b*W^(d-a-b) := by
        have he : MathGKM.Markov.U^a*MathGKM.Markov.V^b = Polynomial.monomial a (Polynomial.X^b) := by
          simp only [MathGKM.Markov.U, MathGKM.Markov.V, ← Polynomial.C_pow, Polynomial.X_pow_eq_monomial,
            Polynomial.monomial_mul_C, one_mul]
        rw [he]
        dsimp [H, Uh, Vh, W]
        simp only [Polynomial.support_monomial, ne_eq, pow_ne_zero, Polynomial.X_ne_zero,
          one_ne_zero, not_false_eq_true, if_false, Finset.sum_singleton,
          Polynomial.coeff_monomial, ite_true, Polynomial.X_pow_eq_monomial,
          MathGKM.Markov.coeff, Polynomial.coeff_monomial]
        simp [← Polynomial.C_pow, Polynomial.X_pow_eq_monomial,
          Polynomial.monomial_mul_C, Polynomial.monomial_mul_monomial]
      have h1 : H 1 0 = 1 := by simpa using mon 0 0 0
      have hU : H MathGKM.Markov.U 1 = Uh := by simpa using mon 1 0 1
      have hV : H MathGKM.Markov.V 1 = Vh := by simpa using mon 0 1 1
      have hW : H 1 1 = W := by simpa using mon 0 0 1
      have hS : H MathGKM.Markov.S 1 = Uh+Vh+W := by rw [MathGKM.Markov.S,add,add,hU,hV,hW]
      have bmono (a b : ℕ) : bd (MathGKM.Markov.U^a*MathGKM.Markov.V^b) (a+b) := by
        intro i j h
        simp only [MathGKM.Markov.coeff, MathGKM.Markov.U, MathGKM.Markov.V, ← Polynomial.C_pow, Polynomial.coeff_mul_C,
          Polynomial.coeff_X_pow]
        split_ifs with hi
        · subst i
          have hj : j ≠ b := by omega
          simp [Polynomial.coeff_X_pow, hj]
        · simp
      have bmul (P Q : MathGKM.Markov.BiPoly) (d e : ℕ) (hP : bd P d) (hQ : bd Q e) :
          bd (P*Q) (d+e) := by
        intro i j h
        dsimp [bd, MathGKM.Markov.coeff] at hP hQ
        dsimp [MathGKM.Markov.coeff]
        rw [Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
        apply Finset.sum_eq_zero
        intro uv huv
        rw [Polynomial.coeff_mul]
        apply Finset.sum_eq_zero
        intro st hst
        have huv1 := Finset.HasAntidiagonal.mem_antidiagonal.mp huv
        have hst1 := Finset.HasAntidiagonal.mem_antidiagonal.mp hst
        by_cases hh : d < uv.1+st.1
        · rw [hP uv.1 st.1 hh, zero_mul]
        · rw [hQ uv.2 st.2 (by omega), mul_zero]
      have bs : bd MathGKM.Markov.S 1 := by
        intro i j h
        dsimp [MathGKM.Markov.coeff,MathGKM.Markov.S,MathGKM.Markov.U,MathGKM.Markov.V]
        simp only [Polynomial.coeff_add, Polynomial.coeff_X, Polynomial.coeff_C,
          Polynomial.coeff_one]
        split_ifs <;> simp_all [Polynomial.coeff_add,Polynomial.coeff_X,Polynomial.coeff_one] <;> omega
      have bu : bd MathGKM.Markov.U 1 := by simpa using bmono 1 0
      have bv := reachable_support.2.2
      change bd (MathGKM.Markov.U+MathGKM.Markov.V) 1 at bv
      have init : H 1 0=1 ∧ H ((MathGKM.Markov.U+MathGKM.Markov.V)^2+MathGKM.Markov.U) 2=(Uh+Vh)^2+Uh*W ∧ H (MathGKM.Markov.U+MathGKM.Markov.V) 1=Uh+Vh := by
        have huv : H (MathGKM.Markov.U+MathGKM.Markov.V) 1 = Uh+Vh := by rw [add,hU,hV]
        refine ⟨h1,?_,huv⟩
        rw [add,show (2:ℕ)=1+1 from rfl]
        rw [show (MathGKM.Markov.U+MathGKM.Markov.V)^2=(MathGKM.Markov.U+MathGKM.Markov.V)*(MathGKM.Markov.U+MathGKM.Markov.V) by ring,mul _ _ 1 1 bv bv,huv,shift MathGKM.Markov.U 1 1 bu,hU]
        ring
      have transform (F M O : MathGKM.Markov.Label)
          (ha : M.a=F.a+O.a) (hb : M.b=F.b+O.b)
          (hf : 0<F.b) (ho : 0<O.b)
          (hF : bd F.p (F.a+F.b-1)) (hM : bd M.p (M.a+M.b-1))
          (hO : bd O.p (O.a+O.b-1)) :
          H (MathGKM.Markov.S*F.p*M.p-MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*O.p) (F.a+M.a+(F.b+M.b)-1) =
            (Uh+Vh+W)*H F.p (F.a+F.b-1)*H M.p (M.a+M.b-1)-
            Uh^F.a*Vh^F.b*W^(F.a+F.b)*H O.p (O.a+O.b-1) := by
        have dm : F.a+M.a+(F.b+M.b)-1 = (1+(F.a+F.b-1))+(M.a+M.b-1) := by omega
        have dc : F.a+M.a+(F.b+M.b)-1 = ((F.a+F.b)+(O.a+O.b-1))+(F.a+F.b) := by omega
        have main : H (MathGKM.Markov.S*F.p*M.p) (F.a+M.a+(F.b+M.b)-1) =
            (Uh+Vh+W)*H F.p (F.a+F.b-1)*H M.p (M.a+M.b-1) := by
          rw [dm,mul _ _ _ _ (bmul MathGKM.Markov.S F.p 1 _ bs hF) hM,mul _ _ _ _ bs hF,hS]
        have corr : H (MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*O.p) (F.a+M.a+(F.b+M.b)-1) =
            Uh^F.a*Vh^F.b*W^(F.a+F.b)*H O.p (O.a+O.b-1) := by
          rw [dc,shift _ _ _ (bmul _ _ _ _ (bmono F.a F.b) hO),
            mul _ _ _ _ (bmono F.a F.b) hO,mon]
          simp only [Nat.add_sub_cancel_left, Nat.sub_self, pow_zero, mul_one]
          ring
        rw [sub,main,corr]
      refine ⟨hc,hom,ev,sub,mul,init,?_⟩
      intro path branch
      have ar := Accepted0d2b83c94b4594d717e36331.obligation path
      change (MathGKM.Markov.frame path).mid.a = (MathGKM.Markov.frame path).lo.a+(MathGKM.Markov.frame path).hi.a ∧
        (MathGKM.Markov.frame path).mid.b = (MathGKM.Markov.frame path).lo.b+(MathGKM.Markov.frame path).hi.b ∧ _ at ar
      have sp := reachable_support.1 path
      change bd (MathGKM.Markov.frame path).lo.p _ ∧ bd (MathGKM.Markov.frame path).mid.p _ ∧ bd (MathGKM.Markov.frame path).hi.p _ at sp
      cases branch <;> dsimp [MathGKM.Markov.advance]
      · exact transform _ _ _ ar.1 ar.2.1 ar.2.2.2.1 ar.2.2.2.2.1 sp.1 sp.2.1 sp.2.2
      · have ha : (MathGKM.Markov.frame path).mid.a=(MathGKM.Markov.frame path).hi.a+(MathGKM.Markov.frame path).lo.a := by omega
        have hb : (MathGKM.Markov.frame path).mid.b=(MathGKM.Markov.frame path).hi.b+(MathGKM.Markov.frame path).lo.b := by omega
        convert transform _ _ _ ha hb ar.2.2.2.2.1 ar.2.2.2.1 sp.2.2 sp.2.1 sp.1 using 1 <;>
          congr 2 <;> omega
    )
  )
