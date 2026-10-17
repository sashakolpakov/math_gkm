import MarkovUnivariateCertificateM9DB
import MarkovMiddleRemainingM6C0
/-! Machine-authored 9db2326d. A uniform support-aware one-variable
certificate interface. The universal coefficient-sign premise is open. -/
namespace MathGKM.Markov
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 middleQMF8D topMassM55C middleRawMD02

def fixedShiftM9DB (k c : ℕ) (r : Bool) : ℕ := c+2-(3*k+middleBaseMD02 r)
def fixedExprM9DB (k c : ℕ) (r : Bool) : PolyExprM6C0 :=
 exprSubstM6C0 (.add .x (.c (fixedShiftM9DB k c r))) (.c k) (middleGapExprM6C0 0 r c)

theorem fixed_expr_evalM9DB (x : ℚ) (k c : ℕ) (r : Bool) :
 exprEvalM6C0 x 0 (fixedExprM9DB k c r)=
 middleQMF8D (x+fixedShiftM9DB k c r) k r (c+1)^2-
 middleQMF8D (x+fixedShiftM9DB k c r) k r c*
 middleQMF8D (x+fixedShiftM9DB k c r) k r (c+2) := by
 rw [fixedExprM9DB,expr_subst_evalM6C0]
 simp only [exprEvalM6C0,middle_gap_expr_evalM6C0,Nat.cast_zero,add_zero]

theorem middle_support_zeroM9DB (x k c : ℕ) (r : Bool)
 (hc : x+3*k+middleBaseMD02 r < c) : middleRawMD02 x k r c=0 := by
 rw [middleRawMD02,correction_short_zeroMD02 _ _ _ r (by omega),add_zero,
   ←top_mass_short_sumMEB6,top_mass_zeroM55C _ _ _ hc]

theorem middle_gap_below_shiftM9DB (x k c : ℕ) (r : Bool)
 (hx : x < fixedShiftM9DB k c r) : 0 ≤ middleGapMD02 r c x k := by
 have ht : x+3*k+middleBaseMD02 r < c+2 := by unfold fixedShiftM9DB at hx; omega
 rw [middleGapMD02,middle_support_zeroM9DB x k (c+2) r ht,mul_zero,sub_zero]
 exact sq_nonneg _

theorem fixed_one_transferM9DB (k c : ℕ) (r : Bool)
 (h : oneNonnegM9DB (fixedExprM9DB k c r)) (x : ℕ) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hx : fixedShiftM9DB k c r ≤ x
 · have hp := one_nonneg_evalM9DB _ h ((x-fixedShiftM9DB k c r:ℕ):ℚ) (by positivity)
   rw [fixed_expr_evalM9DB,←Nat.cast_add,Nat.sub_add_cancel hx] at hp
   rw [←middle_raw_castMF8D,←middle_raw_castMF8D,←middle_raw_castMF8D] at hp
   change 0 ≤ middleRawMD02 x k r (c+1)^2-
     middleRawMD02 x k r c*middleRawMD02 x k r (c+2)
   exact_mod_cast hp
 · exact middle_gap_below_shiftM9DB x k c r (by omega)

def FixedDepthSignsM9DB : Prop := ∀ k c r,
 5 ≤ c → 3 ≤ k → c < middleConeBoundM6C0 k r →
 oneNonnegM9DB (fixedExprM9DB k c r)

end MathGKM.Markov
