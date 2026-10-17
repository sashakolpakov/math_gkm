import MarkovShortKernelMBEB
import MarkovMiddleExpressionM6C0
/-! Machine-authored bebe7940. Polynomial certificates for the exceptional
base diagonal, in unbounded natural parameters. Ordinary kernel evaluation. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def liftExprMBEB (d j : PolyExprM6C0) (t : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun m => chooseExprM6C0 d (t-m) *ₑ .c (Nat.fast_choose (t+m+3) m:ℚ) *ₑ
   (chooseExprM6C0 (j +ₑ .c (t+3)) (t+m+3) +ₑ
     .c 4 *ₑ chooseExprM6C0 (j +ₑ .c (t+4)) (t+m+5))) (t+1)

theorem lift_expr_evalMBEB (x y : ℚ) (d j : PolyExprM6C0) (t : ℕ) :
 exprEvalM6C0 x y (liftExprMBEB d j t)=
 lowColumnMAE9 (2*exprEvalM6C0 x y j+1+exprEvalM6C0 x y d) (exprEvalM6C0 x y j) t := by
 simp only [liftExprMBEB,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,
   ←Nat.choose_eq_fast_choose,lowColumnMAE9]
 apply sum_congr rfl
 intro m hm
 congr 2 <;> congr 1 <;> push_cast <;> ring

def lowerGapExprMBEB : PolyExprM6C0 :=
 let a := liftExprMBEB .k (.x +ₑ .c 2) 0
 let b := liftExprMBEB (.k +ₑ .c 2) (.x +ₑ .c 1) 1
 let c := liftExprMBEB (.k +ₑ .c 4) .x 2
 b *ₑ b +ₑ .c (-1) *ₑ (a *ₑ c)

set_option maxHeartbeats 400000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem lower_gap_certificateMBEB :
 denseNonnegM6C0 (exprDenseM6C0 lowerGapExprMBEB) := by decide +kernel

theorem lower_lift_lcMBEB (j h : ℕ) :
 liftOutputMAE9 h (j+2) 0*liftOutputMAE9 (h+4) j 2 ≤
   liftOutputMAE9 (h+2) (j+1) 1^2 := by
 have he := expr_nonneg_certificateM6C0 _ lower_gap_certificateMBEB (j:ℚ) (h:ℚ)
   (by positivity) (by positivity)
 simp only [lowerGapExprMBEB,exprEvalM6C0,lift_expr_evalMBEB] at he
 have h0 := lift_output_polynomialM657 h (j+2) 0
 have h1 := lift_output_polynomialM657 (h+2) (j+1) 1
 have h2 := lift_output_polynomialM657 (h+4) j 2
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at he
 have hh : (liftOutputMAE9 h (j+2) 0:ℚ)*(liftOutputMAE9 (h+4) j 2:ℚ) ≤
   (liftOutputMAE9 (h+2) (j+1) 1:ℚ)^2 := by nlinarith only [he]
 exact_mod_cast hh

def shortExprMBEB (H : ℕ) (T : PolyExprM6C0) (t : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c (Nat.fast_choose (t+l) t:ℚ) *ₑ
   .c (Nat.fast_choose H (t+3-l):ℚ) *ₑ
   (chooseExprM6C0 T (t+l) +ₑ .c 4 *ₑ chooseExprM6C0 (T +ₑ .c 1) (t+l+2))) (t+4)

theorem short_expr_natMBEB (x y : ℚ) (H T t : ℕ) (e : PolyExprM6C0)
 (he : exprEvalM6C0 x y e=(T:ℚ)) :
 exprEvalM6C0 x y (shortExprMBEB H e t)=(shortValueMBEB H T t:ℚ) := by
 simp only [shortExprMBEB,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,
   ←Nat.choose_eq_fast_choose,he,shortValueMBEB,Int.cast_sum,Int.cast_mul,Int.cast_add,
   Int.cast_ofNat,Int.cast_natCast,choose_poly_natM0D3,Nat.cast_add,Nat.cast_one]

def shortGapExprMBEB (H shift : ℕ) : PolyExprM6C0 :=
 let T := PolyExprM6C0.x +ₑ .c shift
 let a := shortExprMBEB H T 0
 let b := shortExprMBEB H (T +ₑ .c 1) 1
 let c := shortExprMBEB H (T +ₑ .c 2) 2
 b *ₑ b +ₑ .c (-1) *ₑ (a *ₑ c)

set_option maxHeartbeats 400000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem short_gap_certificatesMBEB :
 denseNonnegM6C0 (exprDenseM6C0 (shortGapExprMBEB 4 1)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (shortGapExprMBEB 5 0)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (shortGapExprMBEB 6 0)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (shortGapExprMBEB 7 0)) := by decide +kernel

theorem short_gap_transferMBEB (H shift : ℕ)
 (hc : denseNonnegM6C0 (exprDenseM6C0 (shortGapExprMBEB H shift))) (n : ℕ) :
 shortValueMBEB H (n+shift) 0*shortValueMBEB H (n+shift+2) 2 ≤
   shortValueMBEB H (n+shift+1) 1^2 := by
 have he := expr_nonneg_certificateM6C0 _ hc (n:ℚ) 0 (by positivity) (by norm_num)
 simp only [shortGapExprMBEB,exprEvalM6C0] at he
 rw [short_expr_natMBEB _ _ H (n+shift+1) 1 _ (by simp [exprEvalM6C0]),
   short_expr_natMBEB _ _ H (n+shift) 0 _ (by simp [exprEvalM6C0]),
   short_expr_natMBEB _ _ H (n+shift+2) 2 _ (by simp [exprEvalM6C0])] at he
 have hh : (shortValueMBEB H (n+shift) 0:ℚ)*(shortValueMBEB H (n+shift+2) 2:ℚ) ≤
   (shortValueMBEB H (n+shift+1) 1:ℚ)^2 := by nlinarith only [he]
 exact_mod_cast hh

end MathGKM.Markov
