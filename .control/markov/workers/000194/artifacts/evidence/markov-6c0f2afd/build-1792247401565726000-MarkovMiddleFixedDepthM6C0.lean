import MarkovMiddleExpressionM6C0
import MarkovMiddleKernelShapeMD02
import MarkovMiddleFiveResidualMF8D
/-! Machine-authored 6c0f2afd. Support-aware exact substitution for a fixed
middle depth. Zero tails are handled before any polynomial positivity claim. -/
namespace MathGKM.Markov
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 middleQMF8D topMassM55C middleRawMD02

def exprSubstM6C0 (X K : PolyExprM6C0) : PolyExprM6C0 → PolyExprM6C0
 | .c a => .c a
 | .x => X
 | .k => K
 | .add a b => .add (exprSubstM6C0 X K a) (exprSubstM6C0 X K b)
 | .mul a b => .mul (exprSubstM6C0 X K a) (exprSubstM6C0 X K b)

theorem expr_subst_evalM6C0 (x k : ℚ) (X K e : PolyExprM6C0) :
 exprEvalM6C0 x k (exprSubstM6C0 X K e)=
 exprEvalM6C0 (exprEvalM6C0 x k X) (exprEvalM6C0 x k K) e := by
 induction e <;> simp_all [exprSubstM6C0,exprEvalM6C0]

def fixedTwoShiftM6C0 (c : ℕ) (r : Bool) : ℕ := c+2-(6+middleBaseMD02 r)
def fixedTwoExprM6C0 (c : ℕ) (r : Bool) : PolyExprM6C0 :=
 exprSubstM6C0 (.add .x (.c (fixedTwoShiftM6C0 c r))) (.c 2) (middleGapExprM6C0 0 r c)

theorem fixed_two_evalM6C0 (x : ℚ) (c : ℕ) (r : Bool) :
 exprEvalM6C0 x 0 (fixedTwoExprM6C0 c r)=
 middleQMF8D (x+fixedTwoShiftM6C0 c r) 2 r (c+1)^2-
 middleQMF8D (x+fixedTwoShiftM6C0 c r) 2 r c*
 middleQMF8D (x+fixedTwoShiftM6C0 c r) 2 r (c+2) := by
 rw [fixedTwoExprM6C0,expr_subst_evalM6C0]
 simp only [exprEvalM6C0,middle_gap_expr_evalM6C0,Nat.cast_zero,add_zero]

theorem fixed_two_transferM6C0 (c : ℕ) (r : Bool)
 (h : denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 c r))) (x : ℕ) :
 0 ≤ middleGapMD02 r c x 2 := by
 by_cases hx : fixedTwoShiftM6C0 c r ≤ x
 · have hp := expr_nonneg_certificateM6C0 _ h ((x-fixedTwoShiftM6C0 c r:ℕ):ℚ) 0
     (by positivity) (by norm_num)
   rw [fixed_two_evalM6C0,←Nat.cast_add,Nat.sub_add_cancel hx] at hp
   have he (j : ℕ) := middle_raw_castMF8D x 2 j r
   norm_num only [Nat.cast_ofNat] at he
   rw [←he (c+1),←he c,←he (c+2)] at hp
   change 0 ≤ middleRawMD02 x 2 r (c+1)^2-
     middleRawMD02 x 2 r c*middleRawMD02 x 2 r (c+2)
   exact_mod_cast hp
 · have hxt : x+3*2+middleBaseMD02 r < c+2 := by
     unfold fixedTwoShiftM6C0 at hx
     omega
   have hz : middleRawMD02 x 2 r (c+2)=0 := by
     rw [middleRawMD02,correction_short_zeroMD02 _ _ _ r (by omega),add_zero,
       ←top_mass_short_sumMEB6,top_mass_zeroM55C _ _ _ hxt]
   rw [middleGapMD02,hz,mul_zero,sub_zero]
   exact sq_nonneg _

theorem middle_gap_two_highM6C0 (c x : ℕ) (r : Bool) (hc : 17 ≤ c) :
 0 ≤ middleGapMD02 r c x 2 := by
 rw [middle_gap_sourceMD02]
 obtain ⟨hq,hk,hn⟩ := middle_parameter_domainMD02 x 2 r
 apply source_middle_wideM99A _ _ _ r hq hk hn (by omega) (by omega)
 cases r <;> simp [sourceNME9C,middleBaseMD02] <;> omega

end MathGKM.Markov
