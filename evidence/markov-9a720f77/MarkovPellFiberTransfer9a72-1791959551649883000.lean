import MarkovPellHorizontalSum9a72
/-! Machine-authored 9a720f77. Conditional coefficientwise-pair transfer.
The fiber inequality is an explicit UNPROVED premise, not an axiom. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def horizontalFiberPoly9a72 (n j s : ℕ) : Polynomial ℤ :=
 ∑ q ∈ Finset.range (n+2), monomial q (horizontalTerm9a72 (n+1) j q s)

theorem horizontalFiber_eval9a72 (n j s : ℕ) :
 (horizontalFiberPoly9a72 n j s).eval 1=
 ∑ q ∈ Finset.range (n+2), horizontalTerm9a72 (n+1) j q s := by
 simp [horizontalFiberPoly9a72,Polynomial.eval_finset_sum]

def HorizontalFiberGoal9a72 : Prop := ∀ n j s : ℕ, s+2 ≤ n → ∀ k : ℕ,
 0 ≤ ((horizontalFiberPoly9a72 n j (s+1))^2-
   horizontalFiberPoly9a72 n j s*horizontalFiberPoly9a72 n j (s+2)).coeff k

theorem eval_one_nonneg9a72 (p : Polynomial ℤ) (h : ∀ k, 0 ≤ p.coeff k) :
 0 ≤ p.eval 1 := by
 rw [Polynomial.eval_eq_sum,Polynomial.sum_def]
 apply Finset.sum_nonneg
 intro k hk
 simpa using h k

theorem right_horizontal_of_fiber9a72 (h : HorizontalFiberGoal9a72)
 (n i j : ℕ) (h0 : InPolygon (n+1) (n+2) i j)
 (h2 : InPolygon (n+1) (n+2) (i+2) j) :
 coeff (frame (List.replicate n true)).mid.p i j*
 coeff (frame (List.replicate n true)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true)).mid.p (i+1) j^2 := by
 by_cases hj : j=0
 · subst j
   exact boundary_raw_logConcave _ i
 · have hlo : n+2 ≤ i+j := by
     have hl := h0.1
     by_contra hh
     have he : i+j ≤ n+1 := by omega
     have hm := Nat.mul_le_mul_left (n+2) he
     have hjpos : 0<j := by omega
     nlinarith
   have hhi : i+j+2 ≤ 2*n+2 := by have := h2.2; omega
   let s := i+j-(n+2)
   have hs : s+2 ≤ n := by dsimp [s]; omega
   have he : i+j=n+s+2 := by dsimp [s]; omega
   rw [right_horizontal_sum_fixed9a72 n i j s (by omega) he,
     right_horizontal_sum_fixed9a72 n (i+2) j (s+2) hs (by omega),
     right_horizontal_sum_fixed9a72 n (i+1) j (s+1) (by omega) (by omega)]
   have hh := eval_one_nonneg9a72 _ (h n j s hs)
   simp only [Polynomial.eval_sub,Polynomial.eval_pow,Polynomial.eval_mul,
     horizontalFiber_eval9a72] at hh
   linarith

theorem source_near_one_horizontal_of_fiber9a72 (h : HorizontalFiberGoal9a72)
 (path : List Bool) (hb : (frame path).mid.b=(frame path).mid.a+1)
 (i j : ℕ) (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1,(right_labels650 n).2] at h0 h2
 exact right_horizontal_of_fiber9a72 h n i j h0 h2

#print axioms right_horizontal_of_fiber9a72
#print axioms source_near_one_horizontal_of_fiber9a72
end
end MathGKM.Markov
