import MarkovPolygon18
import MarkovTop1998

/-! Machine-authored worker 18ae9bbc. Every defining polygon vertex is in
the raw support. This does not assert positivity at every lattice point. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem weighted_min_attained18 (path : List Bool) (m n : ℕ) :
    ∃ i j, coeff (frame path).mid.p i j≠0 ∧
      m*i+n*j=min ((frame path).mid.a*m) ((frame path).mid.b*n) := by
  have hz := (weighted_frame_good18 m n path).2.1.2
  have hc := coeff_natTrailingDegree_ne_zero.mpr hz
  rw [(weighted_orders18 m n path).2.1,weighted_coeff18] at hc
  obtain ⟨i,hi,hs⟩ := Finset.exists_ne_zero_of_sum_ne_zero hc
  obtain ⟨j,hj,hc⟩ := Finset.exists_ne_zero_of_sum_ne_zero hs
  split_ifs at hc with he
  · exact ⟨i,j,hc,he⟩
  · exact False.elim (hc rfl)

theorem lower_vertices_positive18 (path : List Bool) :
    0 < coeff (frame path).mid.p (frame path).mid.a 0 ∧
      0 < coeff (frame path).mid.p 0 (frame path).mid.b := by
  let a := (frame path).mid.a
  let b := (frame path).mid.b
  have ha : 0<a := (frame_reduced path).1
  have hb : 0<b := lt_trans ha (frame_reduced path).2.1
  constructor
  · obtain ⟨i,j,hc,he⟩ := weighted_min_attained18 path b (a+1)
    change b*i+(a+1)*j=min (a*b) (b*(a+1)) at he
    have hm : min (a*b) (b*(a+1))=a*b := min_eq_left (by nlinarith)
    rw [hm] at he
    have hs := raw_lower_support18 path i j hc
    change a*b≤b*i+a*j at hs
    have hj : j=0 := by nlinarith
    subst j
    have hi : i=a := by nlinarith
    subst i
    exact lt_of_le_of_ne (raw_coeff_nonneg18 path a 0) (Ne.symm hc)
  · obtain ⟨i,j,hc,he⟩ := weighted_min_attained18 path (b+1) a
    change (b+1)*i+a*j=min (a*(b+1)) (b*a) at he
    have hm : min (a*(b+1)) (b*a)=a*b := by rw [min_eq_right (by nlinarith)]; ring
    rw [hm] at he
    have hs := raw_lower_support18 path i j hc
    change a*b≤b*i+a*j at hs
    have hi : i=0 := by nlinarith
    subst i
    have hj : j=b := by nlinarith
    subst j
    exact lt_of_le_of_ne (raw_coeff_nonneg18 path 0 b) (Ne.symm hc)

/-- Nonnegative coefficients, exact support containment, and positivity of
all four defining vertices, simultaneously and without a rational cutoff. -/
theorem polygon_certificate18 (path : List Bool) :
    let l := (frame path).mid
    (∀ i j, 0 ≤ coeff l.p i j) ∧
    (∀ i j, coeff l.p i j≠0 → InPolygon l.a l.b i j) ∧
    0 < coeff l.p l.a 0 ∧ 0 < coeff l.p 0 l.b ∧
    coeff l.p (l.a+l.b-1) 0=1 ∧ coeff l.p 0 (l.a+l.b-1)=1 := by
  dsimp only
  refine ⟨raw_coeff_nonneg18 path,?_,(lower_vertices_positive18 path).1,
    (lower_vertices_positive18 path).2,(top_vertices1998 path).2,(top_vertices1998 path).1⟩
  intro i j hc
  by_contra h
  exact hc (raw_outside_polygon18 path i j h)

#print axioms weighted_min_attained18
#print axioms lower_vertices_positive18
#print axioms polygon_certificate18
end
end MathGKM.Markov
