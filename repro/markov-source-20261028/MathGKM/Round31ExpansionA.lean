import MathGKM.Round30RightLiftA
import MathGKM.Acceptedca243b91dcc504ccd59a3d76

/-! Machine-authored finite expansion attempt, round31. -/
namespace RightExpansionR31
open MathGKM.Markov RightR30 RightLiftR30
noncomputable section
open scoped BigOperators
set_option maxHeartbeats 2000000

theorem endpoint_bound (n i j : ℕ) (h : n < i+j) : coeff (RenewalR28.P n) i j=0 := by
  rw [RenewalR28.coefficient_formula]
  unfold RenewalR28.mc
  split_ifs <;> omega

theorem H_rect (P : BiPoly) (n : ℕ)
    (hb : ∀ i j, n < i+j → coeff P i j=0) :
    H P n = ∑ i ∈ Finset.range (n+1), ∑ j ∈ Finset.range (n+1),
      Polynomial.monomial i (Polynomial.monomial j
        (Polynomial.monomial (n-i-j) (coeff P i j))) := by
  classical
  have hs : P.support ⊆ Finset.range (n+1) := by
    intro i hi
    apply Finset.mem_range.mpr
    by_contra hn
    have hz : P.coeff i=0 := by
      ext j
      exact hb i j (by omega)
    exact (Polynomial.mem_support_iff.mp hi) hz
  unfold H
  rw [Finset.sum_subset hs]
  · apply Finset.sum_congr rfl
    intro i hi
    have ht : (P.coeff i).support ⊆ Finset.range (n+1) := by
      intro j hj
      apply Finset.mem_range.mpr
      by_contra hn
      exact (Polynomial.mem_support_iff.mp hj) (hb i j (by omega))
    rw [Finset.sum_subset ht]
    · simp only [map_sum]
    · intro j hj hj'
      have hz : coeff P i j=0 := by
        simpa only [coeff,Polynomial.mem_support_iff,not_not] using hj'
      simp [hz]
  · intro i hi hi'
    have hz : P.coeff i=0 := by
      simpa only [Polynomial.mem_support_iff,not_not] using hi'
    simp [hz]

theorem ev_monomial (i j l : ℕ) (c : ℤ) :
    ev (Polynomial.monomial i (Polynomial.monomial j (Polynomial.monomial l c))) =
      (c : BiPoly)*T^(2*i)*U^j*V^l := by
  simp only [ev,Polynomial.coe_eval₂RingHom,Polynomial.eval₂_monomial,
    Int.castRingHom]
  change (c : BiPoly)*V^l*U^j*(T^2)^i = _
  rw [pow_mul]
  ring

theorem right_rect (k : ℕ) : M k =
    ∑ h ∈ Finset.range (k+2), ∑ s ∈ Finset.range (k+2),
      (RenewalR28.mc (k+1) h s : BiPoly)*T^(2*h)*U^s*V^(k+1-h-s) := by
  rw [right_lift,H_rect _ _ (endpoint_bound (k+1))]
  simp only [map_sum,ev_monomial,RenewalR28.coefficient_formula]

def residual (n h : ℕ) : BiPoly := ∑ s ∈ Finset.range (n-h+1),
  (((h+s).choose h : ℤ)*((n-s-1).choose (h-1) : ℤ) : BiPoly)*U^s*V^(n-h-s)

theorem row_zero (n : ℕ) :
    (∑ s ∈ Finset.range (n+1),
      (RenewalR28.mc n 0 s : BiPoly)*T^(2*0)*U^s*V^(n-0-s))=U^n := by
  classical
  rw [Finset.sum_eq_single n]
  · simp [RenewalR28.mc]
  · intro s hs hsn
    simp [RenewalR28.mc,hsn]
  · intro hn
    exact False.elim (hn (Finset.mem_range.mpr (by omega)))

theorem row_positive (n h : ℕ) (hh : 0<h) (hn : h≤n) :
    (∑ s ∈ Finset.range (n+1),
      (RenewalR28.mc n h s : BiPoly)*T^(2*h)*U^s*V^(n-h-s)) =
      T^(2*h)*residual n h := by
  classical
  have hs : Finset.range (n-h+1) ⊆ Finset.range (n+1) :=
    Finset.range_mono (by omega)
  rw [← Finset.sum_subset hs]
  · unfold residual
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro s hs
    have hs' : h+s≤n := by have := Finset.mem_range.mp hs; omega
    simp only [RenewalR28.mc,ne_of_gt hh,if_false,hs',if_true]
    push_cast
    ring
  · intro s hs hs'
    have hs'' : ¬h+s≤n := by
      have := Finset.mem_range.mp hs
      have : n-h+1 ≤ s := by simpa only [Finset.mem_range,not_lt] using hs'
      omega
    simp [RenewalR28.mc,ne_of_gt hh,hs'']

theorem right_finite_expansion (k : ℕ) :
    M k=U^(k+1)+∑ t ∈ Finset.range (k+1), T^(2*(t+1))*residual (k+1) (t+1) := by
  rw [right_rect,Finset.sum_range_succ']
  rw [row_zero,add_comm]
  congr 1
  apply Finset.sum_congr rfl
  intro t ht
  exact row_positive (k+1) (t+1) (by omega) (by have := Finset.mem_range.mp ht; omega)

end
end RightExpansionR31
