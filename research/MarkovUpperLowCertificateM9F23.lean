import MarkovUpperSourceM9F23
import MarkovMiddleExpressionM6C0
import MarkovCentralRationalME10
/-! Machine-authored 9f234835. A finite algebraic certificate in two unbounded
parameters for the upper diagonal starting at physical column three. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def topExprM9F23 (h T : PolyExprM6C0) (c : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c (Nat.fast_choose (c+l) c:ℚ) *ₑ
   chooseExprM6C0 (h +ₑ .c (2*c+4)) (c+3-l) *ₑ
   (chooseExprM6C0 T (c+l) +ₑ .c 4 *ₑ chooseExprM6C0 (T +ₑ .c 1) (c+l+2))) (c+4)

theorem top_expr_evalM9F23 (x y : ℚ) (h T : PolyExprM6C0) (c : ℕ) :
 exprEvalM6C0 x y (topExprM9F23 h T c)=
 topShortQME10 (exprEvalM6C0 x y h) (exprEvalM6C0 x y T) c := by
 simp only [topExprM9F23,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,
   topShortQME10,←Nat.choose_eq_fast_choose,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   add_assoc]

def upperLowGapExprM9F23 : PolyExprM6C0 :=
 let a := topExprM9F23 (.x +ₑ .c 4) .k 0
 let b := topExprM9F23 (.x +ₑ .c 2) (.k +ₑ .c 1) 1
 let c := topExprM9F23 .x (.k +ₑ .c 2) 2
 b *ₑ b +ₑ .c (-1) *ₑ (a *ₑ c)

theorem upper_low_gap_evalM9F23 (h T : ℚ) :
 exprEvalM6C0 h T upperLowGapExprM9F23=
 topShortQME10 (h+2) (T+1) 1^2-
 topShortQME10 (h+4) T 0*topShortQME10 h (T+2) 2 := by
 simp only [upperLowGapExprM9F23,exprEvalM6C0,top_expr_evalM9F23]
 ring

set_option maxHeartbeats 400000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem upper_low_certificateM9F23 :
 denseNonnegM6C0 (exprDenseM6C0 upperLowGapExprM9F23) := by decide +kernel

theorem upper_low_mass_lcM9F23 (h T : ℕ) :
 topMassME10 (h+4) T 0*topMassME10 h (T+2) 2 ≤
 topMassME10 (h+2) (T+1) 1^2 := by
 have he := expr_nonneg_certificateM6C0 _ upper_low_certificateM9F23 (h:ℚ) (T:ℚ)
   (by positivity) (by positivity)
 rw [upper_low_gap_evalM9F23] at he
 have hs (a b c : ℕ) : topShortQME10 (a:ℚ) (b:ℚ) c=(topMassME10 a b c:ℚ) := by
   rw [←top_short_castME10,←top_shift_shortME10]
 have h0 := hs (h+4) T 0
 have h1 := hs (h+2) (T+1) 1
 have h2 := hs h (T+2) 2
 push_cast at h0 h1 h2
 rw [h0,h1,h2] at he
 have hh := sub_nonneg.mp he
 exact_mod_cast hh

end MathGKM.Markov
