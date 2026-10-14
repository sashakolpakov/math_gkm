import MathGKM.MarkovIndices

/-! Machine-authored worker 21afc594. Total support-degree bounds for the
literal nested polynomial recurrence; no positivity or LC assumed. -/
namespace MathGKM.Markov
noncomputable section

def DegreeBound21a (P : BiPoly) (d : ℕ) : Prop :=
  ∀ i j, d < i + j → coeff P i j = 0

theorem degree_mono_21a {P : BiPoly} {d e : ℕ}
    (h : DegreeBound21a P d) (he : d ≤ e) : DegreeBound21a P e := by
  intro i j hij
  exact h i j (by omega)

theorem degree_add_21a {P Q : BiPoly} {d : ℕ}
    (hp : DegreeBound21a P d) (hq : DegreeBound21a Q d) :
    DegreeBound21a (P + Q) d := by
  intro i j hij
  simp [coeff, Polynomial.coeff_add, hp i j hij, hq i j hij] at *

theorem degree_sub_21a {P Q : BiPoly} {d : ℕ}
    (hp : DegreeBound21a P d) (hq : DegreeBound21a Q d) :
    DegreeBound21a (P - Q) d := by
  intro i j hij
  simpa only [coeff, Polynomial.coeff_sub, hp i j hij, hq i j hij, sub_self]
    using sub_self (coeff P i j)

theorem degree_mul_21a {P Q : BiPoly} {d e : ℕ}
    (hp : DegreeBound21a P d) (hq : DegreeBound21a Q e) :
    DegreeBound21a (P * Q) (d + e) := by
  intro i j hij
  simp only [coeff, Polynomial.coeff_mul, Polynomial.finset_sum_coeff]
  apply Finset.sum_eq_zero
  intro ab hab
  apply Finset.sum_eq_zero
  intro cd hcd
  have hab' := Finset.mem_antidiagonal.mp hab
  have hcd' := Finset.mem_antidiagonal.mp hcd
  by_cases hd : d < ab.1 + cd.1
  · change coeff P ab.1 cd.1 * coeff Q ab.2 cd.2 = 0
    rw [hp _ _ hd, zero_mul]
  · change coeff P ab.1 cd.1 * coeff Q ab.2 cd.2 = 0
    rw [hq _ _ (by omega), mul_zero]

theorem degree_one_21a : DegreeBound21a 1 0 := by
  intro i j hij
  by_cases hi : i = 0
  · subst i; simp [coeff, Polynomial.coeff_one, show j ≠ 0 by omega]
  · simp [coeff, Polynomial.coeff_one, hi]

theorem degree_U_21a : DegreeBound21a U 1 := by
  intro i j hij
  by_cases hi : i = 1
  · subst i; simp [coeff, U, Polynomial.coeff_X, show j ≠ 0 by omega]
  · simp [coeff, U, Polynomial.coeff_X, hi]

theorem degree_V_21a : DegreeBound21a V 1 := by
  intro i j hij
  by_cases hi : i = 0
  · subst i; simp [coeff, V, Polynomial.coeff_C, Polynomial.coeff_X,
      show j ≠ 1 by omega]
  · simp [coeff, V, Polynomial.coeff_C, hi]

theorem degree_pow_21a {P : BiPoly} {d : ℕ} (h : DegreeBound21a P d)
    (n : ℕ) : DegreeBound21a (P ^ n) (d * n) := by
  induction n with
  | zero => simpa using degree_one_21a
  | succ n ih => simpa [pow_succ, Nat.mul_succ] using degree_mul_21a ih h

theorem degree_S_21a : DegreeBound21a S 1 :=
  degree_add_21a (degree_add_21a degree_U_21a degree_V_21a)
    (degree_mono_21a degree_one_21a (by omega))

def LabelDegree21a (l : Label) : Prop := DegreeBound21a l.p (l.a + l.b - 1)
def FrameDegree21a (f : Frame) : Prop :=
  LabelDegree21a f.lo ∧ LabelDegree21a f.mid ∧ LabelDegree21a f.hi

theorem degree_initial_21a : FrameDegree21a initial := by
  refine ⟨degree_one_21a, ?_, degree_add_21a degree_U_21a degree_V_21a⟩
  exact degree_add_21a
    (degree_pow_21a (degree_add_21a degree_U_21a degree_V_21a) 2)
    (degree_mono_21a degree_U_21a (by decide))

theorem degree_advance_21a {f : Frame} (hi : FrameIndices f)
    (h : FrameDegree21a f) (r : Bool) : FrameDegree21a (advance f r) := by
  obtain ⟨hma,hmb,_,hlb,hrb,_,_,_⟩ := hi
  obtain ⟨hl,hm,hh⟩ := h
  unfold LabelDegree21a at hl hm hh
  cases r <;> simp only [FrameDegree21a, LabelDegree21a, advance,
    Bool.false_eq_true, if_false, if_true]
  · refine ⟨hl, ?_, hm⟩
    apply degree_sub_21a
    · exact degree_mono_21a (degree_mul_21a (degree_mul_21a degree_S_21a hl) hm)
        (by omega)
    · exact degree_mono_21a (degree_mul_21a
        (degree_mul_21a (degree_pow_21a degree_U_21a f.lo.a)
          (degree_pow_21a degree_V_21a f.lo.b)) hh) (by omega)
  · refine ⟨hm, ?_, hh⟩
    apply degree_sub_21a
    · exact degree_mono_21a (degree_mul_21a (degree_mul_21a degree_S_21a hh) hm)
        (by omega)
    · exact degree_mono_21a (degree_mul_21a
        (degree_mul_21a (degree_pow_21a degree_U_21a f.hi.a)
          (degree_pow_21a degree_V_21a f.hi.b)) hl) (by omega)

theorem degree_fold_21a (path : List Bool) (f : Frame)
    (hi : FrameIndices f) (h : FrameDegree21a f) :
    FrameDegree21a (path.foldl advance f) := by
  induction path generalizing f with
  | nil => exact h
  | cons r rs ih => exact ih _ (indices_advance hi r) (degree_advance_21a hi h r)

theorem degree_frame_21a (path : List Bool) : FrameDegree21a (frame path) :=
  degree_fold_21a path initial indices_initial degree_initial_21a

theorem coefficient_above_degree_21a (path : List Bool) (i j : ℕ)
    (h : (frame path).mid.a + (frame path).mid.b - 1 < i + j) :
    coeff (frame path).mid.p i j = 0 :=
  (degree_frame_21a path).2.1 i j h

#print axioms degree_frame_21a
#print axioms coefficient_above_degree_21a
end
end MathGKM.Markov
