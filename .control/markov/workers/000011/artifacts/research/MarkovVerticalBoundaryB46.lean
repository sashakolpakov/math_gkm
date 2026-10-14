import MarkovHorizontalB46

/-! Machine-authored worker b46c0efc. Vertical boundary of every source
polynomial, literal raw coefficients and unbounded source paths. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem rawWord_zero46 (w : List Bool) :
    (rawWord80 w).a.coeff 0=X^w.length*(X+1)^(w.count true) ∧
    (rawWord80 w).c.coeff 0=0 := by
  induction w with
  | nil => simp [rawWord80,Polynomial.coeff_one]
  | cons r rs ih =>
    obtain ⟨ha,hc⟩ := ih
    cases r <;>
      simp [rawWord80,rawA18,rawB18,mm16,S,U,V,Polynomial.mul_coeff_zero,
        Polynomial.coeff_add,Polynomial.coeff_one,ha,hc,List.count_cons,pow_succ] <;> ring

theorem rawWord_last_zero46 (w : List Bool) :
    ((rawWord80 (w++[true])).b).coeff 0 = X^(w.length+1)*(X+1)^(w.count true) := by
  rw [rawWord_append80]
  simp [rawWord80,mm_one_right774,mm16,rawB18,S,U,V,Polynomial.mul_coeff_zero,
    Polynomial.coeff_add,Polynomial.coeff_one,(rawWord_zero46 w).1,pow_succ]
  ring

theorem vertical_boundary_formula46 (path : List Bool) :
    ((frame path).mid.p).coeff 0 =
      X^(frame path).mid.b*(X+1)^((frame path).mid.a-1) := by
  obtain ⟨w,hn,hm,he⟩ := source_hword46 path
  have hp : (frame path).mid.p=(rawWord80 (false::(w++[true]))).b := by
    apply Bivariate.swap.injective
    rw [he,hword_raw46]
  rw [hp]
  change (rawWord80 ((false::w)++[true])).b.coeff 0=_
  rw [rawWord_last_zero46]
  simp only [List.length_cons,List.count_cons,Bool.false_eq_true,if_false]
  rw [show w.length+1+1=(frame path).mid.b by omega,
    show w.count true=(frame path).mid.a-1 by omega]
  simp

theorem vertical_boundary_raw46 (path : List Bool) (j : ℕ) :
    coeff (frame path).mid.p 0 j * coeff (frame path).mid.p 0 (j+2) ≤
      coeff (frame path).mid.p 0 (j+1)^2 := by
  have h := crossLC_adjacent
    (crossLC_X_pow_binomial (frame path).mid.b ((frame path).mid.a-1)) (↑j+1)
  have he : (((frame path).mid.p).coeff 0).map (Int.castRingHom ℝ) =
      X^(frame path).mid.b*(1+X)^((frame path).mid.a-1) := by
    rw [vertical_boundary_formula46]
    simp [add_comm]
  rw [← he] at h
  have hn : ¬ (↑j : ℤ) < 0 := by omega
  have hn1 : ¬ (↑j+1 : ℤ) < 0 := by omega
  have hn2 : ¬ (↑j+1+1 : ℤ) < 0 := by omega
  simp only [CoeffSeq,add_sub_cancel_right,hn,hn1,hn2,if_false,
    Int.toNat_natCast,Polynomial.coeff_map] at h
  change (coeff (frame path).mid.p 0 j : ℝ) *
    (coeff (frame path).mid.p 0 (j+2) : ℝ) ≤
      (coeff (frame path).mid.p 0 (j+1) : ℝ)^2 at h
  exact_mod_cast h

#print axioms vertical_boundary_formula46
#print axioms vertical_boundary_raw46
end
end MathGKM.Markov
