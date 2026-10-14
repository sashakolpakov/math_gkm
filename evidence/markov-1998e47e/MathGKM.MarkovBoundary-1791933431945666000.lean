import MathGKM.MarkovLogConcavity

namespace MathGKM.Markov
noncomputable section
open Polynomial

def edgeEval : BiPoly →+* ℝ[X] :=
  (Polynomial.mapRingHom (Int.castRingHom ℝ)).comp
    (Polynomial.mapRingHom (Polynomial.evalRingHom (0 : ℤ)))

@[simp] theorem edgeEval_U : edgeEval U = X := by simp [edgeEval, U]
@[simp] theorem edgeEval_V : edgeEval V = 0 := by simp [edgeEval, V]
@[simp] theorem edgeEval_S : edgeEval S = X+1 := by simp [S]

def EdgeFormula (l : Label) : Prop :=
  0 < l.b ∧ edgeEval l.p = X^l.a * (X+1)^(l.b-1)

def FrameEdge (f : Frame) : Prop :=
  EdgeFormula f.lo ∧ EdgeFormula f.mid ∧ EdgeFormula f.hi

theorem edge_initial : FrameEdge initial := by
  constructor
  · norm_num [EdgeFormula, initial]
  constructor
  · simp [EdgeFormula, initial]
    ring
  · simp [EdgeFormula, initial]

theorem edge_step (x y z : Label) (hx : EdgeFormula x) (hy : EdgeFormula y) :
    EdgeFormula ⟨x.a+y.a,x.b+y.b,S*x.p*y.p-U^x.a*V^x.b*z.p⟩ := by
  obtain ⟨hxb,hxp⟩ := hx
  obtain ⟨hyb,hyp⟩ := hy
  constructor
  · dsimp; omega
  · dsimp
    simp only [map_sub, map_mul, map_pow, edgeEval_S, edgeEval_U, edgeEval_V]
    rw [zero_pow (by omega : x.b ≠ 0), mul_zero, zero_mul, sub_zero, hxp, hyp]
    have hexp : x.b+y.b-1 = (x.b-1)+(y.b-1)+1 := by omega
    rw [hexp, pow_add, pow_add, pow_one, pow_add]
    ring

theorem edge_advance {f : Frame} (h : FrameEdge f) (right : Bool) :
    FrameEdge (advance f right) := by
  obtain ⟨hl,hm,hr⟩ := h
  cases right
  · exact ⟨hl, edge_step f.lo f.mid f.hi hl hm, hm⟩
  · refine ⟨hm, ?_, hr⟩
    have hh := edge_step f.hi f.mid f.lo hr hm
    simpa [advance, Nat.add_comm] using hh

theorem edge_fold (path : List Bool) (f : Frame) (h : FrameEdge f) :
    FrameEdge (path.foldl advance f) := by
  induction path generalizing f with
  | nil => exact h
  | cons b bs ih => exact ih (advance f b) (edge_advance h b)

/-- All finite paths, with no denominator bound. -/
theorem boundary_formula (path : List Bool) :
    edgeEval (frame path).mid.p =
      X^(frame path).mid.a * (X+1)^((frame path).mid.b-1) :=
  (edge_fold path initial edge_initial).2.1.2

theorem coeffSeq_X_mul (p : ℝ[X]) :
    CoeffSeq (X*p) = fun k => CoeffSeq p (k-1) := by
  funext k
  by_cases hk : k < 0
  · simp [CoeffSeq, hk, show k-1 < 0 by omega]
  · lift k to ℕ using (show 0 ≤ k by omega)
    cases k with
    | zero => simp [CoeffSeq]
    | succ n =>
      simp [CoeffSeq, show ¬ (↑n+1 : ℤ) < 0 by omega,
        show ¬ (↑n : ℤ) < 0 by omega]

theorem crossLC_X_mul {p : ℝ[X]} (h : CrossLC (CoeffSeq p)) :
    CrossLC (CoeffSeq (X*p)) := by
  rw [coeffSeq_X_mul]
  exact crossLC_shift h (-1)

theorem crossLC_binomial (n : ℕ) : CrossLC (CoeffSeq ((1+X)^n)) := by
  have h := crossLC_pascal (crossLC_quad (A:=1) (B:=0) (C:=0)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num)) n
  rw [← coeffSeq_quadratic, ← coeffSeq_binomial_mul] at h
  simpa [Quadratic] using h

theorem crossLC_X_pow_binomial (a n : ℕ) :
    CrossLC (CoeffSeq (X^a*(1+X)^n)) := by
  induction a with
  | zero => simpa using crossLC_binomial n
  | succ a ih => simpa [pow_succ', mul_assoc] using crossLC_X_mul ih

/-- Universal log-concavity of the j=0 boundary of every generated numerator. -/
theorem boundary_logConcave (path : List Bool) (k : ℤ) :
    let f := CoeffSeq (edgeEval (frame path).mid.p)
    f (k-1)*f (k+1) ≤ f k^2 := by
  dsimp only
  rw [boundary_formula]
  simpa [add_comm] using crossLC_adjacent
    (crossLC_X_pow_binomial (frame path).mid.a ((frame path).mid.b-1)) k

theorem edgeEval_coeff (P : BiPoly) (i : ℕ) :
    (edgeEval P).coeff i = (coeff P i 0 : ℝ) := by
  simp [edgeEval, coeff, ← Polynomial.coeff_zero_eq_eval_zero]

/-- The same universal result, stated literally in the target's raw coefficients. -/
theorem boundary_raw_logConcave (path : List Bool) (i : ℕ) :
    coeff (frame path).mid.p i 0 * coeff (frame path).mid.p (i+2) 0 ≤
      coeff (frame path).mid.p (i+1) 0 ^ 2 := by
  have h := boundary_logConcave path (↑i+1)
  dsimp only at h
  have hn : ¬ (↑i : ℤ) < 0 := by omega
  have hn1 : ¬ (↑i+1 : ℤ) < 0 := by omega
  have hn2 : ¬ (↑i+1+1 : ℤ) < 0 := by omega
  simp only [CoeffSeq, add_sub_cancel_right, hn, hn1, hn2, if_false,
    Int.toNat_natCast, edgeEval_coeff] at h
  exact_mod_cast h

end
end MathGKM.Markov
