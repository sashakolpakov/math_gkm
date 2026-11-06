import MathGKM.Round28CoefficientsA

/-! Machine-authored simultaneous positive-array induction, round28. -/
namespace RenewalR28
open MathGKM.Markov
noncomputable section

theorem coeff_U_succ (Q : BiPoly) (i j : ℕ) : coeff (U*Q) (i+1) j=coeff Q i j := by
  simp [coeff,U,Polynomial.coeff_X_mul]

theorem coeff_U_zero (Q : BiPoly) (j : ℕ) : coeff (U*Q) 0 j=0 := by
  simp [coeff,U]

theorem coeff_V_succ (Q : BiPoly) (i j : ℕ) : coeff (V*Q) i (j+1)=coeff Q i j := by
  simp [coeff,V,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul]

theorem coeff_V_zero (Q : BiPoly) (i : ℕ) : coeff (V*Q) i 0=0 := by
  simp [coeff,V,Polynomial.coeff_C_mul]

theorem arrays (b : ℕ) :
    (∀ i j, coeff (state U V (1 : BiPoly) 1 0 b).1 i j=mc b i j) ∧
    (∀ i j, coeff (state U V (1 : BiPoly) 1 0 b).2 i j=gc b i j) := by
  induction b with
  | zero =>
    constructor
    · intro i j
      cases i with
      | zero => simp [state_zero,mc,coeff,Polynomial.coeff_one,eq_comm]
      | succ i => simp [state_zero,mc,coeff,Polynomial.coeff_one,show ¬i+1+j≤0 by omega]
    · intro i j
      simp only [state_zero,coeff,Polynomial.coeff_zero]
      cases i with
      | zero => simp [gc]
      | succ i => simp [gc,show ¬i+1+j≤0 by omega]
  | succ b ih =>
    have hg (i j : ℕ) : coeff (state U V (1 : BiPoly) 1 0 (b+1)).2 i j=gc (b+1) i j := by
      rw [state_step]
      simp only [mul_one,one_mul,coeff,Polynomial.coeff_add]
      change coeff (U*(state U V (1 : BiPoly) 1 0 b).1) i j+
        coeff (state U V (1 : BiPoly) 1 0 b).2 i j=_
      cases i with
      | zero => rw [coeff_U_zero,ih.2]; simp [gc]
      | succ i => rw [coeff_U_succ,ih.1,ih.2,← gc_step]
    refine ⟨?_,hg⟩
    intro i j
    have he : (state U V (1 : BiPoly) 1 0 (b+1)).1=
        V*(state U V (1 : BiPoly) 1 0 b).1+(state U V (1 : BiPoly) 1 0 (b+1)).2 := by
      rw [state_step]
      ring
    rw [he]
    simp only [coeff,Polynomial.coeff_add]
    change coeff (V*(state U V (1 : BiPoly) 1 0 b).1) i j+
      coeff (state U V (1 : BiPoly) 1 0 (b+1)).2 i j=_
    rw [hg]
    cases j with
    | zero => rw [coeff_V_zero,zero_add,mc_jzero]
    | succ j => rw [coeff_V_succ,ih.1,← mc_v_step]

theorem coefficient_formula (b i j : ℕ) : coeff (P b) i j=mc b i j := by
  rw [P_state]
  exact (arrays b).1 i j

theorem guarded_formula : ∀ b : ℕ, 1≤b → ∀ i j : ℕ,
    coeff (P b) i j =
      if i=0 then (if j=b then 1 else 0) else
      if i+j≤b then ((i+j).choose i : ℤ)*((b-j-1).choose (i-1) : ℤ) else 0 := by
  intro b hb i j
  exact coefficient_formula b i j

theorem actual_coefficient_formula (k i j : ℕ) :
    coeff (frame (List.replicate k false)).mid.p i j=
      if i=0 then (if j=k+2 then 1 else 0) else
      if i+j≤k+2 then ((i+j).choose i : ℤ)*((k+2-j-1).choose (i-1) : ℤ) else 0 := by
  rw [(endpoint_frame k).2.2.2.1]
  exact coefficient_formula (k+2) i j

end
end RenewalR28
