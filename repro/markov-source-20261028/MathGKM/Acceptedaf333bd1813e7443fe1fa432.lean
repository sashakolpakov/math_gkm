import MathGKM.Target85421e3da3dd4f731ee085eb
import MathGKM.Accepted0d2b83c94b4594d717e36331
import Lean
def Acceptedaf333bd1813e7443fe1fa432.interface : MathGKM.Target85421e3da3dd4f731ee085eb.Interface :=
  (
    True.intro
  )
theorem Acceptedaf333bd1813e7443fe1fa432.transport : MathGKM.Target85421e3da3dd4f731ee085eb.Transport Acceptedaf333bd1813e7443fe1fa432.interface :=
  (
    True.intro
  )
theorem Acceptedaf333bd1813e7443fe1fa432.obligation : MathGKM.Target85421e3da3dd4f731ee085eb.Goal Acceptedaf333bd1813e7443fe1fa432.interface :=
  (
    (show (let bd := fun (P : MathGKM.Markov.BiPoly) (d : ℕ) => ∀ i j : ℕ, d < i+j → MathGKM.Markov.coeff P i j = 0; (∀ path : List Bool, let f := MathGKM.Markov.frame path; bd f.lo.p (f.lo.a+f.lo.b-1) ∧ bd f.mid.p (f.mid.a+f.mid.b-1) ∧ bd f.hi.p (f.hi.a+f.hi.b-1)) ∧ bd (1 : MathGKM.Markov.BiPoly) 0 ∧ bd (MathGKM.Markov.U+MathGKM.Markov.V) 1) from
    by
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
    )
  )
