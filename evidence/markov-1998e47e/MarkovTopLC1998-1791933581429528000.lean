import MarkovTop1998
import MathGKM.MarkovBoundary

/-! Machine-authored worker 1998e47e. Raw top-diagonal inequality. -/
namespace MathGKM.Markov
noncomputable section

theorem choose_raw_lc1998 (d i : ℕ) :
    (d.choose i : ℤ) * d.choose (i+2) ≤ (d.choose (i+1) : ℤ)^2 := by
  have h := crossLC_adjacent (crossLC_binomial d) (↑i+1)
  have hn : ¬ (↑i : ℤ) < 0 := by omega
  have hn1 : ¬ (↑i+1 : ℤ) < 0 := by omega
  have hn2 : ¬ (↑i+1+1 : ℤ) < 0 := by omega
  simp only [CoeffSeq, add_sub_cancel_right, hn, hn1, hn2, if_false,
    Int.toNat_natCast, Polynomial.coeff_one_add_X_pow] at h
  exact_mod_cast h

/-- The literal third-direction triple, on the top face, for every finite path. -/
theorem top_raw_logConcave1998 (path : List Bool) (i j : ℕ)
    (h : i+j+2=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2) * coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  rw [top_raw_coeff1998 path i (j+2) (by omega),
    top_raw_coeff1998 path (i+2) j (by omega),
    top_raw_coeff1998 path (i+1) (j+1) (by omega)]
  exact choose_raw_lc1998 _ _

theorem top_raw_positive1998 (path : List Bool) (i j : ℕ)
    (h : i+j=(frame path).mid.a+(frame path).mid.b-1) :
    0 < coeff (frame path).mid.p i j := by
  rw [top_raw_coeff1998 path i j h]
  exact_mod_cast Nat.choose_pos (show i ≤ (frame path).mid.a+(frame path).mid.b-1 by omega)

theorem top_in_polygon1998 (path : List Bool) (i j : ℕ)
    (h : i+j=(frame path).mid.a+(frame path).mid.b-1) :
    InPolygon (frame path).mid.a (frame path).mid.b i j := by
  obtain ⟨ha,hab,_⟩ := frame_reduced path
  constructor
  · have hd : (frame path).mid.b ≤ i+j := by omega
    have h1 := Nat.mul_le_mul_left (frame path).mid.a hd
    have h2 := Nat.mul_le_mul_right i (Nat.le_of_lt hab)
    nlinarith
  · omega

/-- Upper support bound together with an attained exponent of that degree. -/
theorem total_degree_exact1998 (path : List Bool) :
    let d := (frame path).mid.a+(frame path).mid.b-1
    DegreeBound21a (frame path).mid.p d ∧
      ∃ i j, i+j=d ∧ coeff (frame path).mid.p i j ≠ 0 := by
  dsimp only
  refine ⟨(degree_frame_21a path).2.1, 0, _, by omega, ?_⟩
  rw [(top_vertices1998 path).1]
  norm_num

#print axioms choose_raw_lc1998
#print axioms top_raw_logConcave1998
#print axioms top_raw_positive1998
#print axioms top_in_polygon1998
#print axioms total_degree_exact1998
end
end MathGKM.Markov
