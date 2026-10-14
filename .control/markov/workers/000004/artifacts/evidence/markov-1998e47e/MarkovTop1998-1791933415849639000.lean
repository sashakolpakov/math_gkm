import MarkovSource4b5

/-! Machine-authored worker 1998e47e. Exact top face, raw coefficients retained. -/
namespace MathGKM.Markov
noncomputable section

def topEval1998 : TriPoly21a →+* BiPoly :=
  Polynomial.mapRingHom (Polynomial.mapRingHom (Polynomial.evalRingHom (0 : ℤ)))

@[simp] theorem top_U1998 : topEval1998 HU4b5 = U := by
  simp [topEval1998, HU4b5, U]
@[simp] theorem top_V1998 : topEval1998 HV4b5 = V := by
  simp [topEval1998, HV4b5, V]
@[simp] theorem top_W1998 : topEval1998 HW4b5 = 0 := by
  simp [topEval1998, HW4b5]

def TopFormula1998 (l : Label) : Prop :=
  topEval1998 (numerator4b5 l) = (U+V)^(l.a+l.b-1)
def FrameTop1998 (f : Frame) : Prop :=
  TopFormula1998 f.lo ∧ TopFormula1998 f.mid ∧ TopFormula1998 f.hi

theorem top_initial1998 : FrameTop1998 initial := by
  simp only [FrameTop1998, TopFormula1998, source_seed_lo_4b5,
    source_seed_mid_4b5, source_seed_hi_4b5]
  simp [initial]

theorem top_advance1998 {f : Frame} (hi : FrameIndices f)
    (hd : FrameDegree21a f) (ht : FrameTop1998 f) (r : Bool) :
    FrameTop1998 (advance f r) := by
  obtain ⟨hl,hm,hr⟩ := ht
  have hlb := hi.2.2.2.1
  have hrb := hi.2.2.2.2.1
  have hmb : 0 < f.mid.b := by have h := hi.2.1; omega
  cases r
  · refine ⟨hl, ?_, hm⟩
    unfold TopFormula1998 at hl hm ⊢
    rw [source_step_left_4b5 hi hd]
    simp only [map_sub topEval1998, map_mul topEval1998, map_add topEval1998, map_pow topEval1998, top_U1998, top_V1998,
      top_W1998, add_zero]
    rw [zero_pow (by omega : f.lo.a+f.lo.b ≠ 0), mul_zero, zero_mul,
      sub_zero, hl, hm]
    have he : (advance f false).mid.a + (advance f false).mid.b - 1 =
        1+(f.lo.a+f.lo.b-1)+(f.mid.a+f.mid.b-1) := by
      simp only [advance, Bool.false_eq_true, if_false]; omega
    rw [he, pow_add, pow_add, pow_one]
  · refine ⟨hm, ?_, hr⟩
    unfold TopFormula1998 at hr hm ⊢
    rw [source_step_right_4b5 hi hd]
    simp only [map_sub topEval1998, map_mul topEval1998, map_add topEval1998, map_pow topEval1998, top_U1998, top_V1998,
      top_W1998, add_zero]
    rw [zero_pow (by omega : f.hi.a+f.hi.b ≠ 0), mul_zero, zero_mul,
      sub_zero, hr, hm]
    have he : (advance f true).mid.a + (advance f true).mid.b - 1 =
        1+(f.hi.a+f.hi.b-1)+(f.mid.a+f.mid.b-1) := by
      simp only [advance, if_true]; omega
    rw [he, pow_add, pow_add, pow_one]

theorem top_fold1998 (path : List Bool) (f : Frame) (hi : FrameIndices f)
    (hd : FrameDegree21a f) (ht : FrameTop1998 f) :
    FrameTop1998 (path.foldl advance f) := by
  induction path generalizing f with
  | nil => exact ht
  | cons r rs ih =>
    exact ih _ (indices_advance hi r) (degree_advance_21a hi hd r)
      (top_advance1998 hi hd ht r)

theorem top_formula1998 (path : List Bool) :
    topEval1998 (numerator4b5 (frame path).mid) =
      (U+V)^((frame path).mid.a+(frame path).mid.b-1) :=
  (top_fold1998 path initial indices_initial degree_initial_21a top_initial1998).2.1

theorem topEval_coeff1998 (Q : TriPoly21a) (i j : ℕ) :
    coeff (topEval1998 Q) i j = ((Q.coeff i).coeff j).coeff 0 := by
  simp [coeff, topEval1998, ← Polynomial.coeff_zero_eq_eval_zero]

theorem binomial_raw1998 (d i j : ℕ) (h : i+j=d) :
    coeff ((U+V)^d) i j = (d.choose i : ℤ) := by
  unfold coeff U V
  rw [Polynomial.coeff_X_add_C_pow]
  have he : d-i=j := by omega
  rw [he]
  simp only [← Polynomial.C_natCast, Polynomial.coeff_mul_C,
    Polynomial.coeff_X_pow, if_pos rfl, one_mul]

theorem top_raw_coeff1998 (path : List Bool) (i j : ℕ)
    (h : i+j=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i j =
      (((frame path).mid.a+(frame path).mid.b-1).choose i : ℤ) := by
  have hh := congrArg (fun P => coeff P i j) (top_formula1998 path)
  rw [topEval_coeff1998, numerator4b5, raw_homogeneous_coeff_21a] at hh
  have he : (frame path).mid.a+(frame path).mid.b-1-i-j = 0 := by omega
  simpa [he, binomial_raw1998 _ _ _ h] using hh

theorem top_vertices1998 (path : List Bool) :
    coeff (frame path).mid.p 0 ((frame path).mid.a+(frame path).mid.b-1) = 1 ∧
    coeff (frame path).mid.p ((frame path).mid.a+(frame path).mid.b-1) 0 = 1 := by
  constructor <;> rw [top_raw_coeff1998 path _ _ (by omega)] <;> simp

#print axioms top_formula1998
#print axioms top_raw_coeff1998
#print axioms top_vertices1998
end
end MathGKM.Markov
