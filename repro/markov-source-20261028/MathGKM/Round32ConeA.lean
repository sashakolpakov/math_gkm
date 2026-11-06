import MathGKM.Round31ExpansionA
import MathGKM.Round29BinomialA

/-! Machine-authored round32: guarded residual cone; immutable trial v0. -/
namespace SmoothingR32
open MathGKM.Markov RightExpansionR31
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 500000

def a (n h s : ℕ) : ℤ :=
  if s ≤ n-h then ((h+s).choose h : ℤ)*((n-s-1).choose (h-1) : ℤ) else 0

def spec : BiPoly →+* Polynomial ℤ := Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ))

theorem spec_residual (n h s : ℕ) :
    (spec (RightExpansionR31.residual n h)).coeff s = a n h s := by
  classical
  have term (c : ℤ) (i j : ℕ) : spec ((c : BiPoly)*U^i*V^j) =
      Polynomial.monomial i c := by
    simp [spec,U,V,← Polynomial.C_mul_X_pow_eq_monomial]
  unfold RightExpansionR31.residual
  simp only [map_sum]
  have ht (t : ℕ) :
      spec (((((h+t).choose h : ℤ)*((n-t-1).choose (h-1) : ℤ)) : BiPoly)*U^t*V^(n-h-t)) =
      Polynomial.monomial t (((h+t).choose h : ℤ)*((n-t-1).choose (h-1) : ℤ)) := by
    simpa only [Int.cast_mul] using
      (term (((h+t).choose h : ℤ)*((n-t-1).choose (h-1) : ℤ)) t (n-h-t))
  simp_rw [ht]
  rw [Polynomial.finsetSum_coeff]
  by_cases hs : s≤n-h
  · rw [Finset.sum_eq_single s]
    · simp [a,hs]
    · intro t ht hts
      simp [Polynomial.coeff_monomial,hts]
    · intro hn
      exact False.elim (hn (Finset.mem_range.mpr (by omega)))
  · have hz : (∑ t ∈ Finset.range (n-h+1),
        (Polynomial.monomial t (((h+t).choose h : ℤ)*((n-t-1).choose (h-1) : ℤ))).coeff s)=0 := by
      apply Finset.sum_eq_zero
      intro t ht
      have hn : t≠s := by have := Finset.mem_range.mp ht; omega
      simp [Polynomial.coeff_monomial,hn]
    simpa [a,hs] using hz

theorem a_nonneg (n h s : ℕ) : 0≤a n h s := by
  unfold a
  split_ifs <;> positivity

theorem a_pos (n h s : ℕ) (hh : 1≤h) (hn : h≤n) :
    0<a n h s ↔ s≤n-h := by
  by_cases hs : s≤n-h
  · simp only [a,if_pos hs,hs,iff_true]
    apply mul_pos
    · exact_mod_cast Nat.choose_pos (by omega : h≤h+s)
    · exact_mod_cast Nat.choose_pos (by omega : h-1≤n-s-1)
  · simp [a,hs]

theorem a_interval (n h : ℕ) (hh : 1≤h) (hn : h≤n) :
    ∀ i j k, i<j → j<k → 0<a n h i → 0<a n h k → 0<a n h j := by
  intro i j k hij hjk hi hk
  apply (a_pos n h j hh hn).mpr
  have := (a_pos n h k hh hn).mp hk
  omega

theorem a_lc (n h : ℕ) (hh : 1≤h) (hn : h≤n) (s : ℕ) :
    a n h s*a n h (s+2)≤a n h (s+1)^2 := by
  by_cases hs : s+2≤n-h
  · have es0 : n-s-1=(n-s-3)+2 := by omega
    have es1 : n-(s+1)-1=(n-s-3)+1 := by omega
    have es2 : n-(s+2)-1=n-s-3 := by omega
    have hp := EndpointR29.upper_lc (h+s) h
    have hq := EndpointR29.upper_lc (n-s-3) (h-1)
    simp only [a,if_pos (show s≤n-h by omega),if_pos hs,
      if_pos (show s+1≤n-h by omega),es0,es1,es2]
    have he1 : h+(s+1)=h+s+1 := by omega
    have he2 : h+(s+2)=h+s+2 := by omega
    rw [he1,he2]
    apply EndpointR29.product_lc <;> try positivity
    · exact hp
    · simpa [mul_comm] using hq
  · have hz : a n h (s+2)=0 := by simp [a,hs]
    rw [hz,mul_zero]
    exact sq_nonneg _

theorem residual_cone (n h : ℕ) (hh : 1≤h) (hn : h≤n) :
    (∀ s, (spec (RightExpansionR31.residual n h)).coeff s=a n h s) ∧
    (∀ s, 0≤(spec (RightExpansionR31.residual n h)).coeff s) ∧
    (∀ i j k, i<j → j<k → 0<(spec (RightExpansionR31.residual n h)).coeff i →
      0<(spec (RightExpansionR31.residual n h)).coeff k → 0<(spec (RightExpansionR31.residual n h)).coeff j) ∧
    (∀ s, (spec (RightExpansionR31.residual n h)).coeff s*(spec (RightExpansionR31.residual n h)).coeff (s+2)≤
      (spec (RightExpansionR31.residual n h)).coeff (s+1)^2) := by
  refine ⟨spec_residual n h,?_,?_,?_⟩
  · simpa only [spec_residual] using a_nonneg n h
  · simpa only [spec_residual] using a_interval n h hh hn
  · simpa only [spec_residual] using a_lc n h hh hn

end
end SmoothingR32
