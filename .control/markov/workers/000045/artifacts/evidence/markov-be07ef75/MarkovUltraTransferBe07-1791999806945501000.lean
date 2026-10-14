import MarkovThreeCharge863a
/-! Machine-authored be07ef75. A stronger UNPROVED aggregate predicate and
its exact implication to raw Pell horizontal coefficients. No root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def UltraHorizontalFiberGoalBe07 : Prop := ∀ n j s : ℕ, s+2 ≤ n → ∀ k : ℕ,
 (s+3 : ℤ)*(n-s)*
   (horizontalFiberPoly9a72 n j s*horizontalFiberPoly9a72 n j (s+2)).coeff k ≤
 (s+2 : ℤ)*(n-s-1)*(horizontalFiberPoly9a72 n j (s+1)^2).coeff k

theorem horizontal_fiber_coeff_nonnegBe07 (n j s k : ℕ) :
 0 ≤ (horizontalFiberPoly9a72 n j s).coeff k := by
 rw [← truncated_zero65c4,truncated_coeff_unbounded863]
 simp only [Nat.zero_le,if_true]
 unfold horizontalTerm9a72
 split_ifs <;> positivity

theorem fiber_of_ultraBe07 (h : UltraHorizontalFiberGoalBe07) :
 HorizontalFiberGoal9a72 := by
 intro n j s hs k
 have he := h n j s hs k
 have hp : 0 ≤ (horizontalFiberPoly9a72 n j s*
     horizontalFiberPoly9a72 n j (s+2)).coeff k := by
   rw [Polynomial.coeff_mul]
   apply Finset.sum_nonneg
   intro x hx
   exact mul_nonneg (horizontal_fiber_coeff_nonnegBe07 _ _ _ _)
     (horizontal_fiber_coeff_nonnegBe07 _ _ _ _)
 have ha : (0:ℤ)<(s+2)*(n-s-1) := by
   have hn : (0:ℤ)<n-s-1 := by omega
   positivity
 have hd : (s+3 : ℤ)*(n-s)-(s+2)*(n-s-1)=n+2 := by ring
 have hc : (s+2 : ℤ)*(n-s-1) ≤ (s+3)*(n-s) := by nlinarith
 have hb := mul_le_mul_of_nonneg_right hc hp
 have hh : (s+2 : ℤ)*(n-s-1)*
     (horizontalFiberPoly9a72 n j s*horizontalFiberPoly9a72 n j (s+2)).coeff k ≤
     (s+2 : ℤ)*(n-s-1)*(horizontalFiberPoly9a72 n j (s+1)^2).coeff k :=
   le_trans hb he
 rw [Polynomial.coeff_sub]
 exact sub_nonneg.mpr ((mul_le_mul_iff_right₀ ha).mp hh)

theorem source_horizontal_of_ultraBe07 (h : UltraHorizontalFiberGoalBe07)
 (path : List Bool) (hb : (frame path).mid.b=(frame path).mid.a+1)
 (i j : ℕ) (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 :=
 source_near_one_horizontal_of_fiber9a72 (fiber_of_ultraBe07 h) path hb i j h0 h2

#print axioms fiber_of_ultraBe07
#print axioms source_horizontal_of_ultraBe07
end
end MathGKM.Markov
