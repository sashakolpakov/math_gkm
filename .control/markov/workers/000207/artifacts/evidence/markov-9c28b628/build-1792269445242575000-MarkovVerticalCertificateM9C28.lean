import MarkovVerticalExpressionM9C28
/-! Machine-authored request 9c28b628. Kernel-computed polynomial signs for
the whole vertical column four; generic sign-to-mass transfer is universal. -/
namespace MathGKM.Markov
set_option maxHeartbeats 8000000

def VerticalMassLCM9C28 (c : ℕ) : Prop :=
 (∀ x h r, vLowMassM9C28 c x h 0 r*vLowMassM9C28 c x h 2 r ≤ vLowMassM9C28 c x h 1 r^2) ∧
 (∀ x h r, vUpperMassM9C28 c x h 0 r*vUpperMassM9C28 c x h 2 r ≤ vUpperMassM9C28 c x h 1 r^2) ∧
 (∀ n s r, vEntryMassM9C28 c n 0 s r*vEntryMassM9C28 c n 2 s r ≤ vEntryMassM9C28 c n 1 s r^2) ∧
 (∀ n s r, vExitMassM9C28 c n 0 s r*vExitMassM9C28 c n 2 s r ≤ vExitMassM9C28 c n 1 s r^2)

def VerticalSignsM9C28 (c : ℕ) : Prop :=
 (∀ upper r, denseNonnegM6C0 (exprDenseM6C0 (vGapExprM9C28 c upper r))) ∧
 (∀ exit s r, denseNonnegM6C0 (exprDenseM6C0 (vBoundaryGapExprM9C28 c exit s r)))

set_option maxHeartbeats 600000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem vertical_signs_zeroM9C28 : VerticalSignsM9C28 0 := by
 constructor
 · intro u r
   cases u <;> cases r <;> decide +kernel
 · intro e s r
   cases e <;> cases s <;> cases r <;> decide +kernel

theorem vertical_signs_to_massM9C28 (c : ℕ) (hc : VerticalSignsM9C28 c) :
 VerticalMassLCM9C28 c := by
 refine ⟨?_,?_,?_,?_⟩
 · intro x h r
   have he := expr_nonneg_certificateM6C0 _ (hc.1 false r) (x:ℚ) (h:ℚ) (by positivity) (by positivity)
   simp only [vGapExprM9C28,Bool.false_eq_true,if_false,if_true,exprEvalM6C0,
     vlow_expr_natM9C28 c x h 0 r (by omega),vlow_expr_natM9C28 c x h 1 r (by omega),vlow_expr_natM9C28 c x h 2 r (by omega)] at he
   have hh : (vLowMassM9C28 c x h 0 r:ℚ)*(vLowMassM9C28 c x h 2 r:ℚ) ≤ (vLowMassM9C28 c x h 1 r:ℚ)^2 := by
     nlinarith only [he]
   exact_mod_cast hh
 · intro x h r
   have he := expr_nonneg_certificateM6C0 _ (hc.1 true r) (x:ℚ) (h:ℚ) (by positivity) (by positivity)
   simp only [vGapExprM9C28,Bool.false_eq_true,if_false,if_true,exprEvalM6C0,
     vupper_expr_natM9C28 c x h 0 r (by omega),vupper_expr_natM9C28 c x h 1 r (by omega),vupper_expr_natM9C28 c x h 2 r (by omega)] at he
   have hh : (vUpperMassM9C28 c x h 0 r:ℚ)*(vUpperMassM9C28 c x h 2 r:ℚ) ≤ (vUpperMassM9C28 c x h 1 r:ℚ)^2 := by
     nlinarith only [he]
   exact_mod_cast hh
 · intro n s r
   have he := expr_nonneg_certificateM6C0 _ (hc.2 false s r) (n:ℚ) 0 (by positivity) (by norm_num)
   simp only [vBoundaryGapExprM9C28,Bool.false_eq_true,if_false,if_true,exprEvalM6C0,
     ventry_expr_natM9C28 c n 0 s r (by omega),ventry_expr_natM9C28 c n 1 s r (by omega),ventry_expr_natM9C28 c n 2 s r (by omega)] at he
   have hh : (vEntryMassM9C28 c n 0 s r:ℚ)*(vEntryMassM9C28 c n 2 s r:ℚ) ≤ (vEntryMassM9C28 c n 1 s r:ℚ)^2 := by
     nlinarith only [he]
   exact_mod_cast hh
 · intro n s r
   have he := expr_nonneg_certificateM6C0 _ (hc.2 true s r) (n:ℚ) 0 (by positivity) (by norm_num)
   simp only [vBoundaryGapExprM9C28,Bool.false_eq_true,if_false,if_true,exprEvalM6C0,
     vexit_expr_natM9C28 c n 0 s r (by omega),vexit_expr_natM9C28 c n 1 s r (by omega),vexit_expr_natM9C28 c n 2 s r (by omega)] at he
   have hh : (vExitMassM9C28 c n 0 s r:ℚ)*(vExitMassM9C28 c n 2 s r:ℚ) ≤ (vExitMassM9C28 c n 1 s r:ℚ)^2 := by
     nlinarith only [he]
   exact_mod_cast hh

theorem vertical_mass_zeroM9C28 : VerticalMassLCM9C28 0 :=
 vertical_signs_to_massM9C28 0 vertical_signs_zeroM9C28

end MathGKM.Markov

