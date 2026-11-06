/- Machine-authored round-10 ordinary support recovery. Original statement and induction retained; cancellation uses the admitted export. -/
import MathGKM.Accepted0d2b83c94b4594d717e36331
import MathGKM.Acceptedaf333bd1813e7443fe1fa432
import MathGKM.Accepted1ed69be5c8a0eb46d7e92d9f
import MathGKM.Accepted25cc13a3ad331403dbe48d54
import MathGKM.Accepted1f718ce4c1114343d125e631
open MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
namespace SupportR10
theorem corners (path : List Bool) :
    ∀ E ∈ [(frame path).lo,(frame path).mid,(frame path).hi],
      coeff E.p E.a 0=1 ∧ (0<E.a → coeff E.p 0 E.b=1) := by
  intro E hE
  have hv := Accepted1ed69be5c8a0eb46d7e92d9f.obligation path
  have hu := Accepted25cc13a3ad331403dbe48d54.obligation path E hE
  have hvE : E.p.map (Polynomial.evalRingHom (0 : ℤ))=
      Polynomial.X^E.a*(1+Polynomial.X)^(E.b-1) := by
    simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
    rcases hE with rfl|rfl|rfl
    · exact hv.1
    · exact hv.2.1
    · exact hv.2.2
  have vx : coeff E.p E.a 0=1 := by
    have h := congrArg (fun P : Polynomial ℤ => P.coeff E.a) hvE
    have hh : (Polynomial.X^E.a*(1+Polynomial.X)^(E.b-1) : Polynomial ℤ).coeff E.a=1 := by
      simp only [Polynomial.coeff_X_pow_mul',le_refl,ite_true,Nat.sub_self,Polynomial.coeff_one_add_X_pow,Nat.choose_zero_right,Nat.cast_one]
    simpa [Polynomial.coeff_map,← Polynomial.coeff_zero_eq_eval_zero,coeff,hh] using h
  refine ⟨vx,?_⟩
  intro ha
  rw [if_neg (by omega : E.a≠0)] at hu
  have h := congrArg (fun P : Polynomial ℤ => P.coeff E.b) hu
  have hh : (Polynomial.X^E.b*(1+Polynomial.X)^(E.a-1) : Polynomial ℤ).coeff E.b=1 := by
    simp only [Polynomial.coeff_X_pow_mul',le_refl,ite_true,Nat.sub_self,Polynomial.coeff_one_add_X_pow,Nat.choose_zero_right,Nat.cast_one]
  simpa [← Polynomial.coeff_zero_eq_eval_zero,coeff,hh] using h
theorem extras (path : List Bool) :
    (frame path).lo.a<(frame path).lo.b ∧
    (frame path).hi.a≤(frame path).hi.b ∧ 0<(frame path).hi.a ∧
    ((frame path).lo.a=0 → (frame path).lo=⟨0,1,1⟩) := by
  induction path using List.reverseRecOn with
  | nil => norm_num [frame,initial]
  | append_singleton path branch ih =>
    have step : frame (path++[branch])=advance (frame path) branch := by
      simp [frame,List.foldl_append]
    have ar := Accepted0d2b83c94b4594d717e36331.obligation path
    dsimp only at ar ih ⊢
    rw [step]
    cases branch <;> simp only [advance,Bool.false_eq_true,↓reduceIte] 
    · exact ⟨ih.1,by omega,by omega,ih.2.2.2⟩
    · exact ⟨by omega,ih.2.1,ih.2.2.1,by intro h; omega⟩
theorem actual_support : ∀ path : List Bool,
    let f := frame path;
    ∀ E ∈ [f.lo,f.mid,f.hi], ∀ i j,
      ¬InPolygon E.a E.b i j → coeff E.p i j=0 := by
  have upper := Acceptedaf333bd1813e7443fe1fa432.obligation.1
  have up (path : List Bool) (E : Label)
      (hE : E ∈ [(frame path).lo,(frame path).mid,(frame path).hi]) :
      ∀ (i j : ℕ), E.a + E.b - 1 < i + j → coeff E.p i j=0 := by
    have h := upper path
    simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
    rcases hE with rfl|rfl|rfl
    · exact h.1
    · exact h.2.1
    · exact h.2.2
  have inv : ∀ path : List Bool, let f := frame path;
      (∀ i j, ¬InPolygon f.lo.a f.lo.b i j → coeff f.lo.p i j=0) ∧
      (∀ i j, ¬InPolygon f.mid.a f.mid.b i j → coeff f.mid.p i j=0) ∧
      (∀ i j, ¬InPolygon f.hi.a f.hi.b i j → coeff f.hi.p i j=0) := by
    intro path
    induction path using List.reverseRecOn with
    | nil =>
      have base (E : Label) (hE : E ∈ [initial.lo,initial.mid,initial.hi])
          (hd : E.a+E.b-1≤2) :
          ∀ i j, ¬InPolygon E.a E.b i j → coeff E.p i j=0 := by
        intro i j hn
        by_cases hb : E.a + E.b - 1 < i + j
        · exact up [] E hE i j hb
        · have hi : i≤2 := by omega
          have hj : j≤2 := by omega
          simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
          rcases hE with rfl|rfl|rfl <;>
            interval_cases i <;> interval_cases j <;>
            norm_num [initial,InPolygon,coeff,U,V,pow_two,Polynomial.coeff_mul,Finset.Nat.antidiagonal_succ,Finset.Nat.antidiagonal_zero] at *
      exact ⟨base _ (by simp [frame]) (by decide),base _ (by simp [frame]) (by decide),base _ (by simp [frame]) (by decide)⟩
    | append_singleton path branch ih =>
      have step : frame (path++[branch])=advance (frame path) branch := by
        simp [frame,List.foldl_append]
      have ar := Accepted0d2b83c94b4594d717e36331.obligation path
      have ex := extras path
      have co := corners path
      dsimp only at ar ex ih ⊢
      have hs : ∀ E ∈ [(frame path).lo,(frame path).mid,(frame path).hi],
          ∀ i j, ¬InPolygon E.a E.b i j → coeff E.p i j=0 := by
        intro E hE
        simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
        rcases hE with rfl|rfl|rfl
        · exact ih.1
        · exact ih.2.1
        · exact ih.2.2
      have can := Accepted1f718ce4c1114343d125e631.obligation (frame path) ar.1 ar.2.1 ar.2.2.1
        ar.2.2.2.1 ar.2.2.2.2.1 ex.1 ex.2.1 ex.2.2.1 ex.2.2.2 hs
        (fun E hE => (co E hE).1) (fun E hE => (co E hE).2) branch
      have newmid : ∀ i j,
          ¬InPolygon (advance (frame path) branch).mid.a
            (advance (frame path) branch).mid.b i j →
          coeff (advance (frame path) branch).mid.p i j=0 := by
        intro i j hn
        by_cases hb : (advance (frame path) branch).mid.a+
            (advance (frame path) branch).mid.b - 1 < i + j
        · have h := up (path++[branch]) (frame (path++[branch])).mid (by simp) i j
          simpa only [step] using h (by simpa only [step] using hb)
        · have low : (advance (frame path) branch).mid.b*i+
              (advance (frame path) branch).mid.a*j <
              (advance (frame path) branch).mid.a*(advance (frame path) branch).mid.b := by
            dsimp only [InPolygon] at hn
            omega
          exact (can.2 i j low).2.2
      rw [step]
      cases branch <;> simp only [advance,Bool.false_eq_true,↓reduceIte] at newmid ⊢
      · exact ⟨ih.1,newmid,ih.2.1⟩
      · exact ⟨ih.2.1,newmid,ih.2.2⟩
  intro path
  dsimp only
  intro E hE
  have h := inv path
  simp only [List.mem_cons,List.not_mem_nil,or_false] at hE
  rcases hE with rfl|rfl|rfl
  · exact h.1
  · exact h.2.1
  · exact h.2.2

end SupportR10
