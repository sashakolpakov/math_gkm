import MarkovHorizontalB46

/-! Machine-authored worker b46c0efc. Unconditional first-interior horizontal
raw log-concavity for all source paths. This is not full Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem hword_first46 (w : List Bool) (hn : 1 ≤ w.length) :
    (hword46 (X : Polynomial ℤ) w).coeff 1 =
      X^(w.count true+1)*(X+1)^(w.length-1)*
        (((3*w.count true+2:ℕ):Polynomial ℤ)+
          ((w.length+w.count true+2:ℕ):Polynomial ℤ)*X) := by
  have hz : (X+1 : Polynomial ℤ) ≠ 0 := by
    intro h
    have hh := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
    norm_num [Polynomial.coeff_one] at hh
  apply mul_left_cancel₀ hz
  rw [hword_scaled46]
  have he : (X+1 : Polynomial ℤ)^w.length = (X+1)^(w.length-1)*(X+1) := by
    rw [← pow_succ]
    congr 1
    omega
  rw [he]
  ring

theorem crossLC_X_pow_mul46 (p : ℝ[X]) (hp : CrossLC (CoeffSeq p)) (a : ℕ) :
    CrossLC (CoeffSeq (X^a*p)) := by
  induction a with
  | zero => simpa using hp
  | succ a ih => simpa [pow_succ',mul_assoc] using crossLC_X_mul ih

theorem crossLC_linear_binomial46 (a n : ℕ) (A B : ℝ) (ha : 0 ≤ A) (hb : 0 ≤ B) :
    CrossLC (CoeffSeq (X^a*(X+1)^n*(C A+C B*X))) := by
  have h := crossLC_pascal (crossLC_quad (A:=A) (B:=B) (C:=0)
    ha hb (by norm_num) (by simpa using sq_nonneg B)) n
  rw [← coeffSeq_quadratic,← coeffSeq_binomial_mul] at h
  have hh := crossLC_X_pow_mul46 _ h a
  simpa [Quadratic,add_comm,mul_assoc] using hh

theorem hword_crossLC46 (w : List Bool) :
    CrossLC (CoeffSeq (((hword46 (X : Polynomial ℤ) w).coeff 1).map (Int.castRingHom ℝ))) := by
  by_cases hn : 1 ≤ w.length
  · rw [hword_first46 w hn]
    simpa only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
      Polynomial.map_natCast,Polynomial.map_X,Polynomial.map_one,map_natCast]
      using crossLC_linear_binomial46 (w.count true+1) (w.length-1)
      ((3*w.count true+2:ℕ):ℝ) ((w.length+w.count true+2:ℕ):ℝ)
      (by positivity) (by positivity)
  · have hw : w=[] := by cases w <;> simp_all
    subst w
    have he : (hword46 (X : Polynomial ℤ) []).coeff 1=2*X := by
      simp [hword46,coeff_mul_one46,Polynomial.coeff_one,Polynomial.mul_coeff_zero]
      ring
    rw [he]
    have hh := crossLC_linear_binomial46 1 0 2 0 (by norm_num) (by norm_num)
    norm_num at hh ⊢
    convert hh using 1 <;> congr 1 <;> ring

theorem horizontal_one_crossLC46 (path : List Bool) :
    CrossLC (CoeffSeq (((Bivariate.swap (frame path).mid.p).coeff 1).map
      (Int.castRingHom ℝ))) := by
  obtain ⟨w,_,_,he⟩ := source_hword46 path
  rw [he]
  exact hword_crossLC46 w

/-- Every raw horizontal triple on j=1, with no cutoff or polygon guard.
Zeros are kept. The endpoint polynomials have no valid j=1 triples. -/
theorem horizontal_one_raw46 (path : List Bool) (i : ℕ) :
    coeff (frame path).mid.p i 1 * coeff (frame path).mid.p (i+2) 1 ≤
      coeff (frame path).mid.p (i+1) 1 ^ 2 := by
  have h := crossLC_adjacent (horizontal_one_crossLC46 path) (↑i+1)
  have hn : ¬ (↑i : ℤ) < 0 := by omega
  have hn1 : ¬ (↑i+1 : ℤ) < 0 := by omega
  have hn2 : ¬ (↑i+1+1 : ℤ) < 0 := by omega
  simp only [CoeffSeq,add_sub_cancel_right,hn,hn1,hn2,if_false,
    Int.toNat_natCast,Polynomial.coeff_map] at h
  simp only [swap_coeff46] at h
  change (coeff (frame path).mid.p i 1 : ℝ) *
    (coeff (frame path).mid.p (i+2) 1 : ℝ) ≤
      (coeff (frame path).mid.p (i+1) 1 : ℝ)^2 at h
  exact_mod_cast h

#print axioms hword_first46
#print axioms horizontal_one_raw46
end
end MathGKM.Markov
