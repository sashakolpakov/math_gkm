import MarkovPellFiberTransfer9a72
import MarkovAbel65c4
/-! Machine-authored 65c4dfb8. LC-positivity candidate for the exact Pell
horizontal fiber array. It is a definition, not a new axiom or a proof.
The source implication covers b=a+1 only, and only horizontal triples. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

def truncatedFiber65c4 (n j s r : ℕ) : Polynomial ℤ :=
 ∑ q ∈ range (n+2), if r ≤ q then
   monomial q (horizontalTerm9a72 (n+1) j q s) else 0

theorem truncated_zero65c4 (n j s : ℕ) :
 truncatedFiber65c4 n j s 0=horizontalFiberPoly9a72 n j s := by
 simp [truncatedFiber65c4,horizontalFiberPoly9a72]

def TruncatedHorizontalGoal65c4 : Prop := ∀ n j s r : ℕ, s+2 ≤ n → ∀ k : ℕ,
 0 ≤ ((truncatedFiber65c4 n j (s+1) r)^2-
   truncatedFiber65c4 n j s r*truncatedFiber65c4 n j (s+2) r).coeff k

theorem fiber_of_truncated65c4 (h : TruncatedHorizontalGoal65c4) :
 HorizontalFiberGoal9a72 := by
 intro n j s hs k
 simpa only [truncated_zero65c4] using h n j s 0 hs k

theorem source_horizontal_of_truncated65c4 (h : TruncatedHorizontalGoal65c4)
 (path : List Bool) (hb : (frame path).mid.b=(frame path).mid.a+1)
 (i j : ℕ) (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 :=
 source_near_one_horizontal_of_fiber9a72 (fiber_of_truncated65c4 h) path hb i j h0 h2

theorem truncated_coeff65c4 (n j s r k : ℕ) :
 (truncatedFiber65c4 n j s r).coeff k =
 if k<n+2 ∧ r ≤ k then horizontalTerm9a72 (n+1) j k s else 0 := by
 classical
 simp only [truncatedFiber65c4,finsetSum_coeff]
 by_cases hk : k<n+2
 · rw [sum_eq_single k]
   · simp only [hk,true_and]
     split_ifs <;> simp [coeff_monomial]
   · intro q hq hne
     split_ifs <;> simp [coeff_monomial,hne]
   · simp [mem_range,hk]
 · rw [sum_eq_zero]
   · simp [hk]
   · intro q hq
     have hne : q ≠ k := by have := mem_range.mp hq; omega
     split_ifs <;> simp [coeff_monomial,hne]

/-- Exact unsymmetrized convolution identity; it keeps all zero summands and
both cutoff guards. The centered experiments regroup this same finite sum. -/
theorem truncated_gap_coeff65c4 (n j s r k : ℕ) :
 ((truncatedFiber65c4 n j (s+1) r)^2-
   truncatedFiber65c4 n j s r*truncatedFiber65c4 n j (s+2) r).coeff k =
 ∑ q ∈ range (k+1), (
   (truncatedFiber65c4 n j (s+1) r).coeff q *
     (truncatedFiber65c4 n j (s+1) r).coeff (k-q) -
   (truncatedFiber65c4 n j s r).coeff q *
     (truncatedFiber65c4 n j (s+2) r).coeff (k-q)) := by
 rw [Polynomial.coeff_sub,pow_two,Polynomial.coeff_mul,Polynomial.coeff_mul]
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
     Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,← sum_sub_distrib]

/-- Signed outer layer [-15] and center layer [64] at a=3,j=2,center excess=2.
The negative layer is not a coefficient or source LC counterexample. -/
theorem signed_layer_example65c4 :
 2*horizontalTerm9a72 3 2 0 1*horizontalTerm9a72 3 2 2 1-
   horizontalTerm9a72 3 2 0 0*horizontalTerm9a72 3 2 2 2-
   horizontalTerm9a72 3 2 0 2*horizontalTerm9a72 3 2 2 0 = -15 ∧
 horizontalTerm9a72 3 2 1 1^2-
   horizontalTerm9a72 3 2 1 0*horizontalTerm9a72 3 2 1 2 =64 := by
 norm_num [horizontalTerm9a72,Nat.choose]

theorem example_truncations65c4 (r : ℕ) :
 0 ≤ ((truncatedFiber65c4 2 2 1 r)^2-
   truncatedFiber65c4 2 2 0 r*truncatedFiber65c4 2 2 2 r).coeff 2 := by
 rw [truncated_gap_coeff65c4]
 simp only [sum_range_succ,sum_range_zero,zero_add,truncated_coeff65c4]
 by_cases h0 : r=0
 · subst r
   norm_num [horizontalTerm9a72,Nat.choose]
 · by_cases h1 : r=1
   · subst r
     norm_num [horizontalTerm9a72,Nat.choose]
   · have h2 : 2 ≤ r := by omega
     norm_num [show ¬ r ≤ 0 by omega,show ¬ r ≤ 1 by omega,
       horizontalTerm9a72,Nat.choose]

#print axioms source_horizontal_of_truncated65c4
#print axioms truncated_coeff65c4
#print axioms truncated_gap_coeff65c4
#print axioms signed_layer_example65c4
#print axioms example_truncations65c4
end
end MathGKM.Markov
